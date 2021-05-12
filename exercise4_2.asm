
TITLE Exercise 4.2 - INC and DEC

;Write a short program demonstrating that the INC and DEC instructions do not affect the Carry
;flag

INCLUDE Irvine32.inc

.data
	v1 WORD 0FFFFh
	v2 WORD 0h

.code 
exercise4_2 PROC
	
	MOV ax, v1
	INC ax
	CALL DumpRegs

	ADD ax, 0		; Add 0 to AX to clear CF

	MOV ax, v2
	DEC v2
	CALL DumpRegs

	ret
exercise4_2 ENDP
END