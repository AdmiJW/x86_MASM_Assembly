
TITLE Exercise 5.5 - Random Integers

;Write a program that generates and displays 50 random integers between - 20 and +20.

INCLUDE Irvine32.inc

.data

.code 
exercise5_5 PROC
MOV ECX, 50
main_loop:
	
	MOV EAX, 41
	CALL RandomRange
	SUB EAX, 20
	CALL WriteInt
	CALL Crlf

	LOOP main_loop

	ret
exercise5_5 ENDP
END