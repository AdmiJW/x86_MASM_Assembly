
TITLE Exercise 6.3 - TEST Score Evaluation (1)

INCLUDE Irvine32.inc

;Using the following table as a guide, write a program that asks the user to enter an integer test
;score between aand 100. The program should display the appropriate letter grade:
;90 to 100 A
;80 to 89 B
;70 to 79 C
;60 to 69 D
;0 to 59 F


.data
	prompt BYTE "Please Enter your test score (0-100): ", 0
	invalid BYTE "Invalid test score. Please enter again (0-100): ", 0
	finalGrade BYTE "Your grade is: ", 0

.code
exercise6_3 PROC

MOV EDX, OFFSET prompt
CALL WriteString
CALL ReadDec
JMP validation				;Proceed to validation part. The weakness of this program is that it parses alphabetic and other inputs as well.
							;The result is EAX = 0, leading to output grade F

invalidInput:
	MOV EDX, OFFSET invalid
	CALL WriteString
	CALL ReadDec
validation:
	JC invalidInput			;Invalid input
	CMP EAX, 100
	JNS invalidInput		;Input exceeded 100


MOV EDX, OFFSET finalGrade
CALL WriteString

;	Switch cases
CMP EAX, 90
JAE a_grade
CMP EAX, 80
JAE b_grade
CMP EAX, 70
JAE c_grade
CMP EAX, 60
JAE d_grade
JMP f_grade

a_grade:
	MOV AL, 'A'
	JMP finally
b_grade:
	MOV AL, 'B'
	JMP finally
c_grade:
	MOV AL, 'C'
	JMP finally
d_grade:
	MOV AL, 'D'
	JMP finally
f_grade:
	MOV AL, 'F'

finally:
	CALL WriteChar
	CALL Crlf
ret
exercise6_3 ENDP
END