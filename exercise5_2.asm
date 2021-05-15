
TITLE Exercise 5.2 - Integer Array Input

;Write a program that uses a loop to input ten signed 32-bit integers from the user, stores the integers in an array, and redispl ays the integers.

INCLUDE Irvine32.inc

.data
	prompt BYTE "Please Enter your Number #", 0
	printer BYTE "Your Number #", 0
.data?
	arr SDWORD 10 DUP(?)

.code
exercise5_2 PROC

	MOV ECX, 10					;Loop counter
	MOV ESI, OFFSET arr			;Offset of array to store
	MOV EBX, 1					;For counting

;============================
; Read Input Loop
;============================
read_array_loop:

	;	Prompt Message
	MOV EDX, OFFSET prompt
	CALL WriteString
	MOV EAX, EBX
	CALL WriteDec
	CALL Crlf

	CALL ReadInt
	
	JNO valid_input				;Proceed if valid input
	JMP read_array_loop			;Otherwise bad input. Loop again

	valid_input:
		MOV [ESI], EAX		;Store input into array
		INC EBX				;Increment Counter
		ADD ESI, 4			;Go to offset array by adding 4 bytes

	LOOP read_array_loop


	CALL Crlf
	CALL Crlf


;===============================
;	Print Input Loop
;===============================

	MOV ESI, OFFSET arr		;Offset of array to print
	MOV ECX, 10				;Loop counter
	MOV EBX, 1				;Counter

print_array_loop:
	;	Print message
	MOV EDX, OFFSET printer
	CALL WriteString
	MOV EAX, EBX
	CALL WriteDec
	CALL Crlf

	;	Output number
	MOV EAX, [ESI]
	CALL WriteInt
	CALL Crlf

	ADD ESI, 4			;Move to next integer by offset 4 bytes
	INC EBX				;Increment counter
	
	LOOP print_array_loop

	ret
exercise5_2 ENDP
END