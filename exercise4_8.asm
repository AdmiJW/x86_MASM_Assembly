
TITLE String Reversal in Assembly

;Write a program using the LOOP instruction with indirect addressing that copies a string from
;source to target, reversing the character order in the process. Use the following variables:
;			source BYTE "This is the source string",O
;			target BYTE SIZEOF source DUP(O)
;If your program works correctly, you will see the following sequence of hexadec imal bytes on
;the screen when the program runs:
;			67 6E 69 72 74 73 20 65 63 72 75 6F 73 20 65 68
;			74 20 73 69 20 73 69 68 54

;================================================================================================
;	To perform string reversal in Assembly, we have to make use of two indices
;	Although can be done using one, probably
;	Use ESI (Source Index) for source pointer, EDI (Destination Index) as destination pointer
;	Initialization values:
;		>	ESI = 0 (Start at index 0)
;		>	EDI = SIZEOF source - 2 (Omit the null character)
;		>	ECX = SIZEOF source - 1	(We'll reverse all characters in source, except null character)
;
;	Note: Null character at end of source string should not be reversed. We'll reverse only the first N-1 characters
;	
;	Eg: "ABCDE0"		where 0 is null character.
;	Res: "EDCBA0"		the null character should be at the end as well


INCLUDE Irvine32.inc


.data
	source BYTE "ABCDE", 0
.data?
	target BYTE SIZEOF source DUP(?)			;Since it is ASCII taking 1 byte each char, SIZEOF == LENGTHOF

.code
exercise4_8 PROC 
	;===================================================================
	;	Phase 1: Initialize Counters, Source Index, Destination Index
	;===================================================================
	MOV ecx, SIZEOF source - 1	;Loop (size of source - 1), because to exclude the ending null character
	MOV esi, 0					;Start from index 0 of string, incrementing
	MOV edi, SIZEOF source - 2	;Destination first at last second character of string. Last character reserved for null character


	;======================================================
	;	Phase 2: Loops and reversal
	;======================================================
	looper:
		MOV al, source[esi]		;We use al as our temporary store for character
		MOV target[edi], al
		INC esi
		DEC edi
		LOOP looper
	MOV target[SIZEOF target - 1], 0	;For safety, put last Character of target as null character

	;======================================
	;	Phase 3: Output
	;======================================
	;	Parameter for DumpMem (Irvine32 library procedure)
	;	ESI = starting offset
	;	ECX = number of units
	;	EBX = bytes/unit (1,2,or 4)
	MOV esi, OFFSET target
	MOV ebx, 1
	MOV ecx, SIZEOF target
	call DumpMem

	ret
exercise4_8 ENDP 
END