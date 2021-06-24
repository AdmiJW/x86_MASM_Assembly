
TITLE Lab 4.2 - Multiply or Divide

INCLUDE Irvine32.inc

.data
	multiplicand DWORD ?
	multiplier DWORD ?
	dividend DWORD ?
	divisor DWORD ?
	product DWORD ?

	user_menu BYTE "Please Select a Operation: ", 13, 10, "1 - Multiplication", 13, 10,
			"2 - Division", 13, 10, "Please enter your choice <1/2>: ", 0
	invalid_input BYTE "Invalid input. Please enter again", 13, 10, 0
	calc_again BYTE "Do you want to calculate again?", 13, 10, "1 - Yes", 13, 10, "Other - Exit", 13, 10,
			"Enter choice: ", 0
	thank_you BYTE "Thank you", 13, 10, 0

	prompt_multiplicand BYTE "Please enter a multiplicand <1..9>: ", 0
	prompt_multiplier BYTE "Please enter a multiplier <1..9>: ", 0
	prompt_dividend BYTE "Please enter a dividend: ", 0
	prompt_divisor BYTE "Please enter a divisor: ", 0
	multi_msg BYTE "Multiplication of: ", 0
	diviv_msg BYTE "Division of: ", 0
	product_msg BYTE "The product is: ", 0
.code
lab4_2_challenge PROC

;	Part A: Choice selection
main_menu:
	CALL Clrscr
	MOV EDX, OFFSET user_menu
	CALL WriteString
	CALL ReadDec

	CMP EAX, 1
	JE multiplication_proc
	CMP EAX, 2
	JE division_proc
	
	;Invalid choice
	MOV EDX, OFFSET invalid_input
	CALL WriteString
	CALL WaitMsg
	JMP main_menu


;	Part B: Multiplication
multiplication_proc:
	CALL Clrscr
	;	Part 1: Prompt Integers
	MOV EDX, OFFSET prompt_multiplicand		;Prompt multiplicand
	CALL WriteString
	CALL ReadDec
	MOV multiplicand, EAX

	MOV EDX, OFFSET prompt_multiplier		;Prompt multiplier
	CALL WriteString
	CALL ReadDec
	MOV multiplier, EAX

	;	Part 2: Calculation
	MOV EAX, multiplicand
	MUL multiplier
	MOV product, EAX

	;	Part 3: Output
	MOV EDX, OFFSET multi_msg
	CALL WriteString
	MOV EAX, multiplicand
	CALL WriteDec
	MOV AL, 'x'
	CALL WriteChar
	MOV EAX, multiplier
	CALL WriteDec
	CALL Crlf

	MOV EDX, OFFSET product_msg
	CALL WriteString
	MOV EAX, product
	CALL WriteDec
	CALL Crlf

	JMP again_menu


;	Part C: Division
division_proc:
	CALL Clrscr
	;	Part 1: Prompt Integers
	MOV EDX, OFFSET prompt_dividend		;Prompt dividend
	CALL WriteString
	CALL ReadDec
	MOV dividend, EAX

	MOV EDX, OFFSET prompt_divisor     	;Prompt divisor
	CALL WriteString
	CALL ReadDec
	MOV divisor, EAX

	;	Part 2: Calculation
	MOV EDX, 0
	MOV EAX, dividend
	DIV divisor
	MOV product, EAX

	;	Part 3: Output
	MOV EDX, OFFSET diviv_msg
	CALL WriteString
	MOV EAX, dividend
	CALL WriteDec
	MOV AL, '/'
	CALL WriteChar
	MOV EAX, divisor
	CALL WriteDec
	CALL Crlf

	MOV EDX, OFFSET product_msg
	CALL WriteString
	MOV EAX, product
	CALL WriteDec
	CALL Crlf

	JMP again_menu


;	Part D: Ask for calculate again
again_menu:
	MOV EDX, OFFSET calc_again
	CALL WriteString
	CALL ReadDec
	CMP EAX, 1
	JE main_menu

	MOV EDX, OFFSET thank_you
	CALL WriteString
	CALL WaitMsg

RET
lab4_2_challenge ENDP
END
