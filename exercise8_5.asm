
TITLE Exercise 8.5 - Greatest Common Divisor

INCLUDE Irvine32.inc

;Write a recursive implementation of Euclid's algorithm for finding the greatest common divisor
;(GCD) of two integers. Descriptions of this algorithm are available in algebra books and on the
;Web. (Note: a nonrecursive version of the GCD problem was given in the programming exercises
;for Chapter 7.)
;
;	Note that the Euclid's Algorithm for GCD is:
;
;		if (A = 0) then GCD is B
;		else if (B = 0) then GCD is A
;		else 
;			express A = BQ + R
;			return GCD(B, R)


.code
;----------------------------------------------
GCD PROC USES EDX,
	A:DWORD,
	B:DWORD
;
; Receives: A, B (DWORD) - The A and B to find GCD
; Return: EAX - GCD of A and B
	CMP A, 0
	JE base_case_A
	CMP B, 0
	JE base_case_B
	JMP general_case

base_case_A:
	MOV EAX, B
	RET
base_case_B:
	MOV EAX, A
	RET
general_case:
	MOV EDX, 0
	MOV EAX, A
	DIV B
	INVOKE GCD, B, EDX

	RET
GCD ENDP
;----------------------------------------------



exercise8_5 PROC
	INVOKE GCD, 120, 105
	CALL WriteDec
	CALL Crlf

	INVOKE GCD, 120, 100
	CALL WriteDec
	CALL Crlf

	RET
exercise8_5 ENDP
END