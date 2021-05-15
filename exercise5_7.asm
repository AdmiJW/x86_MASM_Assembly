
TITLE Exercise 5.7 - Random Screen Locations

;Write a program that displays a single character at 100 random screen locations. Optional: use a
;randomized delay between characters, between 10 and 300 milliseconds.

INCLUDE Irvine32.inc

.code 
exercise5_7 PROC
	MOV ECX, 100
	CALL GetMaxXY	;DL = columns, DH = rows
	MOV BL, DL		;BL = columns
main_loop:
	MOVZX EAX, BL
	CALL RandomRange
	MOV DL, AL      ;Random Column in DL

	MOV EAX, 25
	CALL RandomRange
	MOV DH, AL		;Random Row in DH

	CALL Gotoxy

	;	Write character 'A'
	MOV AL, 'A'
	CALL WriteChar

	;	Delay between 10ms - 300ms
	MOV EAX, 291
	CALL RandomRange
	ADD EAX, 10
	CALL Delay

	LOOP main_loop

	ret
exercise5_7 ENDP
END