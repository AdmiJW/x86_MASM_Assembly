
TITLE Exercise 7.4 - Shifting Multiple Doublewords

;Write a procedure that shifts an array of five 32-bit integers using the SHRD instructio-,
;(Section 7.2.8). Write a program that tests your procedure and displays the array.
;
; To make the result clear, I am going to shift 8 bits (1 byte, 2 hex digits)
INCLUDE Irvine32.inc

.data
	Array DWORD 11111111h, 22222222h, 33333333h, 44444444h, 55555555h
.code
exercise7_4 PROC
	MOV ECX, 4
	MOV ESI, 12
looper:
	MOV EAX, [Array + ESI]
	SHRD [Array + ESI + 4], EAX, 8
	SUB ESI, 4
	LOOP looper

	SHR [Array], 8			;Last shifting does not require a source.

	;	Output
	MOV ESI, OFFSET Array
	MOV ECX, 5
	MOV EBX, 4
	CALL DumpMem

	RET
exercise7_4 ENDP
END