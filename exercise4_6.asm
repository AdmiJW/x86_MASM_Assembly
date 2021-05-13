
TITLE Exercise 4.6 - Fibonacci Numbers

;Write a program that uses a loop to calculate the first seven values in the Fibonacci number
;sequence { 1,1,2,3,5,8,13 }. Place each value in the EAX register and display it with a call
;DumpRegs statement inside the loop.


INCLUDE Irvine32.inc

.data

.code 
exercise4_6 PROC

	;	First 2 Number of Fibonacci
	MOV EAX, 1
	MOV EBX, 1
	MOV ECX, 7
	CALL DumpRegs

fibonacci:
	MOV EDX, EAX   ; Old value
	MOV EAX, EBX   ; Second value become first value
	ADD EBX, EDX   ; Add the old value with second value
	CALL DumpRegs
	
	LOOP fibonacci  ; Loop

	ret
exercise4_6 ENDP
END