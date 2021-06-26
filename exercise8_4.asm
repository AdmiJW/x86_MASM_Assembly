
TITLE Exercise 8.4 - Factorial Comparison

INCLUDE Irvine32.inc

;Write a program that compares the runtime speeds of both the recursive Factorial procedure frorSection 8.5.2 and the nonrecursive Factorial procedure written for the preceding programming
;exercise. Use the GetMseconds procedure from the book's link library to measure and display the
;number of milliseconds required to call each Factorial procedure several thousand times in a row

.data
	Non_recursive_timeMsg BYTE "Milliseconds taken to loop 999999 times, calculate 12! iteratively: ", 0
	Recursive_timeMsg BYTE "Milliseconds taken to loop 999999 times, calculate 12! recursively: ", 0
.data?
	Nonfact_begintime DWORD ?
	Fact_begintime DWORD ?

.code

;----------------------------------------
NonRecursiveFactorial2 PROC USES ECX,
	NonRecursiveN:DWORD
;
; Receives: N (DWORD) - N use in calculating N!
; Returns: EAX - Result of N!
	MOV ECX, NonRecursiveN
	MOV EAX, 1
non_recursive_looper:
	MUL ECX
	LOOP non_recursive_looper

	RET
NonRecursiveFactorial2 ENDP
;-----------------------------------------


;---------------------------------------------
RecursiveFactorial PROC USES EBX,
	RecursiveN:DWORD
;
; Receives: N (DWORD) - N use in calculating N!
; Returns: EAX - Result of N!
	CMP RecursiveN, 1
	JLE base_case

	MOV EBX, RecursiveN
	DEC EBX
	INVOKE RecursiveFactorial, EBX
	MOV EBX, RecursiveN
	MUL EBX
	JMP recursive_quit
base_case:
	MOV EAX, 1
recursive_quit:
	RET
RecursiveFactorial ENDP


exercise8_4 PROC
	;Non recursive time
	MOV ECX, 999999
	CALL GetMseconds
	MOV Nonfact_begintime, EAX

non_recursive_loop:
	INVOKE NonRecursiveFactorial2, 12
	LOOP non_recursive_loop

	;Calculate Time taken
	CALL GetMseconds
	MOV EDX, OFFSET Non_recursive_timeMsg
	CALL WriteString
	SUB EAX, Nonfact_begintime
	CALL WriteDec
	CALL Crlf

	
	;Recursive time
	MOV ECX, 999999
	CALL GetMseconds
	MOV Fact_begintime, EAX

recursive_loop:
	INVOKE RecursiveFactorial, 12
	LOOP recursive_loop
	
	;Calculate Time taken
	CALL GetMseconds
	MOV EDX, OFFSET Recursive_timeMsg
	CALL WriteString
	SUB EAX, Fact_begintime
	CALL WriteDec
	CALL Crlf

	RET
exercise8_4 ENDP
END