
TITLE Exercise 6.9 - Weighted Probabilities

INCLUDE Irvine32.inc

;Write a program that randomly chooses between three different colors for displaying text on the
;screen. Use a loop to display twenty lines of text, each with a randomly chosen color. The probabilities for each color are to be as follows: white = 30%, blue = 10%, green = 60%. Hint: generate a random integer between 0 and 9. If the resulting integer is in the range 0-2, choose white.
;If the integer equals 3, choose blue. If the integer is in the range 4-9, choose green.

.data
	sample_str BYTE "This is a Sample String.", 13, 10, 0
.code
exercise6_9 PROC
	MOV ECX, 20
	MOV EDX, OFFSET sample_str
main_loop:
	;Generate a number from 0 through 9
	MOV EAX, 10
	CALL RandomRange

	;Check for the color (Branching)
	CMP EAX, 2
	JLE white_color
	CMP EAX, 3
	JE blue_color
	JMP green_color

	white_color:
		MOV EAX, white+(black*16)
		JMP proceed
	blue_color:
		MOV EAX, blue+(black*16)
		JMP proceed
	green_color:
		MOV EAX, green+(black*16)
		JMP proceed
proceed:
	CALL SetTextColor
	CALL WriteString
	LOOP main_loop

	ret
exercise6_9 ENDP
END
