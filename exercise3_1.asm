
TITLE Exercise 3.1 - Subtracting Three Integers

; Using the AddSub program from Section 3.2 as a reference, write a program that subtracts
; three integers using only 16-bit registers (AX,BX,CX,DX...). Insert a call DumpRegs statement
; to display the register values

INCLUDE Irvine32.inc

.data
	v1 WORD 0h		;	Since we are operating on 16 bit (2 bytes), only ax, bx, cx and dx will be used
	v2 WORD 1h		;	The values in upper half of eax, ebx... are unaffected
	v3 WORD 2h

	sv1 SWORD 0h
	sv2 SWORD 5h
	sv3 SWORD 4h

.code
exercise3_1 PROC 

	MOV ax, v1
	SUB ax, v2
	CALL DumpRegs      ; Subtraction is always done in 2's complement. However, v3 is not interpreted as 2's complements
	SUB ax, v3
	CALL DumpRegs     


	MOV ax, sv1
	SUB ax, sv2
	CALL DumpRegs		; Should be FFFB = -5
	SUB ax, sv3
	CALL DumpRegs		; Should be FFF7 = -9
	

	ret
exercise3_1 ENDP
END