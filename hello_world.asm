;=============================================================================================
;	For references of Irvine32 library, visit http://csc.csudh.edu/mmccullough/asm/help/
;=============================================================================================

;=========================================
; HELLO WORLD, HELLO TO YOU
;=========================================

INCLUDE Irvine32.inc

.data
	MAXINPUT = 80												;	Max characters reserved to read from input

	newline_s BYTE 0Dh, 0Ah, 0									;	Newline
	greet BYTE "Hello World!", 0								;	Greeting string
	greet2 BYTE "Hello, ", 0									;	Greeting string
	prompt BYTE "Please enter your name: ", 0					;	Prompt String
	input BYTE MAXINPUT+1 DUP(?)								;	The variable that will store user inputted name. +1 for null char

.code
NewLine:
	mov edx, OFFSET newline_s
	call WriteString
	ret


main PROC

	mov  edx, OFFSET greet										;	Greet user with Hello World First
    call WriteString		
	call NewLine
	call NewLine

	mov edx, OFFSET prompt
	call WriteString

	mov ecx, MAXINPUT											;	Argument: ECX have to be max number of characters to read
	mov edx, OFFSET input										;	Argument: EDX points to the input buffer
	call ReadString

	call NewLine
	mov edx, OFFSET greet2
	call WriteString
	mov edx, OFFSET input
	call WriteString
	call NewLine

	exit
main ENDP
END main


