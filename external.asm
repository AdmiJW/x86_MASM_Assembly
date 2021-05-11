.686p
.model flat,stdcall
option casemap:none

.code

; Define the body of external_adder



external_adder PROC arg1:DWORD, arg2:DWORD
    mov eax,arg1
    add eax,arg2
    ret
external_adder ENDP

END