
TITLE Exercise 7.6 - Greatest Common Divisor (GCD)

INCLUDE Irvine32.inc

;The greatest common divisor of two integers is the largest integer that will evenly divide both
;integers.The GCD algorithm involves integer division in a loop, described by the following c++
;code:
;		int GCD(int x, int y) {
;			x = abs(x);
;			y = abs(y);
;			do {
;				int n = x % y;
;				x = y;
;				y = n;
;			} while (y > 0);
;			return x;
;		}
;
;Implement this function in assembly language and write a test program that calls the function
;several times, passing it different values. Display all results on the screen.




.data

.code

;	EBX - First value
;	ECX - Second value
exercise7_6 PROC
	MOV EBX, 120
	MOV ECX, 105

	;	Part 1 - Ensure no negatives
	CMP EBX, 0
	JNL val1_abs_done
	NEG EBX
val1_abs_done:
	CMP ECX, 0
	JNL looper
	NEG ECX
looper:
	;	Part 2 - Loop
	MOV EDX, 0
	MOV EAX, EBX
	DIV ECX			; Now Remainder (n) is in EDX

	MOV EBX, ECX	; x = y
	MOV ECX, EDX	; y = n
	
	CMP EDX, 0
	JNE looper

	;	Part 3 - Return
	;	Result in EBX (x)
	CALL DumpRegs

	RET
exercise7_6 ENDP
END