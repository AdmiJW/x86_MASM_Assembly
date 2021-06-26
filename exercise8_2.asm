
TITLE Exercise 8.2 - DumpMem Procedure

INCLUDE Irvine32.inc

;Write a wrapper procedure for the link library's DumpMem proce dure , using stack parameters.
;Th e name can be slightly different, such as DumpMemory. The following is an example of how
;it should be called:
;
;		INVOKE DumpMemory, OFFSET array, LENGTHOF array, TYPE array
;
;Write a test program that calls your procedure several times, using a variety of data types

.data
	ExampleArr DWORD 1,2,3,4,5,6,7,8,9
	ExampleArr2 BYTE 9,8,7,6,5,4,3,2,1
.code
DumpMemory PROC USES ESI ECX EBX,
	Address:PTR DWORD,
	Len:DWORD,
	Typ:DWORD

	MOV ESI, Address
	MOV ECX, Len
	MOV EBX, Typ
	CALL DumpMem

	RET
DumpMemory ENDP


exercise8_2 PROC
	INVOKE DumpMemory, OFFSET ExampleArr, LENGTHOF ExampleArr, TYPE ExampleArr

	INVOKE DumpMemory, OFFSET ExampleArr2, LENGTHOF ExampleArr2, TYPE ExampleArr2
	RET
exercise8_2 ENDP
END