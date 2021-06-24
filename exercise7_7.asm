
TITLE Exercise 7.7 - Prime Number Program

INCLUDE Irvine32.inc

.data
	prompt BYTE "Please enter a positive integer (or <= 0 to quit): ", 0
	is_prime BYTE "The number is a prime number!", 13, 10, 13, 10, 0
	is_not_prime BYTE "The number is not a prime number!", 13, 10, 13, 10, 0

.code
exercise7_7 PROC

prompt_input:
	MOV EDX, OFFSET prompt
	CALL WriteString
	CALL ReadInt

	CMP EAX, 0
	JLE exit_label

	CMP EAX, 1
	JE is_not_prime_label   ;Edge case: 1 is not prime

	MOV EBX, EAX			;Copies EAX to EBX since it is used in checking
	MOV ECX, 2				;Start checking from 2

looper:
	;Check for square root by multiplying
	MOV EAX, ECX
	MUL EAX
	CMP EAX, EBX
	JG is_prime_label			;Until so far, no divisor found. So is prime!

	MOV EDX, 0
	MOV EAX, EBX
	DIV ECX                 ;Divisibility check

	CMP EDX, 0
	JE is_not_prime_label       ;Remainder is 0. Divisibility checks. Not prime

	INC ECX
	JMP looper

is_prime_label:
	AND EDX, 0				;This sets the zero flag
	MOV EDX, OFFSET is_prime
	JMP output_label
is_not_prime_label:
	OR EDX, 1				;This clears the zero flag
	MOV EDX, OFFSET is_not_prime
output_label:
	CALL WriteString
	JMP prompt_input
	
exit_label:
	RET
exercise7_7 ENDP
END