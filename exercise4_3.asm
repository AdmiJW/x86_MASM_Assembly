
TITLE Exercise 3.3 - Zero and Sign Flags

;Write a program that uses addition and subtraction to set and clear the Zero and Sign flags. After
;each addition or subtraction instruction. insert the call DumpRegs statement to display the registers and flags. Using comments, explain how (and why) the Zero and Sign flags were affected
;by each instruction


; Zero flag are set whenever the destination operand of ARITHMETIC OPERATION is zero.
; Therefore to set zero flag, perhaps you can minus a register by itself?
; Sign Flag are set whenever the destination operand of ARITHMETIC OPERATION is negative (sign bit)

INCLUDE Irvine32.inc

.data


.code
exercise4_3 PROC
	;	To set zero flag, you can try minus a register by itself (Or perform bitwise AND with 0)
	MOV ax, 1
	SUB ax, ax
	CALL DumpRegs

	;	To clear zero flag, you can actually perform bitwise OR with 1.
	;	Or simply perform arithmetic that don't end up in 0, like set register to 1 then add 0
	MOV ax, 1
	ADD ax, 0
	CALL DumpRegs

	;	To set sign flag, simply minus to negative, or initialize with negative number to begin with
	MOV ax, -1
	add ax, 0
	CALL DumpRegs

	;	To clear sign flag, you can perform AND operation with 0 (Use Masking if you want preserve other bits)
	;	However, one can simply set register to 0 and add 0 or something, ensure end result is positive or 0
	MOV ax, 0
	ADD ax, 0
	CALL DumpRegs

	ret	
exercise4_3 ENDP
END