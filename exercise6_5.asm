
TITLE Exercise 6.5 - College Registration (1)

INCLUDE Irvine32.inc

;Using the College Registration example from Section 6.7.2.2 as a starting point, do the following:
;	Recode the logic using CMP and conditional jump instructions (instead of the .IF and
;	.ELSEIF directives).
;	Perform range checking on the credits value; it cannot be less than 1 or greater than 30. If
;	an invalid entry is discovered, display an appropriate error message

.data
	TRUE = 1
	FALSE = 0
	gradeAverage WORD 251
	credits WORD 17
	OkToRegister BYTE ?

	invalid_credit_msg BYTE "The credit is invalid since it is not in range [1,30]!", 0
	eligible_msg BYTE "Your registration status: ", 0
.code
exercise6_5 PROC
	;	First, check the range of the credits value
	CMP credits, 1
	JL invalid_credit
	CMP credits, 30
	JG invalid_credit
	JMP valid_credit

invalid_credit:
	MOV EDX, OFFSET invalid_credit_msg
	CALL WriteString
	CALL Crlf
	ret

valid_credit:
	;Shuffles up the ordering of the condition makes the code easier
	MOV OkToRegister, FALSE
	;Condition 1: gradeAverage > 350
	CMP gradeAverage, 350
	JG can_register
	;Condition 2: credits <= 12
	CMP credits, 12
	JLE can_register
	;Condition 3: if gradeAverage <= 250 or credits > 16, CANNOT register
	CMP gradeAverage, 250
	JLE finally
	CMP credits, 16
	JG finally

can_register:
	MOV OkToRegister, TRUE

finally:
	MOV EDX, OFFSET eligible_msg
	CALL WriteString
	MOVZX EAX, OkToRegister
	CALL WriteDec

ret 
exercise6_5 ENDP
END