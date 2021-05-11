
TITLE Basic Arithmetic

INCLUDE Irvine32.inc

.data
	val1 WORD 9999h
	val2 WORD 6666h
	val3 WORD 1111h

.code
arithmetic PROC
	MOV ax, val1
	SUB ax, val2
	SUB ax, val3
	CALL DumpRegs
	ret
arithmetic ENDP
END