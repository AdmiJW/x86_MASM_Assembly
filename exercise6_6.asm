
TITLE Exercise 6.6 - College Registration (2)

;Using the solution program from the preceding exercise as a starting point, write a complete program that does the following :
;	1. Input gradeAverage and credits from the user. If the user enters zero for either value, halt
;	the program.
;	2. Perform range checking on both credits and gradeAverage. The latter must be between 0
;	and 400. If either value is out of range, display an appropriate error message.
;	3. Determine whether or not the person can register (using the existing example) and display
;	an appropriate message.
;	4. Repeat steps 1 through 3 until the user decides to quit.

INCLUDE Irvine32.inc


.data 
	prompt_gradeAverage BYTE "Please Enter Your Grade Average (1-400), or 0 to exit: ", 0
	invalid_gradeAverage BYTE "Invalid Grade Average (1-400) or 0 to exit, please enter again: ", 0

	prompt_credits BYTE "Please Enter Your Credits (1-30), or 0 to exit: ", 0
	invalid_credits BYTE "Invalid Credits (1-30), or 0 to exit: ", 0

	can_register_str BYTE "Congratuations! Your registration is successful", 0
	cannot_register_str BYTE "Sorry, you do not satisfy the condition for registration", 0

	exit_msg BYTE "Thanks for using the program. See you again!", 0
.code

;=========================================================================
;	Helper Fucntion: Prompts user for input credit and grade Average.
;	Returns:
;		EAX - credits
;		EBX - gradeAverage
prompt_input_grade_credit PROC USES EDX
	;	gradeAverage
	MOV EDX, OFFSET prompt_gradeAverage
	CALL WriteString
	CALL ReadInt

validation_1:
	JO invalid_1
	CMP EAX, 0
	JE valid_2
	JL invalid_1
	CMP EAX, 400
	JG invalid_1
	JMP valid_1

invalid_1:
	MOV EDX, OFFSET invalid_gradeAverage
	CALL WriteString
	CALL ReadInt
	JMP validation_1

valid_1:
	MOV EBX, EAX
	CALL Crlf

	MOV EDX, OFFSET prompt_credits
	CALL WriteString
	CALL ReadInt

validation_2:
	JO invalid_2
	CMP EAX, 0
	JE valid_2
	JL invalid_2
	CMP EAX, 30
	JG invalid_2
	JMP valid_2

invalid_2:
	MOV EDX, OFFSET invalid_credits
	CALL WriteString
	CALL ReadInt
	JMP validation_2

valid_2:
	CALL Crlf
	ret
prompt_input_grade_credit ENDP
;=========================================================================



;=========================================================================
;	Helper Fucntion: Prints out whether a student can be registered
;	Argument:
;		EAX - credits
;		EBX - gradeAverage
check_registration PROC USES EDX
	;Conditions for valid registration
	CMP EBX, 350
	JG can_register
	CMP EAX, 12
	JLE can_register
	CMP EBX, 250
	JLE cannot_register
	CMP EAX, 16
	JG cannot_register

can_register:
	MOV EDX, OFFSET can_register_str
	CALL WriteString
	CALL Crlf
	ret
cannot_register:
	MOV EDX, OFFSET cannot_register_str
	CALL WriteString
	CALL Crlf
	ret
check_registration ENDP
;=========================================================================



;=========================================================================
;	Helper Fucntion: Prints out whether a student can be registered
;	Argument:
;		EAX - credits
;		EBX - gradeAverage
exercise6_6 PROC

main_loop:
	CALL prompt_input_grade_credit

	;Check if any input is 0. If it does, exit the program
	CMP EAX, 0
	JE exit_program
	CMP EBX, 0
	JE exit_program

	;Check if able to register or not.
	CALL check_registration
	CALL WaitMsg
	CALL Clrscr

	;Loop
	JMP main_loop

exit_program:
	CALL Clrscr
	MOV EDX, OFFSET exit_msg
	CALL Crlf
	CALL WriteString

	ret
exercise6_6 ENDP
END