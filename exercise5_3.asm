
TITLE Exercise 5.3 - Simple Addition (1)

;Write a program that clears the screen, locates the cursor near the middle of the screen, prompts
;the user for two integers, adds the integers, and displays their sum.

INCLUDE Irvine32.inc

.data
	prompt BYTE "Enter Number #1: ", 0
	prompt2 BYTE "Enter Number #2: ", 0
	ans BYTE "Your Sum is: ", 0
	tt BYTE "$$$$$$\            $$\                                                    $$$$$$\", 10, 13
		BYTE "\_$$  _|           $$ |                                                  $$  __$$\", 10, 13
		BYTE "  $$ |  $$$$$$$\ $$$$$$\    $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\        $$ /  \__|$$\   $$\ $$$$$$\$$$$\", 10, 13
		BYTE "  $$ |  $$  __$$\\_$$  _|  $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\       \$$$$$$\  $$ |  $$ |$$  _$$  _$$\ ", 10, 13
		BYTE "  $$ |  $$ |  $$ | $$ |    $$$$$$$$ |$$ /  $$ |$$$$$$$$ |$$ |  \__|       \____$$\ $$ |  $$ |$$ / $$ / $$ |", 10, 13
		BYTE "  $$ |  $$ |  $$ | $$ |$$\ $$   ____|$$ |  $$ |$$   ____|$$ |            $$\   $$ |$$ |  $$ |$$ | $$ | $$ |", 10, 13
		BYTE "$$$$$$\ $$ |  $$ | \$$$$  |\$$$$$$$\ \$$$$$$$ |\$$$$$$$\ $$ |            \$$$$$$  |\$$$$$$  |$$ | $$ | $$ |", 10, 13
		BYTE "\______|\__|  \__|  \____/  \_______| \____$$ | \_______|\__|             \______/  \______/ \__| \__| \__|", 10, 13
		BYTE "                                     $$\   $$ |", 10, 13
		BYTE "                                     \$$$$$$  |", 10, 13
		BYTE "                                      \______/", 0

.code 
exercise5_3 PROC
	CALL Clrscr
	MOV EDX, OFFSET tt
	CALL WriteString

	CALL GetMaxXY		;DL = Columns, DH = Rows 
	SHR DL, 1			;Shift right by 1 bit, equivalent to divide by 2
	MOV BL, DL			;BX as register to save row numbers and column numbers
	MOV BH, 15          
	
getNumber1:
	;Positioning
	MOV DL, BL
	SUB DL, LENGTHOF prompt
	MOV DH, BH
	CALL Gotoxy
	ADD BH, 2

	;Prompting
	MOV EDX, OFFSET prompt
	CALL WriteString
	CALL ReadInt

	JO getNumber1
	MOV ESI, EAX			; I use ESI as temporary storage for input1

getNumber2:
	;Positioning
	MOV DL, BL
	SUB DL, LENGTHOF prompt2
	MOV DH, BH
	CALL Gotoxy
	ADD BH, 2

	;Prompting
	MOV EDX, OFFSET prompt2
	CALL WriteString
	CALL ReadInt

	JO getNumber2
	ADD EAX, ESI		;Sum EAX (curr num) with ESI (prev num)


	MOV DL, BL
	SUB DL, LENGTHOF ans
	MOV DH, BH
	CALL Gotoxy
	MOV EDX, OFFSET ans
	CALL WriteString
	CALL WriteInt
	CALL crlf

	ret
exercise5_3 ENDP
END