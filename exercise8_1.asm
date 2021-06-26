
TITLE Exercise 8.1 - Exchanging Integers

INCLUDE Irvine32.inc

;Create an array of randoml y ordered integers. Using the Swap procedure from Section 8.3.6 as a
;tool, write a loop that exchanges each consecutive pair of integers in the array.

; Prototypes
SWAP PROTO,
	pValX:PTR DWORD,
	pValY:PTR DWORD




.data
	MyArr DWORD 1,2,3,4,5,6,7,8,9
.code
;----------------------------------------------
Swap PROC USES EAX ESI EDI,
	pValX: PTR DWORD,			;Pointer to first integer
	pValY: PTR DWORD			;Pointer to second integer
;
; Exchange the values of two 32-bit integers
; Returns: nothing
;----------------------------------------------
	MOV ESI, pValX				;Get pointers
	MOV EDI, pValY
	MOV EAX, [ESI]				;Get first integer
	XCHG EAX, [EDI]				;Exchange with second
	MOV [ESI], EAX				;Replace first integer
	RET
Swap ENDP


exercise8_1 PROC

	MOV ESI, OFFSET MyArr
	MOV ECX, LENGTHOF MyArr - 1

swap_loop:
    MOV EAX, ESI
	ADD EAX, 4
	INVOKE Swap, ESI, EAX
	ADD ESI, 4
	LOOP swap_loop

	;Output
	MOV ESI, OFFSET MyArr
	MOV ECX, LENGTHOF MyArr
	MOV EBX, TYPE MyArr
	CALL DumpMem

	RET
exercise8_1 ENDP
END