
TITLE Exercise 5.1 - Draw Text Colors

;	Write a program that displays a string in four different colors, using the SetTextColor procedure
;	from the book's link library.

INCLUDE Irvine32.inc

.data 
	string BYTE "This is a Nice String!", 0

.code 
exercise5_1 PROC

	; black bg lightgray fg
	MOV EAX, lightGray + (black * 16)
	CALL SetTextColor
	MOV EDX, OFFSET string
	CALL WriteString
	CALL Crlf

	; black bg LightBlue fg
	MOV EAX, lightBlue + (black * 16)
	CALL SetTextColor
	MOV EDX, OFFSET string
	CALL WriteString
	CALL Crlf

	; black fg lightRed fg
	MOV EAX, lightRed + (black * 16)
	CALL SetTextColor
	MOV EDX, OFFSET string
	CALL WriteString
	CALL Crlf

	; black fg lightGreen fg
	MOV EAX, lightGreen + (black * 16)
	CALL SetTextColor
	MOV EDX, OFFSET string
	CALL WriteString
	CALL Crlf

	ret
exercise5_1 ENDP
END