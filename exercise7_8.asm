
TITLE Exercise 7.8 - Packed Decimal Conversion

INCLUDE Irvine32.inc

;Write a procedure named PackedToAsc that converts a 4-byte packed decimal numbe r to a
;string of ASCII decimal digits. Pass the packed number to the procedure in EAX , and pass a
;pointer to a buffer that will hold the ASCII digits. Write a short test program that demon strates
;several conversions and displays the converted numbers on the screen.


.data
	RES BYTE 8 DUP(0), 0
.code

;	EAX - 4 byte Packed Decimal
;	EDI - Destination
exercise7_8 PROC

	MOV EAX, 12345678h	;Test Case

	MOV ESI, 7			;Offset. Since in EAX is stored in Little Endian Order, we need to reverse
	MOV ECX, 8			;Counter
looper:
	MOV DL, AL			;First, move lower 8 bits into Dl
	AND DL, 1111b		;Get only the last 4 bits
	
	OR DL, 00110000b		;To convert a decimal to its ASCII, simply turn on the 5th and 6th bit
	MOV [RES+ESI], DL

	SHR EAX, 4			;Shift right EAX by 4 bits
	DEC ESI
	LOOP looper

	;Output
	MOV EDX, OFFSET RES
	CALL WriteString

	RET
exercise7_8 ENDP
END