
TITLE Array Sum Procedure

;	** Works for unsigned integer only
;	Arguments:
;	ESI - The Offset of the array
;	ECX - The Number of Elements in Array
;
;	Returns:
;	EAX - Sum of elements in array


.386						
.MODEL flat, stdcall					


.code 
array_sum PROC

	;	Ensure that the ESI, ECX, EDX are returned as it is
	PUSH ESI
	PUSH ECX
	PUSH EDX

	;	Sum will be inside EAX
	MOV EAX, 0

Summing:
	ADD EAX, [ESI]
	ADD ESI, 4				;Each integer is 4 bytes in size
	LOOP Summing

	;	Remember LIFO. Pop in reversed order
	POP EDX
	POP ECX
	POP ESI

	ret 
array_sum ENDP
END


;	Example Usage in Main
;
;		MOV ESI, OFFSET arr
;		MOV ECX, LENGTHOF arr
;		CALL DumpRegs
;
;		CALL array_sum 
;
;		CALL DumpRegs