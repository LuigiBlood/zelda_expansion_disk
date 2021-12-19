//nes_message_data_static Load Hook
ddhook_textUSload:
	//Arguments:
	//A0=p->Message Context
	//	+0 = Offset
	//	+4 = Size
	//	+DC88 = Destination
	
	addiu sp,sp,-0x10
	sw ra,8(sp)
	sw a0,4(sp)
	
	lw a0,4(sp)
	lw a2,4(a0) 				//A2 = Size
	lw a1,0(a0)					//A1 = Offset
	li a3,DDHOOK_TEXTDATA_NES	//A3 = DDHOOK_TEXTDATA_NES
	addu a1,a1,a3				//A1 = A3 + Offset
	ori a3,0,0xDC88
	addu a0,a0,a3				//A0 = RAM Dest
	
	//Copy Text Data from RAM to where it wants
	//Avoid hang from loading from disk directly and stop the music
	n64dd_CallRamCopy()
	
	lw ra,8(sp)
	addiu sp,sp,0x10
	jr ra
	nop

//jpn_message_data_static Load Hook
ddhook_textJPload:
	//Arguments:
	//A0=p->Message Context
	//	+0 = Offset
	//	+4 = Size
	//	+DC88 = Destination
	
	addiu sp,sp,-0x10
	sw ra,8(sp)
	sw a0,4(sp)
	
	lw a0,4(sp)
	lw a2,4(a0) 				//A2 = Size
	lw a1,0(a0)					//A1 = Offset
	li a3,DDHOOK_TEXTDATA_JPN	//A3 = DDHOOK_TEXTDATA_JPN
	addu a1,a1,a3				//A1 = A3 + Offset
	ori a3,0,0xDC88
	addu a0,a0,a3				//A0 = RAM Dest
	
	//Copy Text Data from RAM to where it wants
	//Avoid hang from loading from disk directly and stop the music
	n64dd_CallRamCopy()
	
	lw ra,8(sp)
	addiu sp,sp,0x10
	jr ra
	nop

//Message Table Replacement Setup Hook
ddhook_text_table:
	//Arguments:
	//A0=p->p->jpn_message_data_static table
	//A1=p->p->nes_message_data_static table
	//A2=p->p->staff_message_data_static table
	//You can change the pointers.
	
	li t0,DDHOOK_TEXTTABLE_JPN
	sw t0,0(a0)		//Change jpn_message_data_static pointer
	
	li t0,DDHOOK_TEXTTABLE_NES
	sw t0,0(a1)		//Change nes_message_data_static pointer

	//li t0,DDHOOK_TEXTTABLE_STAFF
	//sw t0,0(a2)		//Change staff_message_data_static pointer
	
	jr ra
	nop	
