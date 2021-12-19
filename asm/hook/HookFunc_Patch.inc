ddhook_applypatch:
	addiu sp,sp,-0x20
	sw ra,0x20(sp)

	or at,a0,0
	sw at,0x1C(sp)

    -;
	lw at,0x1C(sp)
	lw a0,0(at)		//Get Dest
	nop
	beq a0,0,++			//If 0 then done
	nop
	lw a2,4(at)			//Get Size
	addiu a1,at,8		//Get Source
	//Check type
	sra v0,a2,28
	bne v0,0,+
	nop

	//Type 0: Copy
	addu at,a1,a2		//Prepare at for next patch
	sw at,0x1C(sp)
	n64dd_CallRamCopy()	//Patch
	b -					//Loop
	nop

	//Type 1: Fill
	+; li a3,0x0FFFFFFF
	and a2,a2,a3
	addiu at,a1,4		//Prepare at for next patch
	lw a1,0(a1)
	sw at,0x1C(sp)
	n64dd_CallRamFill()	//Patch
	b -
	nop

	+;
	lw ra,0x20(sp)
	addiu sp,sp,0x20
	jr ra
	nop
