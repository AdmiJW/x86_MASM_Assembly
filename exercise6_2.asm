
TITLE Exercise 6.2 - LOOP Implementation

INCLUDE Irvine32.inc

;Implement the following C++ code in assembly language, using the block-structured .IF and
;.WHILE directives. Assume that all variables are 32-bit signed integers:
;
;		while( opl < op2 )
;		{
			;opl++;
;			if ( op2 == op3 )
;				X = 2;
;			else
;				X = 3;
;		}


.data
	op1 SDWORD -1 
	op2 SDWORD 3
	op3 SDWORD 2
.data?
	X SDWORD ?
.code

;================================
;	Approach 1: Using Directives
;================================
exercise6_2 PROC

;	Since we cannot have both operands as memory, the operands are moved to registers first
MOV EAX, op1
MOV EBX, op2
MOV ECX, op3

;	Since we are dealing with signed integers, but MASM .WHILE directives assume unsigned integers,
;	Therefore we have to fallback to using CMP instruction and checking SIGN flag.
CMP EAX, EBX
.WHILE SIGN?
	INC EAX
	.IF EBX == ECX
		MOV X, 2
	.ELSE
		MOV X, 3
	.ENDIF
	CMP EAX, EBX
.ENDW


CALL DumpRegs			; Look at final EAX value

MOV ESI, OFFSET X
MOV ECX, 1
MOV EBX, TYPE X
CALL DumpMem			;	Take a look at final X value

CALL WaitMsg

ret
exercise6_2 ENDP



;================================
;	Approach 2: Assembly Method
;================================
exercise6_2_alt PROC

MOV EAX, op1
MOV EBX, op2
MOV ECX, op3

whileloop:
	;	Termination condition
	CMP EAX, EBX
	JNS finished

	;	Loop statements
	INC EAX

	XOR EBX, ECX			;I am using XOR since all we need to check is equality
	JNZ is_op1_not_equ_op2

	;	First branch: op2 == op3
	MOV X, 2
	JMP whileloop
	;	Second branch: op2 != op3
	is_op1_not_equ_op2:
		MOV X, 3
		JMP whileloop

finished:
	CALL DumpRegs			; Look at final EAX value

	MOV ESI, OFFSET X
	MOV ECX, 1
	MOV EBX, TYPE X
	CALL DumpMem			;	Take a look at final X value

	CALL WaitMsg


ret
exercise6_2_alt ENDP
END