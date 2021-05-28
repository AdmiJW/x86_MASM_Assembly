
TITLE Exercise 6.4 - TEST Score Evaluation (2)

INCLUDE Irvine32.inc


.data
	prompt_input BYTE "Please enter your score (0-100) or -1 to quit: ", 0
	reenter_prompt BYTE "Invalid Score. Enter score again (0-100) or -1 to quit: ", 0

	grade BYTE "Your achieved grade is: ", 0
	counter BYTE "You had queried marks for this many student(s): ", 0
.code

;======================================================
;	Helper 1: Reads Integer input [-1,100].
;	Returns:
;		EAX - User input, integer in range [-1,100]
read_score PROC
	MOV EDX, OFFSET prompt_input
	CALL WriteString
	CALL ReadInt
	JMP validation

reenter:
	MOV EDX, OFFSET reenter_prompt
	CALL WriteString
	CALL ReadInt
validation:
	JO reenter
	CMP EAX, -1
	JL reenter
	CMP EAX, 100
	JG reenter
ret
read_score ENDP
;=======================================================


;=====================================================================
;	Helper 2: Given score, prints the grade achieved by the user
;	Arguments:
;		EAX - The score in range of [0-100]
show_grade PROC
MOV EDX, OFFSET grade
CALL WriteString

CMP EAX, 90
JGE grade_A
CMP EAX, 80
JGE grade_B
CMP EAX, 70
JGE grade_C
CMP EAX, 60
JGE grade_D
JMP grade_F

grade_A:
	MOV AL, 'A'
	JMP finally
grade_B:
	MOV AL, 'B'
	JMP finally
grade_C:
	MOV AL, 'C'
	JMP finally
grade_D:
	MOV AL, 'D'
	JMP finally
grade_F:
	MOV AL, 'F'
finally:
	CALL WriteChar
ret
show_grade ENDP
;=====================================================================


;======================================================
;	Main Exercise Procedure
exercise6_4 PROC
MOV ECX, 0					;The counter will be in ECX

student_mark_loop:
	CALL read_score
	
	CMP EAX, -1				;Check if user input -1, which is exit condition
	JE exit_loop

	CALL show_grade
	INC ECX
	CALL Crlf
	CALL Crlf

	JMP student_mark_loop

exit_loop:
	MOV EDX, OFFSET counter
	CALL Crlf
	CALL WriteString
	MOV EAX, ECX
	CALL WriteDec
	CALL Crlf
	CALL WaitMsg

ret
exercise6_4 ENDP
END