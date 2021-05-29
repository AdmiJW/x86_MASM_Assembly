
TITLE Exercise 6.7 - Boolean Calculator (1)

INCLUDE Irvine32.inc

;Create a program that functions as a simple boolean calculator for 32-bit integers. It should displaya menu that asks the user to make a selection from the following list:
;	1. x AND y
;	2. x OR y
;	3. NOT x
;	4. x XOR y
;	5. Exit program
;When the user makes a choice, call a procedure that displays the name of the operation about to
;be performed. (We will implement the operations in the exercise following this one.)


.data
	menu BYTE "=====================================", 13, 10
		BYTE " MENU ", 13, 10
		BYTE "=====================================", 13, 10
		BYTE " 1. x AND y", 13, 10
		BYTE " 2. x OR y", 13, 10
		BYTE " 3. NOT x", 13, 10
		BYTE " 4. x XOR y", 13, 10
		BYTE " 5. Exit Program", 13, 10, 0
	prompt BYTE "Enter your choice: ", 0
	invalid_choice_msg BYTE "Invalid Choice. Please enter again: ", 0

	choice_1_msg BYTE "You have selected choice 1: x AND y!", 13, 10, 0
	choice_2_msg BYTE "You have selected choice 2: x OR y!", 13, 10, 0
	choice_3_msg BYTE "You have selected choice 3: NOT x!", 13, 10, 0
	choice_4_msg BYTE "You have selected choice 4: x XOR y!", 13, 10, 0
	choice_5_msg BYTE "Thank you for using the program!", 13, 10, 0

.code
exercise6_7 PROC
	
menu_selection:
	MOV EDX, OFFSET menu
	CALL WriteString

prompt_choice:
	MOV EDX, OFFSET prompt
	CALL WriteString
	CALL ReadDec

validation:
	JC invalid_choice
	CMP EAX, 1
	JL invalid_choice
	CMP EAX, 5
	JG invalid_choice

valid_choice:
	CMP EAX, 5
	JE end_program
	CMP EAX, 1
	JE choice_1
	CMP EAX, 2
	JE choice_2
	CMP EAX, 3
	JE choice_3
	JMP choice_4

	choice_1:
		MOV EDX, OFFSET choice_1_msg
		JMP finally
	choice_2:
		MOV EDX, OFFSET choice_2_msg
		JMP finally
	choice_3:
		MOV EDX, OFFSET choice_3_msg
		JMP finally
	choice_4:
		MOV EDX, OFFSET choice_4_msg
		JMP finally
	finally:
		CALL WriteString
		CALL WaitMsg
		CALL Clrscr
		JMP menu_selection
	
invalid_choice:
	MOV EDX, OFFSET invalid_choice_msg
	CALL WriteString
	CALL ReadDec
	JMP validation

end_program:
	MOV EDX, OFFSET choice_5_msg
	CALL WriteString

	ret
exercise6_7 ENDP
END