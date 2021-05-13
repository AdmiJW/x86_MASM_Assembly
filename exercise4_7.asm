
TITLE Exercise 4.7 - Arithmetic Expression

; Write a program that implements the following arithmetic expression:
; EAX = -va12 + 7 - val3 + vall
;Use the following data definitions:
;	vall SDWORD 8
;	va12 SDWORD -15
;	va13 SDWORD 20
; In comments next to each instruction, write the hexadecimal value of EAX. Insert a call DumpRegs statement at the end of the program.


INCLUDE Irvine32.inc

.data
	val1 SDWORD 8
	val2 SDWORD -15
	val3 SDWORD 20

.code 
exercise4_7 PROC

	;	EAX = 7		==>	7h
	MOV EAX, 7
	;	EAX = 7 - val2		==> 22d ==> 16h
	SUB EAX, val2
	;	EAX = 7 - vl2 - val3 ==> 2d ==> 2h
	SUB EAX, val3
	;	EAX = 7 - val2 - val3 + val1 ==> 10d ==> Ah
	ADD EAX, val1

	CALL DumpRegs

	ret	
exercise4_7 ENDP
END