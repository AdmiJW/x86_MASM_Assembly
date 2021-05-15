
TITLE Exercise 5.8 - Color Matrix

;Write a program that displays a single character in all possible combinations of foreground and
;background colors (16 x 16 =256). The colors are numbered from 0 to 15, so you can use a
;nested loop to generate all possible combinations

INCLUDE Irvine32.inc

.data
	char BYTE " A ", 0
.code
exercise5_8 PROC

	MOV ECX, 16				;	Loop index i
	MOV EAX, 0				;	Use this to index color, since SetTextColor takes EAX as argument
	MOV EDX, OFFSET char	;	Offset of String to output


;	I will use nested loop because at the end of each background color, I want a endline to be inserted
;	To achieve this, you must use the stack to preserve the state of outer loop ECX
outer_looper:
	PUSH ECX

	MOV ECX, 16
	inner_looper:
		CALL SetTextColor
		CALL WriteString
				
		INC EAX				;	Next color
		LOOP inner_looper
	CALL Crlf

	POP ECX
	LOOP outer_looper


	;	Reset back to default color
	MOV EAX, white + (black * 16)
	CALL SetTextColor

	ret
exercise5_8 ENDP
END