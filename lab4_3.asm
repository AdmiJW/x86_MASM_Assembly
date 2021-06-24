
TITLE Lab 4.3 - Odd Even Array Sum

INCLUDE Irvine32.inc

.data
	HELLO DWORD 6 DUP(?)
	TotalEVEN DWORD ?
	TotalODD DWORD ?

	prompt BYTE "Enter Integer : ", 0
	totalOddMsg BYTE "TotalODD is : ", 0
	totalEvenMsg BYTE "TotalEVEN is : ", 0
.code
lab4_3 PROC

;	Part 1: User Input Loop
MOV ECX, 6				; Loop counter
MOV EDI, 0				; Displacement offset
MOV EDX, OFFSET prompt

loop_input:
	CALL WriteString
	CALL ReadInt
	MOV [HELLO+EDI], EAX
	ADD EDI, 4
	LOOP loop_input

;	Part 2: Summing TotalEVEN
MOV EAX, 0
MOV ECX, 3
MOV EDI, 0
sum_even:
	ADD EAX, [HELLO+EDI]
	ADD EDI, 8
	LOOP sum_even
MOV TotalEVEN, EAX

;	Part 3: Summing TotalODD
MOV EAX, 0
MOV ECX, 3
MOV EDI, 4
sum_odd:
	ADD EAX, [HELLO+EDI]
	ADD EDI, 8
	LOOP sum_odd
MOV TotalODD, EAX

;	Part 4: Output
MOV EDX, OFFSET totalOddMsg
CALL WriteString
MOV EAX, TotalODD
CALL WriteInt
CALL Crlf

MOV EDX, OFFSET totalEvenMsg
CALL WriteString
MOV EAX, TotalEVEN
CALL WriteInt
CALL Crlf
CALL WaitMsg

RET 
lab4_3 ENDP
END