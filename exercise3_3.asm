

TITLE Exericse 3.3 - Symbolic Integer Constants

;Write a program that defines symbolic names for several string literals (characters between
;quotes). Use each symbolic name in a variable definition.

INCLUDE Irvine32.inc

;	Symbolic Constants are simply like macro in C++, any macro is replaced by specified value by assembler
;	Recall there are 3 types of Symbolic Constants
;	'=' - Reassignable
;	'EQU' - Non Reassignable
;	'TEXTEQU' - Reassignable, used for text, text macro


.data
	MONDAY = 0 + 1					;	Show that expression can be evaluated by compiler
	TUESDAY = 1 + MONDAY
	WEDNESDAY = 1 + TUESDAY
	THURSDAY = 1 + WEDNESDAY
	FRIDAY = 1 + THURSDAY
	SATURDAY = 1 + FRIDAY
	SUNDAY = 1 + SATURDAY

	day_arr BYTE MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY

.code
exercise3_3 PROC

	MOV ah, day_arr
	MOV al, day_arr[1]				;	Array offset
	MOV bh, [day_arr+2]				;	Direct offset 
	MOV bl, [OFFSET day_arr + 3]	;	Get offset, add, and dereference
	MOV ch, day_arr+4
	MOV cl, day_arr+5
	MOV dh, day_arr+6
	CALL DumpRegs				;	You should see the AX,BX,CX and DX contain increasing days of week integer

	ret
exercise3_3 ENDP
END