
TITLE Exercise 6.8 - Boolean Calculator (2)

INCLUDE Irvine32.inc

;Continue the solution program from the preceding exercise by implementing the following
;procedures:
;	AND_op: Prompt the user for two hexadecimal integers. AND them together and display
;		the result in hexadecimal.
;	OR_op: Prompt the user for two hexadecimal integers. OR them together and display the
;		result in hexadecimal.
;	NOT_op : Prompt the user for a hexadecimal integer. NOT the integer and display the
;		result in hexadecimal.
;	XOR_op: Prompt the user for two hexadecimal integers. Exclusive-OR them together and
;		display the result in hexadecimal.


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

	prompt_hex1 BYTE "Enter your first hexadecimal number: ", 13, 10, 0
	prompt_hex2 BYTE "Enter your second hexadecimal number: ", 13, 10, 0
	result_str BYTE "The Result of the operation is: ", 0

.code

;==============================================================
;Helper Procedure 1: Show menu and prompt for user choice
;Returns:
;	EAX - User choice, [1,5] inclusive
show_menu PROC USES EDX
	
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
	JMP valid_choice

invalid_choice:
	MOV EDX, OFFSET invalid_choice_msg
	CALL WriteString
	CALL ReadDec
	JMP validation

valid_choice:
	ret
show_menu ENDP
;==============================================================


;==============================================================
;Helper Function 2: Get one hexadecimal number input from user
;Returns:
;	EAX - Hexadecimal Input
get_a_hex PROC USES EDX
	MOV EDX, OFFSET prompt_hex1
	CALL WriteString
	CALL ReadHex

	ret
get_a_hex ENDP

;==============================================================
;Helper Function 3: Get Two hexadecimal number input from user
;Extends on Helper Function 2
;Returns:
;	EAX - First Hex
;	EBX - Second Hex
get_2_hex PROC USES EDX
	CALL get_a_hex
	MOV EBX, EAX
	CALL get_a_hex
	ret
get_2_hex ENDP



exercise6_8 PROC
program_loop:
	CALL show_menu
	MOV EDX, EAX			;Save the choice to EDX register
	CALL Clrscr

	;If the choice is 5, exit program
	CMP EDX, 5
	JE end_program
	;If the choice is 3, we need only one hex input, else two
	CMP EDX, 3
	JE input_1
	JMP input_2

input_1:
	CALL get_a_hex
	JMP operation
input_2:
	CALL get_2_hex
	JMP operation

operation:
	CMP EDX, 1
	JE and_operation
	CMP EDX, 2
	JE or_operation
	CMP EDX, 3
	JE not_operation
	CMP EDX, 4
	JE xor_operation

	and_operation:
		AND EAX, EBX
		JMP output_operation
	or_operation:
		OR EAX, EBX
		JMP output_operation
	not_operation:
		NOT EAX
		JMP output_operation
	xor_operation:
		XOR EAX, EBX
		JMP output_operation
	output_operation:
		MOV EDX, OFFSET result_str
		CALL WriteString
		CALL WriteHex
		CALL Crlf
		CALL WaitMsg
		CALL Clrscr
		JMP program_loop

end_program:
	ret
exercise6_8 ENDP
END