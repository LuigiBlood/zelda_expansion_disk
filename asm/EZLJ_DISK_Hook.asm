//Zelda 64 Dawn & Dusk - Expansion Disk
//By LuigiBlood

//Uses ARM9 bass

//Ocarina of Time Expansion Hook
print "- Assemble Expansion Disk Code...\n"

seekDisk(0)
base DDHOOK_RAM

ddhook_start:
	db "ZELDA_DD"
ddhook_list_start:
	dw (ddhook_setup | {KSEG1})		//00: Init 64DD Hook
	dw (ddhook_disabledisk)			//04: Deinit 64DD Hook
	dw 0x00000000					//08: Room Loading Replacement
	dw 0x00000000					//0C: Post-Scene Loading
	dw 0x00000000					//10: "game_play" game state entrypoint
	dw 0x00000000					//14: Collision related
	dw 0 //(ddhook_minimap_data)		//18: minimap related
	dw 0x00000000					//1C: minimap related
	dw 0x00000000					//20: minimap related
	dw 0x00000000					//24: minimap related
	dw 0x00000000					//28: map_i_static Replacement
	dw 0x00000000					//2C: ovl_map_mark_data?
	dw 0x00000000					//30: ovl_map_mark_data?
	dw 0x00000000					//34:
	dw 0x00000000					//38:
	dw 0x00000000					//3C:
	dw 0x00000000					//40: 
	dw 0 //(ddhook_map_48x85_static)	//44: map_48x85_static Replacement
	dw (ddhook_sceneload)			//48: Scene Entry Replacement
	dw 0x00000000					//4C: [unused?]
	dw 0x00000000					//50: [unused?]
	dw 0x00000000					//54: Entrance Cutscene Replacement?
	dw (ddhook_text_table)			//58: Message Table Replacement Setup
	dw 0x00000000					//5C: [unused?]
	dw 0x00000000					//60: staff_message_data_static Load
	dw (ddhook_textJPload)			//64: jpn_message_data_static Load
	dw (ddhook_textUSload)			//68: nes_message_data_static Load
	dw 0x00000000					//6C: Scene Animate?
	dw (ddhook_romtoram)			//70: DMA ROM to RAM Hook
	dw 0x00000000					//74: ??? (Every Frame?)
	dw 0x00000000					//78: Set Cutscene Pointer (Intro Cutscenes)
ddhook_list_end:

//64DD Hook Initialization Code
ddhook_setup:
	//Arguments:
	//A0=p->Address Table
	//800FEE70 (NTSC 1.0) - Address Table
	//800FF030 (NTSC 1.1)
	//800FF4B0 (NTSC 1.2)
	//	+0x0 = n64dd_Func_801C7C1C (IMPORTANT! Disk read function)
	//	+0x50 = osSendMesg
	//	+0x88 = Save Context
	//8011A5D0 (NTSC 1.0) - Save Context
	//	+0x1409 = Language (8011B9D9)
	
	addiu sp,sp,-0x20
	sw ra,0x20(sp)
	
	//Save Zelda Disk Address Table Address for later usage
	li a3,(DDHOOK_ADDRTABLE)
	sw a0,0(a3)

	//osWritebackDCache all of the expanded memory
	n64dd_osWritebackDCacheAll()
	//osInvalICache to make sure
	n64dd_osInvalICache(0x80400000, 0x400000)

_ddhook_setup_savecontext:
	//Save Context Change
	n64dd_LoadAddress(a1, {CZLJ_SaveContext})
	ori a2,0,1
	//sb a2,0x1409(a1)	//Force the game to English language (1)
	sw 0,0x135C(a1)		//Set Game Mode to Normal Gameplay, fix Map Select
	//sw 0,0(a1)		//Go To Deku Tree
	
	//Check if save is new (uses unused bytes of Save Context)
	li a2,EZLJ_SAVE_ID
	ori v0,0,0
	lb a3,0x47(a1)
	or v0,v0,a3
	sll v0,v0,8
	lb a3,0x51(a1)
	or v0,v0,a3
	sll v0,v0,8
	lb a3,0x5B(a1)
	or v0,v0,a3
	sll v0,v0,8
	lb a3,0x65(a1)
	or v0,v0,a3
	//If it is all zero, it is a new save.
	beqz v0,_ddhook_setup_savecontext_newsave
	nop
	//If it is not identical but also not zero, then it is a save of another disk mod, do not do anything.
	bne a2,v0,_ddhook_setup_savecontext_wrongsave
	nop
	//Else it is all good, do not modify save and skip to loading assets.
	b _ddhook_setup_savecontext_skip
	nop

_ddhook_setup_savecontext_wrongsave:
	lui a0,VI_BASE
	lw a0,VI_ORIGIN(a0)
	li a1,{KSEG1}
	addu a0,a0,a1
	li a1,EZLJ_ERROR_SAV
	li a2,EZLJ_ERROR_SAV.size
	n64dd_LoadAddress(v0, {CZLJ_DiskLoad})
	jalr v0
	nop
_ddhook_setup_savecontext_wrongsave_loop:
	b _ddhook_setup_savecontext_wrongsave_loop
	nop

_ddhook_setup_savecontext_newsave:
	//Write Save Disk ID
	n64dd_LoadAddress(a0, {CZLJ_SaveContext})
	li a1,EZLJ_SAVE_ID
	sb a1,0x65(a0)
	srl a1,a1,8
	sb a1,0x5B(a0)
	srl a1,a1,8
	sb a1,0x51(a0)
	srl a1,a1,8
	sb a1,0x47(a0)

_ddhook_setup_savecontext_skip:
	//Version Detection
	li a3,(DDHOOK_ADDRTABLE)
	lw a0,0(a3)

	li a3,(DDHOOK_VERSION)

	//1.0 test
	li a1,0x800FEE70
	beq a0,a1,+
	nop

	//1.1 test
	li a1,0x800FF030
	beq a0,a1,++
	nop

	//else it must be 1.2
	addiu a1,0,2
	sw a1,0(a3)		//1.2
	n64dd_DiskLoad(DDHOOK_VFILETABLE, EZLJ_FILE_TABLE2, EZLJ_FILE_TABLE2.size)
	n64dd_DiskLoad(DDHOOK_STATIC_START, EZLJ_DISK_FS_STATIC2_START, EZLJ_DISK_FS_STATIC2_SIZE)
	b _ddhook_setup_loadrom
	nop

 +;	sw 0,0(a3)		//1.0
	n64dd_DiskLoad(DDHOOK_VFILETABLE, EZLJ_FILE_TABLE0, EZLJ_FILE_TABLE0.size)
	n64dd_DiskLoad(DDHOOK_STATIC_START, EZLJ_DISK_FS_STATIC0_START, EZLJ_DISK_FS_STATIC0_SIZE)
	b _ddhook_setup_loadrom
	nop

 +;	addiu a1,0,1	//1.1
	sw a1,0(a3)
	n64dd_DiskLoad(DDHOOK_VFILETABLE, EZLJ_FILE_TABLE1, EZLJ_FILE_TABLE1.size)
	n64dd_DiskLoad(DDHOOK_STATIC_START, EZLJ_DISK_FS_STATIC1_START, EZLJ_DISK_FS_STATIC1_SIZE)
	b _ddhook_setup_loadrom
	nop

_ddhook_incompatibleversion:
	lui a0,VI_BASE
	lw a0,VI_ORIGIN(a0)
	li a1,{KSEG1}
	addu a0,a0,a1
	li a1,EZLJ_ERROR_VER
	li a2,EZLJ_ERROR_VER.size
	n64dd_LoadAddress(v0, {CZLJ_DiskLoad})
	jalr v0
	nop

_ddhook_incompatible_loop:
	j _ddhook_incompatible_loop
	nop

_ddhook_setup_loadrom:
	n64dd_ForceRomEnable()

	//Load all ROM files to RAM for future patch
	li a0,DDHOOK_VFILETABLE
	lw a1,0(a0)
	addiu a0,a0,4
	ori a3,0,0

	-; lw v0,0xC(a0)
	beqz v0,+
	nop

	sw a0,0x1C(sp)
	sw a1,0x18(sp)
	sw a3,0x14(sp)

	lw a1,0(a0)		//A1=VROM start Source
	lw a2,4(a0)		//VROM end
	subu a2,a2,a1	//A2=Size
	lw a0,8(a0)		//A0=RAM Destination

	n64dd_CallRomLoad()

	lw a0,0x1C(sp)
	lw a1,0x18(sp)
	lw a3,0x14(sp)

	+; addiu a3,a3,1
	addiu a0,a0,0x10
	blt a3,a1,-
	nop

	n64dd_ForceRomDisable()

	//Load all files contiguous to RAM
	n64dd_DiskLoad(DDHOOK_STATICMAIN, EZLJ_DISK_FS_STATICMAIN_START, EZLJ_DISK_FS_STATICMAIN_SIZE)

_ddhook_setup_finish:
	//Init Current Scene ID to -1
	li a0,DDHOOK_CURRENTSCENEID
	li a1,0xFFFFFFFF
	sw a1,0(a0)

	lw ra,0x20(sp)
	addiu sp,sp,0x20
	jr ra
	nop

//Disable 64DD Disk Hook
ddhook_disabledisk:
	//Cannot easily disable everything including language, therefore we add a lock screen asking to reset.
	lui a0,VI_BASE
	lw a0,VI_ORIGIN(a0)
	li a1,{KSEG1}
	addu a0,a0,a1
	li a1,EZLJ_RESET
	li a2,EZLJ_RESET.size
	n64dd_LoadAddress(v0, {CZLJ_DiskLoad})
	jalr v0
	nop
_ddhook_disabledisk_loop:
	b _ddhook_disabledisk_loop
	nop

include "./hook/HookFunc_Text.inc"
include "./hook/HookFunc_Scene.inc"
include "./hook/HookFunc_Load.inc"
include "./hook/HookFunc_Utility.inc"
include "./hook/HookFunc_Patch.inc"

ddhook_data:

ddhook_end:

if (origin() > ({LBA1_OFFSET} + 0x1060)) {
  print (origin() - {LBA1_OFFSET})
  error "\n\nFATAL ERROR: MAIN DISK CODE IS TOO LARGE.\nPlease reduce it and load the rest during 64DD Hook Initialization Code.\n"
}

//Initial loading from OoT File Start
seekDisk(0x1060)
dw (ddhook_start - ddhook_start)	//Source Start
dw (ddhook_end2 - ddhook_start)		//Source End
dw (ddhook_start | {KSEG1})		//Dest Start
dw (ddhook_end2 | {KSEG1})		//Dest End
dw (ddhook_list_start | {KSEG1})	//Hook Table Address

ddhook_end2:
