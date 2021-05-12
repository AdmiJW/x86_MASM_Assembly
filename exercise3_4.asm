
TITLE Exercise 3.4 - Symbolic Text Constants

; For Symbolic Text Constants, we can use 
;	'='
;	EQU   (Do enclose in <> sign to prevent evaluation)
;	TEXTEQU (Prefix with % for constant expression like %(10 * 2) ==> 20

INCLUDE Irvine32.inc

.data
	magic_no = 23
	magic_num TEXTEQU %(magic_no * 3)
	move_opc TEXTEQU <mov>
	instruct TEXTEQU <move_opc eax, magic_num>

.code 
exercise3_4 PROC
	
	instruct
	CALL DumpRegs			;	45h == 69d

	ret 
exercise3_4 ENDP
END