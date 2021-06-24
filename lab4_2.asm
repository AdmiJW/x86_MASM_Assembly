TITLE Lab 4.2 - Multiply or Divide

INCLUDE Irvine32.inc

.data
    multiplicand DWORD ?
    multiplier DWORD ?
    product DWORD ?

    prompt_multiplicand BYTE "Please enter a multiplicand <1..9>: ", 0
    prompt_multiplier BYTE "Please enter a multiplier <1..9>: ", 0
    multi_msg BYTE "Multiplication of: ", 0
    product_msg BYTE "The product is: ", 0
.code
lab4_2 PROC

;   Part 1: Prompt Integers
MOV EDX, OFFSET prompt_multiplicand     ;Prompt multiplicand
CALL WriteString
CALL ReadDec
MOV multiplicand, EAX

MOV EDX, OFFSET prompt_multiplier       ;Prompt multiplier
CALL WriteString
CALL ReadDec
MOV multiplier, EAX

;   Part 2: Calculation
MOV EAX, multiplicand
MUL multiplier
MOV product, EAX

;   Part 3: Output
MOV EDX, OFFSET multi_msg
CALL WriteString
MOV EAX, multiplicand
CALL WriteDec
MOV AL, 'x'
CALL WriteChar
MOV EAX, multiplier
CALL WriteDec
CALL Crlf

MOV EDX, OFFSET product_msg
CALL WriteString
MOV EAX, product
CALL WriteDec
CALL Crlf

CALL WaitMsg

RET
lab4_2 ENDP
END
