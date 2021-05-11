

TITLE Assembly without INCLUDE


.386									;.386 directive identifies the minimum CPU required for this program (InteI386)
.MODEL flat, stdcall					;.MODEL directive instructs the assembler to generate code for a Protected mode program, 
										; and STDCALL enables the calling of MS-Windows functions
.STACK 4096
ExitProcess PROTO, dwExitCode: DWORD	;Marks Procedure Prototypes. ExitProcess is an MS-Windows function that halts the current program
DumpRegs PROTO							;DumpRegs is a procedure from the Irvine32 link library that displays registers

.code 
main_no_lib PROC
	mov eax, 10000h
	mov eax, 40000h
	mov eax, 20000h
	call DumpRegs

	;INVOKE ExitProcess, 0				;Exit program without library. However since this is procedure, use ret
	ret
main_no_lib ENDP
END