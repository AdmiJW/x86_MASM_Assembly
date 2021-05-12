
TITLE Exercise 4.4 - Overflow Flag

;Write a program that uses addition and subtraction to set and clear the Overflow flag. After each
;addition or subtraction instruction, insert the call DumpRegs statement to display the registers
;and flags . Using comments. explain how (and why) the Overflow flag was affected by each
;instruction. Optional: include an ADD instruction that sets both the Carry and Overflow flags


;	Overflow flag is significant only in SIGNED ARITHMETIC
;	The CPU sets the flag by XORing the MSB's carry with the second MSB's carry

INCLUDE Irvine32.inc

.data
	v1 SBYTE 7Fh		;	7F == 127
	v2 SBYTE 80h		;	80h == -128
	
.code
exercise4_4 PROC
	; Signed Addition
	MOV al, v1
	ADD al, 1
	CALL DumpRegs

	;	Clear by adding 0
	ADD al, 0
	CALL DumpRegs

	; Signed Subtraction
	MOV al, v2
	SUB al, 1
	CALL DumpRegs

	ret
exercise4_4 ENDP
END
