
TITLE Exercise 8.3 - Non Recursive Factorial

INCLUDE Irvine32.inc

;Write a nonrecursive version of the Factorial procedure (Section 8.5.2) that uses a loop. Writ e ::.
;short program that interactively tests your Factorial procedure. Let the user enter the value of I:.
;Display the calculated factorial.


.data
	prompt BYTE "Please Enter the Positive integer to calculate factorial: ", 0
.code

;----------------------------------------
NonRecursiveFactorial PROC USES ECX,
	N:DWORD
;
;	Receives: N - N used to calculate N! Type WORD
;	Returns: EAX - N!
;----------------------------------------
	MOV ECX, N
	MOV EAX, 1
looper:
	MUL ECX
	LOOP looper

	RET
NonRecursiveFactorial ENDP



exercise8_3 PROC

main_loop:
	MOV EDX, OFFSET prompt
	CALL WriteString
	CALL ReadInt

	CMP EAX, 0
	JLE quit
	CMP EAX, 12
	JG quit

	INVOKE NonRecursiveFactorial, EAX
	CALL WriteDec
	CALL Crlf
	JMP main_loop
quit:
	RET
exercise8_3 ENDP


END