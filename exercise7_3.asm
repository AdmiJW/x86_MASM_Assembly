
TITLE Exercise 7.3 - ShowFileTime

;Suppose the time field of a file directory entry uses bits 0-4 for the number of two-second increments, bits 5-10 for the minutes, and bits 11-15 for the hours (24-hour clock). For example, the
;following binary value indicates a time of 02:16:14, in hh:mm:ss format:
;
;		00010 010000 00111
;
;Write a procedure named ShowFileTime that receives a binary file time value in the AX registeand displays the time in hh:mm:ss format.
;

;	Perform parsing on AX register. Seconds need to be multiplied by 2

INCLUDE Irvine32.inc

.data

.data?
	Seconds BYTE ?
	Minutes BYTE ?
	Hours BYTE ?
.code
exercise7_3 PROC

	MOV AX, 0001001000000111b

	
	;Parse the binary formatted time in AX
	;Seconds
	MOV BX, AX
	AND BX, 11111b
	SHL BX, 1               ;Left shift to multiply by 2!
	MOV [Seconds], BL

	;Minutes
	MOV BX, AX
	AND BX, 11111100000b
	SHR BX, 5				;Minutes are offset by 5 bits
	MOV [Minutes], BL

	;Hours
	MOV BX, AX
	AND BX, 1111100000000000b
	SHR BX, 11				;Hours are offset by 11 bits
	MOV [Hours], BL


	;Output
	MOV EAX, 0
	MOV AL, [Hours]
	CALL WriteDec

	MOV AL, ':'
	CALL WriteChar

	MOV EAX, 0
	MOV AL, [Minutes]
	CALL WriteDec

	MOV AL, ':'
	CALL WriteChar

	MOV EAX, 0
	MOV AL, [Seconds]
	CALL WriteDec
	
	RET
exercise7_3 ENDP
END