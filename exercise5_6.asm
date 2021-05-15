
TITLE Exercise 5.6 - Random String

;Write a program that generates and displays twenty random strings, each consisting of ten capital letters {A..Z}.

;Note: ASCII for A is 65, Z is 90
;Instead of printing out immediately after each character generation, I
;Store it to memory first

INCLUDE Irvine32.inc

.data
	string BYTE 10 DUP(?), 0

.code
exercise5_6 PROC
MOV ECX, 20
main_loop:
	PUSH ECX
	MOV ECX, 10
	MOV EDI, OFFSET string

	inner_loop:
		MOV EAX, 26
		CALL RandomRange
		ADD EAX, 65
		MOV [EDI], AL		; ASCII character fits in range AL
		INC EDI

		LOOP inner_loop

	MOV EDX, OFFSET string
	CALL WriteString
	CALL Crlf

	POP ECX
	LOOP main_loop

	ret
exercise5_6 ENDP
END