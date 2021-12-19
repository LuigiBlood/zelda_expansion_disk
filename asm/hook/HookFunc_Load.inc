//ROM Loading Hook
ddhook_romtoram:
	//Arguments:
	//A0=z64_getfile_t* struct (see https://github.com/glankk/oot-notes/blob/master/alloc.txt#L172)
	//A1=RAM Address
	//A2=VROM Address
	//A3=Size
	//SP+10=zero
	//SP+14=notify_mq (osMesgQueue)
	//SP+18=notify_msg
	//Return:
	//V0=IsLoaded
	addiu sp,sp,-0x28
	sw ra,0x24(sp)
	sw a0,0x14(sp)
	sw a1,0x18(sp)
	sw a2,0x1C(sp)
	sw a3,0x20(sp)

	n64dd_osWritebackDCacheAll()

	lw a0,0x14(sp)
	lw a1,0x18(sp)
	lw a2,0x1C(sp)
	lw a3,0x20(sp)

	//VROM Address Format:
	//00000000+ = Load from ROM / Patch
	//40000000+ = Force Load from ROM (Does not decompress yet)
	//80000000+ = Load from RAM
	//C0000000+ = Load from Disk

	//Check Format
	lui v0,0xF000
	and v1,a2,v0

	//--VROM Format
	beq v1,0,ddhook_romtoram_vrom
	nop

	//--Force ROM Format
	lui v0,0x4000
	beq v1,v0,ddhook_romtoram_force_rom
	nop

	//--RAM Format
	lui v0,0x8000
	beq v1,v0,ddhook_romtoram_ram
	nop

	//--Disk Format
	lui v0,0xC000
	beq v1,v0,ddhook_romtoram_disk
	nop

ddhook_romtoram_vrom:
	//Check for Force ROM flag
	li a0,DDHOOK_FORCEROM
	lw a0,0(a0)
	bnez a0,ddhook_romtoram_vrom_romload
	nop

	//Check for File Replacements
	li a0,DDHOOK_VFILETABLE
	lw a1,0(a0)
	addiu a0,a0,4
	ori a3,0,0

	//a2 < end
	-; lw v0,4(a0)
	bge a2,v0,+
	nop

	//a2 > Start
	lw v0,0(a0)
	blt a2,v0,+
	nop
	b ddhook_romtoram_vrom_replace
	nop

	//increment
	+; addiu a3,a3,1
	addiu a0,a0,0x10
	blt a3,a1,-
	nop

ddhook_romtoram_vrom_romload:
	//Load from ROM
	ori v0,0,0
	b ddhook_romtoram_return
	nop

ddhook_romtoram_force_rom:
	//Load from ROM (Force)
	li v0,0x0FFFFFFF
	and a2,a2,v0
	sw a2,0x78(sp)
	ori v0,0,0
	b ddhook_romtoram_return
	nop

ddhook_romtoram_vrom_replace:
	subu a1,a2,v0
	lw a2,8(a0)
	addu a1,a1,a2	//A1 = Source
	lw a2,0x20(sp)	//A2 = Size
	lw a0,0x18(sp)	//A0 = Dest

	//Check if source is RAM
	lui v0,0xF000
	and a3,a1,v0
	bnez a3,ddhook_romtoram_vrom_replace_ram
	nop

ddhook_romtoram_vrom_replace_disk:
	//Load from Disk
	n64dd_LoadAddress(v0, {CZLJ_DiskLoad})
	jalr v0
	nop

	b ddhook_romtoram_success
	nop

ddhook_romtoram_vrom_replace_ram:
	//Copy from RAM Address
	n64dd_CallRamCopy()
	b ddhook_romtoram_success
	nop

ddhook_romtoram_ram:
	//Load from RAM
	addiu a0,a1,0
	addiu a1,a2,0
	addiu a2,a3,0

	//Copy Data from RAM to where it wants
	n64dd_CallRamCopy()

	b ddhook_romtoram_success
	nop

ddhook_romtoram_disk:
	//Load from Disk
	addiu a0,a1,0
	addiu a1,a2,0
	addiu a2,a3,0

	li a3,0x0FFFFFFF
	and a1,a1,a3

	n64dd_LoadAddress(v0, {CZLJ_DiskLoad})
	jalr v0
	nop

ddhook_romtoram_success:
	lw a0,0x14(sp)		//Update z64_getfile_t to notify object loading
	lw a1,0x1C(sp)		//vrom_addr
	sw a1,0(a0)
	lw a1,0x18(sp)		//ram_addr
	sw a1,4(a0)
	lw a1,0x20(sp)		//size
	sw a1,8(a0)
	lw a1,0x34+8(sp)	//notify_mq
	sw a1,0x18(a0)
	lw a1,0x38+8(sp)	//notify_msg
	sw a1,0x1C(a0)

	lw a0,0x34+8(sp)	//notify_mq
	lw a1,0x38+8(sp)	//notify_msg
	ori a2,0,0

	n64dd_LoadAddress(a3, {CZLJ_osSendMesg})
	jalr a3				//osSendMesg, to let the engine know that the data is loaded and continue the game
	nop

	ori v0,0,1

ddhook_romtoram_return:
	lw ra,0x24(sp)
	lw a0,0x14(sp)
	lw a1,0x18(sp)
	lw a2,0x1C(sp)
	lw a3,0x20(sp)
	addiu sp,sp,0x28
	jr ra
	nop
