
TITLE Procedure.asm

INCLUDE Irvine32.inc

.data 

.code
procedure PROC
	
	CALL DumpRegs
	
	ret
procedure ENDP
END