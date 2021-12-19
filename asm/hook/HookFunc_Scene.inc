//Scene Entry Hook
ddhook_sceneload:
	//Arguments:
	//A0=Scene ID
	//A1=p->Scene Table
	//
	//Return:
	//V0=p->Scene Entry	
	addiu sp,sp,-0x20
	sw ra,0x20(sp)
	sw a0,0x1C(sp)
	sw a1,0x18(sp)

	//Check if Scene ID is part of the List
	//Uses the padding byte in the Scene Entry as Scene ID
	addiu at,0,EZLJ_SCENELIST_COUNT
	addiu a2,0,0
	li v0, DDHOOK_SCENELIST
	-; lbu v1,0x12(v0)
	subi v1,v1,1

	beq a0,v1,_ddhook_sceneload_custom
	nop
	addiu v0,v0,0x1C
	addiu a2,a2,1
	bne at,a2,-
	nop

_ddhook_sceneload_original:
	//Calculate Scene Entry Address from original Scene List
	addiu a3,0,0x14
	multu a0,a3
	mflo a2		//(0x14 * Scene ID)
	addu v0,a2,a1

	//Disable Room Loading Hook
    li a0,ddhook_list_start
	sw 0,8(a0)
	sw 0,0xC(a0)

	b _ddhook_sceneload_return
	nop

_ddhook_sceneload_custom:
	sw v0,0x14(sp)

	//Check Current Scene ID to avoid reloading things when a scene is reloaded (like when you have fallen)
	li a0,ddhook_list_start
	sw 0,0xC(a0)
	lw a0,0x1C(sp)
	li a1,DDHOOK_CURRENTSCENEID
	lw a1,0(a1)
	beq a0,a1,+
	nop

	//Setup Room Load Hook
	li a0,ddhook_list_start
	li a1,ddhook_roomload
	sw a1,8(a0)
	li a1,ddhook_postscene
	sw a1,0xC(a0)

	//Load Title Card
	lw a0,8(v0)
	lw a1,0x14(v0)
	lw a2,0x18(v0)
	n64dd_LoadAddress(a3, {CZLJ_DiskLoad})
	jalr a3			//read from disk
	nop

	+; lw v0,0x14(sp)

_ddhook_sceneload_return:
	lw a0,0x1C(sp)
	li a1,DDHOOK_CURRENTSCENEID
	sw a0,0(a1)

	lw ra,0x20(sp)
    addiu sp,sp,0x20
	jr ra
	nop

//Post-Scene Loading Hook
ddhook_postscene:
	//Arguments:
	//A0=p->Global Context

	//Load Rooms into buffer
	addiu sp,sp,-0x20
	sw ra,0x20(sp)
	sw a0,0x1C(sp)
	
	//Find Scene Room Command (0x04)
	lw a0,0x00B0(a0)
	addiu a1,a0,0
	addiu a3,0,4

	-; lbu a2,0(a1)
	addiu a1,a1,8
	bne a2,a3,-
	nop

	subiu a1,a1,8
	lbu a2,1(a1)	//A2 = Get number of rooms
	lw a3,4(a1)		//Get Room Segment Address
	li v0,0x00FFFFFF
	and a3,a3,v0	//Isolate relative Address
	addu a1,a0,a3	//A1 = Get Room List Address

	li a0,DDHOOK_SCENE_ROOM_DATA
	addiu a3,0,0
	sw a3,0x0C(sp)	//Current Room ID to load
	sw a2,0x18(sp)	//Room Count
	sw a1,0x14(sp)	//Room List Address
	sw a0,0x10(sp)	//Current Room Buffer Address
	
	-; lw a2,4(a1)		//get End VROM
	lw a1,0(a1)		//get Start VROM
	subu a2,a2,a1	//get Size

	n64dd_LoadAddress(v0, {CZLJ_DiskLoad})
	jalr v0
	nop

	lw a1,0x14(sp)	//Room List Address
	lw v0,0x0C(sp)	//Current Room ID
	sll v0,v0,3		//Multiply by 8
	addu a1,a1,v0
	lw a2,4(a1)		//get End VROM
	lw a1,0(a1)		//get Start VROM
	subu a2,a2,a1	//get Size
	lw a0,0x10(sp)
	li a3,DDHOOK_SCENE_ROOM_TABLE
	addu a3,a3,v0
	sw a0,0(a3)		//Save Start RAM Address to Table
	addu a0,a0,a2
	sw a0,4(a3)		//Save End RAM Address to Table
	sw a0,0x10(sp)
	lw a3,0x0C(sp)	//Current Room ID
	lw a2,0x18(sp)	//Room Count
	addiu a3,a3,1	//ID++
	sw a3,0x0C(sp)	//Current Room ID
	lw a1,0x14(sp)	//Room List Address
	sll v0,a3,3		//Multiply by 8
	addu a1,a1,v0
	bne a3,a2,-		//if not equal then continue to load rooms
	nop

	lw ra,0x20(sp)
	addiu sp,sp,0x20
	jr ra
	nop

//Room Loading Hook
ddhook_roomload:
	//Arguments:
	//A0=p->Global Context
	//A1=p->Room Context
	//A2=Room ID
	
	addiu sp,sp,-0x20
	sw ra,0x10(sp)
	sw a1,0x14(sp)
	sw a2,0x18(sp)

	lw a0,0x34(a1)		//A0=RAM Address Dest
	li a1,DDHOOK_SCENE_ROOM_TABLE
	sll a2,a2,3
	addu a1,a1,a2
	lw a2,4(a1)
	lw a1,0(a1)			//A1=Source
	subu a2,a2,a1		//A2=Size
	
	n64dd_CallRamCopy()
	
	lw a0,0x14(sp)
	addiu a0,a0,0x50
	lw a0,0(a0)		//OsMesgQueue pointer (osSendMesg A0)
	li a1,0			//OSMesg (osSendMesg A1)
	li a2,0			//DO NOT BLOCK until response
	
	n64dd_LoadAddress(a3, {CZLJ_osSendMesg})
	jalr a3			//osSendMesg, to let the engine know that the data is loaded and continue the game
	nop
	
	lw ra,0x10(sp)
	addiu sp,sp,0x20
	jr ra
	nop
