
TITLE Exercise 4.5 - Direct-Offset Addressing

;Write instructions that use direct-offset addressing to move the four values in Uarray to the
;EAX, EBX, ECX, and EDX registers. When you follow this with a call DumpRegs statement,
;the following register values should display
;
; EAX=00001000 EBX=00002000 ECX=00003000 EDX=00004000
;
;Next, write instructions that use direct-offset addressing to move the four values in Sarray
;to the EAX, EBX, ECX, and EDX registers. When you follow this with a call DumpRegs statement, the following register values should display:
;	
;	EAX=FFFFFFFF EBX=FFFFFFFE ECX=FFFFFFFD EDX=FFFFFFFC


;	Notes:
;	For this you need 2 knowledge:
;	MOVZX moves a smaller size numbers into larger sizes via zero padding
;	MOVSX does the similar, but checks the sign bit for extension
;
;	Direct offset addressing is simply to offset a address by N bytes. Careful of the data types
;	>	arr[1]	-	Offset 1 byte
;	>	[arr+1]
;	>	arr + 1

INCLUDE Irvine32.inc

.data
Uarray WORD 1000h,2000h,3000h,4000h
Sarray SWORD -1,-2,-3,-4

.code
exercise4_5 PROC

	;	Part 1: Moving Uarray into EAX:EDX using Direct offset addressing
	;	Note: Each WORD is 2 byte in size

	MOVZX EAX, Uarray			;No offset
	MOVZX EBX, Uarray+2			;Offset 2 bytes
	MOVZX ECX, [Uarray+4]		;Offset 4 bytes
	MOVZX EDX, Uarray[6]		;Offset 6 bytes

	CALL DumpRegs

	;	Part 2: Moving Sarray into EAX:EDX using Direct offset addressing
	MOVSX EAX, Sarray			;No offset
	MOVSX EBX, Sarray+2			;Offset 2 bytes
	MOVSX ECX, [Sarray+4]		;Offset 4 bytes
	MOVSX EDX, Sarray[6]		;Offset 6 bytes

	CALL DumpRegs

	ret
exercise4_5 ENDP
END