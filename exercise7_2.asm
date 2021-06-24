
TITLE Exercise 7.2 - Extended Subtraction Procedure

;Create and test a procedure named Extended_Sub that subtracts two binary integers of arbitrary
;size. Restrictions: The storage size of the two integers must be the same, and their size must be c.
;multiple of 32 bits


; Example test case:
;	A: 0010001100100011001000110010001100100011001000110010001100100011
;	B: 0001000011111111111111111111111111111111111111111111111111111111
;	RES: 1001000100011001000110010001100100011001000110010001100100100
;	  (In Hex): 1223232323232324
;
;	The program works with extended integers where the integers are stored in DWORD, reversed order in 8 bit chunks
;	because the difference will work from left to right.

INCLUDE Irvine32.inc

.data
	
	OP_A DWORD 00100011001000110010001100100011b, 00100011001000110010001100100011b
	OP_B DWORD 11111111111111111111111111111111b, 00010000111111111111111111111111b
	RES DWORD 3 DUP(0)

.code

;-----------------------------------------------------------
;	Calculates the difference of 2 extended integers that
;	are stored in array of DWORDS 
;	
;	Receives: ESI - Operand 1 Address, EDI - Operand 2 Address
;			  EBX - Address of Result that will hold the difference
;			  ECX - Number of DWORDS to subtract
;-----------------------------------------------------------
exercise7_2 PROC
	MOV ESI, OFFSET OP_A
	MOV EDI, OFFSET OP_B
	MOV EBX, OFFSET RES
	MOV ECX, 2

	PUSHAD				;Save general purpose registers
	CLC					;Clear Carry flag

Substracting_loop:
	MOV EAX, [ESI]
	SBB EAX, [EDI]
	
	PUSHFD				;Saves the state of EFLAGS because we need to add on addresses

	MOV [EBX], EAX		;Saves the result
	ADD ESI, 4
	ADD EDI, 4
	ADD EBX, 4

	POPFD
	LOOP Substracting_loop
	
	SBB DWORD PTR [EBX], 0

	;Print Result
	MOV ESI, OFFSET RES
	MOV ECX, 3
	MOV EBX, 4
	CALL DumpMem
	
	POPAD				;Restore General purpose registers
	RET
exercise7_2 ENDP
END