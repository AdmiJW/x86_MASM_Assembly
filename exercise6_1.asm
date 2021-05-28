
TITLE Exercise 6.1 - ArrayScan using LOOPZ

;Using the ArrayScan program in Section 6.3.4.2 as a model, implement the search using the
;LOOPZ instruction. Optional: draw a flowchart of the program
;
; This program will search in an array for the first non-zero occurrences, using LOOPZ

INCLUDE Irvine32.inc

.data
	arr WORD 0,0,0,0,1,0,0,0
	notFoundStr BYTE "Non-zero occurrences are not found in the array!", 0
	foundStr BYTE "The first non-zero occurrence is found at index: ", 0
.data?
.code
exercise6_1 PROC

;	Initialize Loop counter in ECX. EAX will contain the index, and EBX will contain the actual offset in bytes
MOV ECX, LENGTHOF arr
MOV EAX, -1
MOV EBX, -TYPE arr

;	Search loop
search:
	INC EAX				
	ADD EBX, TYPE arr	; We must add before comparing for zero, because ADDING SET FLAGS
	ADD arr[EBX], 0		; If arr[ebx] is zero, adding with 0 will still be 0. Zero flag set
LOOPZ search

;	Conditional branching
JZ notFound					; If not found, jump to not found segment


MOV EDX, OFFSET foundStr	;Otherwise, the non-zero occurrence is found. Print index
CALL WriteString
CALL WriteDec

JMP endProc

notFound:
	MOV EDX, OFFSET notFoundStr
	CALL WriteString

endProc:
	CALL Crlf
	CALL Crlf
	CALL WaitMsg
ret
exercise6_1 ENDP
END


