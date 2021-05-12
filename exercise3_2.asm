
TITLE Exercise 3.2 - Data Definitions

;Write a program that contains a definition of each data type listed in Section 3.4. Initialize each
;variable to a value that is consistent with its data type.

.386									;.386 directive identifies the minimum CPU required for this program (InteI386)
.MODEL flat, stdcall					;.MODEL directive instructs the assembler to generate code for a Protected mode program, 
										; and STDCALL enables the calling of MS-Windows functions


.data
	d_word WORD	0FFFFh			; A Word is 16 bit == 4 hex digits
	d_sword SWORD 0FFFFh		; Diff: d_word is interpreted as 65535, d_sword is -1
	d_dword DWORD 0FFFFFFFFh	; A Dword is 32 bit == 8 hex digits
	d_sdword SDWORD 0FFFFFFFFh	
	d_fword FWORD 0FFFFFFFFFFFFh	; A Fword is 48 bit == 12 hex digits
	d_qword QWORD 0FFFFFFFFFFFFFFFFh; A Qword is 64 bit (long) == 16 hex digits
	d_tbyte TBYTE 0FFFFFFFFFFFFFFFFFFFFh ; A Tbyte is 10 bytes == 80 bit == 20 hex digits
	d_real4 REAL4 1.2345		; A Real4 is single precision floating point number
	d_real8 REAL8 1.2345		; A Real8 is double precision floating point number
	d_real10 REAL10 1.2345		; A Real10 is 10-byte, IEEE extended real

END