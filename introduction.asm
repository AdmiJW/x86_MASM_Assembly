
TITLE Introduction to Assembly						;Title is a assembler directive. Entire line becomes a comment, but semantically

INCLUDE Irvine32.inc								;copies necessary definitions and setup information from a text file named Irvine32.inc

.data												;Data segment. Allocates space in memory
val1 DWORD 10000h
val2 DWORD 40000h
val3 DWORD 20000h
.data?												;By using .data? for uninitialized values, you save the final output size
finalVal DWORD ?

.code												;marks the beginning of the code segment
introduction PROC									;In this assembly, the procedure are called 'introduction'
	mov eax, val1									;mnemonics (opcode), operands...
	add eax, val2
	sub eax, val3
	mov finalVal, eax
	call DumpRegs									;DumpRegs is a procedure defined in Irvine32 library
	ret												;exit is a command defined in Irvine32, calling MS windows halt program
	;exit											;However since this is procedure, please use ret to return to main procedure instead
introduction ENDP									;Marks the end of procedure 'introduction'. In main, use 'main'
END													;Marks the last line of program to be assembled. In main, use END main