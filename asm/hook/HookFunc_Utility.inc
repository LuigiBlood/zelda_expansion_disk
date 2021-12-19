ddhook_ramcopy_slow:
	//Copy Data from RAM to where it wants (byte by byte)
	//A0 = Dest, A1 = Offset, A2 = Size, A3 = Used for copy
	 -; lb a3,0(a1)
	sb a3,0(a0)
	addiu a0,a0,1
	addiu a1,a1,1
	subi a2,a2,1
	bnez a2,-
	nop

	jr ra
	nop

ddhook_ramcopy:
	//Copy Data from RAM to where it wants (word by word)
	//A0 = Dest, A1 = Offset, A2 = Size, A3 = Used for copy
	 -; lw a3,0(a1)
	subi a2,a2,4
	sw a3,0(a0)
	addiu a0,a0,4
	addiu a1,a1,4
	bnez a2,-
	nop

	jr ra
	nop

ddhook_ramfill_slow:
	//Copy Data from RAM to where it wants
	//A0 = Dest, A1 = Fill Byte, A2 = Size
	 -; sb a1,0(a0)
	addiu a0,a0,1
	subi a2,a2,1
	bnez a2,-
	nop

	jr ra
	nop

ddhook_ramfill:
	//Copy Data from RAM to where it wants
	//A0 = Dest, A1 = Fill Byte, A2 = Size
	 -; sw a1,0(a0)
	addiu a0,a0,4
	subi a2,a2,4
	bnez a2,-
	nop

	jr ra
	nop
