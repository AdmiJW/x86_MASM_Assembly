
TITLE Lab 4.1 - Hexagon Perimeters

INCLUDE Irvine32.inc

.data
	sideHex1 DWORD ?
	sideHex2 DWORD ?
	Perimeter_hexagon1 DWORD ?
	Perimeter_hexagon2 DWORD ?
	TotalPerimeter DWORD ?

	prompt_hex1 BYTE "Enter a side value for hexagon1: ", 0
	prompt_hex2 BYTE "Enter a side value for hexagon2: ", 0
	perimeter_1 BYTE "Perimeter for hexagon1 with side = ", 0
	perimeter_2 BYTE "Perimeter for hexagon2 with side = ", 0
	perimeter_cont BYTE " is : ", 0
	total_msg BYTE "The total perimeter = ", 0
.code
lab4_1 PROC

;	Part 1: Obtain user inputs
MOV EDX, OFFSET prompt_hex1
CALL WriteString
CALL ReadDec
MOV sideHex1, EAX

MOV EDX, OFFSET prompt_hex2
CALL WriteString
CALL ReadDec
MOV sideHex2, EAX

;	Part 2: Calculate Perimeter of Hexagons
MOV ECX, 6
MOV EAX, 0
loop_hex1:
	ADD EAX, sideHex1	
	LOOP loop_hex1
MOV Perimeter_hexagon1, EAX

MOV ECX, 6
MOV EAX, 0
loop_hex2:
	ADD EAX, sideHex2
	LOOP loop_hex2
MOV Perimeter_hexagon2, EAX

;	Part 3: Add two parameters
MOV EAX, Perimeter_hexagon1
ADD EAX, Perimeter_hexagon2
MOV TotalPerimeter, EAX

;	Part 4: Output
MOV EDX, OFFSET perimeter_1
CALL WriteString
MOV EAX, sideHex1
CALL WriteDec
MOV EDX, OFFSET perimeter_cont
CALL WriteString
MOV EAX, Perimeter_hexagon1
CALL WriteDec
CALL Crlf

MOV EDX, OFFSET perimeter_2
CALL WriteString
MOV EAX, sideHex2
CALL WriteDec
MOV EDX, OFFSET perimeter_cont
CALL WriteString
MOV EAX, Perimeter_hexagon2
CALL WriteDec
CALL Crlf

MOV EDX, OFFSET total_msg
CALL WriteString
MOV EAX, TotalPerimeter
CALL WriteDec
CALL Crlf

CALL WaitMsg

RET 
lab4_1 ENDP
END
