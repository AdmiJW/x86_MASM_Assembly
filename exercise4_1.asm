
TITLE Exercise 4.1 - Carry Flag

;Write a program that uses addition and subtraction to set and clear the Carry flag. After each
;instruction. insert the call DumpRegs statement to display the registers and flags. Using comments,
;explain how (and why) the Carry flag was affected by each instruction.


; The Carry Flag (CF) is set whenever the result of an UNSIGNED arithmetic operation
; is too large for destination operand. 
; Note this is not the case for signed arithmetic. In that case, overflow flag is set instead

INCLUDE Irvine32.inc

.data
	v1 WORD 0FFFFh
	v2 WORD 0001h
	v3 WORD 0000h
	v4 WORD 0001h

	sv1 SWORD 7FFFh		;	Note that we dont use FFFF here because it is -1. Instead, 7FFF = 32767
	sv2 SWORD 0001h
	sv3 SWORD 8000h		;	Similarly, 8000h == -32768
	sv4 SWORD 0001h

.code 
exercise4_1 PROC
	;======================================
	;	Unsigned Arithmetic affecting CF
	;======================================
	;	Addition Carry
	MOV ax, v1
	ADD ax, v2
	CALL DumpRegs		;CF = 1

	ADD ax, 0				;Clear flag by adding 0

	;	Subtraction Carry
	MOV ax, v3
	SUB ax, v4
	CALL DumpRegs		;CF = 1

	ADD ax, 0				;Clear flag by adding 0

	;======================================
	; Signed Arithmetic won't affect CF.
	; Instead, OF is affected instead
	;=======================================
	MOV ax, sv1
	ADD ax, sv2
	CALL DumpRegs

	ADD ax, 0				;Clear flag by adding 0

	MOV ax, sv3
	SUB ax, sv4
	CALL DumpRegs



	ret
exercise4_1 ENDP
END