
TITLE Exercise 7.5 - Fast Multiplication

;Write a procedure named FastMultiply that multiplies any unsigned 32-bit integer by EA."\.
;using only shifting and addition. Pass the integer to the procedure in the EBX register, and retur;
;the product in the EAX register. Write a short test program that calls the procedure and display,
;the product. (We will assume that the product is never larger than 32 bits.)

; Shift add multiplication is actually just like the normal multiplication
; procedure we did in schools.
; THis is taught in COA subject in chapter 2.

INCLUDE Irvine32.inc

.data

.code
;	EBX - Multiplicand
;	ECX - Multiplier
exercise7_5 PROC
	MOV EAX, 0
	MOV EBX, 52		;Example multiplicand
	MOV ECX, 12		;Example multiplier
	
keep_multiply:
	TEST ECX, 1
	JZ continue
	ADD EAX, EBX
	
continue:
	SHR ECX, 1
	SHL EBX, 1
	CMP ECX, 0
	JNE keep_multiply

	;Output in EAX
	CALL DumpRegs

	RET
exercise7_5 ENDP
END