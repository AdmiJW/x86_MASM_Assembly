
TITLE Operator Cheat Sheet

;
;	Provides quick reference based on the book Kip R. Irvine - Assembly Language for Intel-based Computers-Prentice Hall (2002)



;============================================================
;	Chapter 3 - Assembly Language Fundamentals
;============================================================
;
;	+, -, *, /, MOD		: Arithmetic operators. Interpreted by Assembler so no registers involved
;	Strings are enclosed in "" or '', representing array of bytes
;
;	Data Declarations
;
;		>	BYTE	- 8 bit unsigned integer (2 hex)
;		>	SBYTE	- 8 bit signed integer	 (2 hex)
;		>	WORD	- 16 bit unsigned integer (4 hex)
;		>	SWORD	- 16 bit signed integer (4 hex)
;		>	DWORD	- 32 bit unsigned integer (8 hex)
;		>	SDWORD	- 32 bit signed integer (8 hex)
;		>	FWORD	- 48 bit integer (12 hex)
;		>	QWORD	- 64 bit integer (16 hex)
;		>	TBYTE	- 80 bit integer (20 hex)
;		>	REAL4	- 32 bit IEEE short real (single precision)
;		>	REAL8	- 64 bit IEEE long real (double precision)
;		>	REAL10	- 80 bit IEEE extended real
;
;		DUP :	<Frequency> DUP( <Value> )
;				Eg: 20 DUP(0)		=> 0 0 0 0 0 0 0... 0
;
;		* Hexadecimal value starting with alphabet must be prefix with 0
;		* Remember that data are stored in Little Endian order
;
;	Symbolic Constants:
;		> Equal-Sign Directive - associate symbol name with integer expr
;				Eg: COUNT = 500
;		> EQU Directive - Associate symbol name with integer expr or some text
;						  Please note that anything inside <> is evaluated as text expression (Operators wont evaluate)
;				Eg: pressKey EQU <"Press any key to continue...", 0>
;				Eg: SIZE EQU 12
;		> TEXTEQU Directive - <> for text macro, % for constant expression, other for existing text macro
;				Eg: continueMsg TEXTEQU <"Do you wish to continue?">
;				Eg: rowSize = 5
;					count TEXTEQU %(rowSize * 2)      ==> 10












;============================================================
;	Chapter 4 - Data Transfers, Addressing and Arithmetic
;============================================================
;
;	* To get address of a identifier, use OFFSET <identifier>
;	* To reference to value in address, use [address]
;	* To access array elements, we use direct offset. Say:
;			MOV AL, [arrayB + 20]
;	  From address of arrayB, it will offset by 20 BYTES to access the element
;
;	==============================================================
;	DIRECT MEMORY OPERANDS
;	==============================================================
;
;	MOV - Copies data from source operand to destination operand
;		+ MOV reg, reg
;		+ MOV mem, reg
;		+ MOV reg, mem
;		+ MOV mem, imm
;		+ MOV reg, imm
;
;	MOVZX - Move with zero-extend (Destination larger than src). Unsigned integer only
;		+ MOVZX r32, r/m8
;		+ MOVZX r32, r/m16
;		+ MOVZX r16, r/m8
;
;	MOVSX - Move with sign extend (Extends MSB)
;		+ MOVSX r32, r/m8
;		+ MOVSX r32, r/m16
;		+ MOVSX r16, r/m8
;
;	LAHF - Load Status Flags into AH. (Sign, Zero, Auxiliary carry, Parity, Carry)
;	SAHF - Saves AH into EFLAGS register.
;		Opertation: SF:ZF:xx:AF:xx:PF:xx:CF -> AH
;		+ LAHF
;		+ SAHF
;
;	XCHG - Exchange contents of two operands
;		+ XCHG reg, reg
;		+ XCHG reg, mem
;		+ XCHG mem, reg
;
;	==============================================================
;	Addition and Subtraction
;	==============================================================
;
;	INC - Add 1 to a single operand
;	DEC - Subtract 1 from a single operand
;		+ INC reg/mem
;		+ DEC reg/mem
;
;	ADD - Adds source operand to destination operand OF SAME SIZE
;		+ ADD destination, source
;		! Flags affected
;
;	SUB - SUbtracts a source operand from destination operand OF SAME SIZE
;		+ SUB destination, source
;		! Flags affected
;
;	NEG - Two complement a operand.
;		+ NEG reg/mem
;		! Flags affected
;
;	==============================================================
;	Flags
;	==============================================================
;	
;	Zero Flag - Set when arithmetic instruction result in a value of 0
;	Sign Flag - Set when result of arithmetic operation is negative.
;	Carry Flag - When arithmetic operation result in a carry out from MSB, or subtract large unsigned from small unsigned (1-2)
;				 Significant only when performing unsigned arithmetic
;	Overflow Flag - Done by XOR carry out of MSB with carry out of second MSB.
;	Auxiliary Flag - In the lower byte, when there is carry out from lower nibble MSB.
;					 Used for Binary encoded Decimal
;	Parity Flag - Checks the lower byte, and sets 1 if it is even number of 1s (Most cases)
;
;	==============================================================
;	Data Related Operators and Directives (MASM Specific)
;	==============================================================
;
;	OFFSET - Returns offset of a data label (distance in bytes from beginning of data segment)
;		+ MOV ESI, OFFSET bVal
;
;	ALIGN - Align a variable on a byte, word, doubleword or paragraph boundary
;		    Think of it as 'spacing' the varibles' so they are not arranged so sequentially
;		+ bVal BYTE ?			; 00404000
;		  ALIGN 2				; Aligns bVal to be size 2 bytes
;		  wVal BYTE ?			; 00404002
;
;	PTR - override the default size of an operand.
;		+ <type> PTR <variable>
;		+ MOV AX, WORD PTR doubleWordVariable 
;		+
;
;	TYPE - Returns size (in bytes) of single element of variable
;		   BYTE - 1, WORD - 2, DWORD - 4...
;		+ MOV ECX, TYPE var1
;
;	LENGTHOF - Returns number of elements in an arrays
;		+ MOV ECX, LENGTHOF myArr
;
;	SIZEOF - Equivalent to LENGTHOF*SIZE, total number of bytes taken by an array
;		+ MOV ECX, SIZEOF myArr
;
;	==============================================================
;	JMP and LOOP
;	==============================================================
;
;	JMP - Unconditional transfer to target location, which should be either
;		  a code label or offset
;		+ JMP targetLabel
;
;	LOOP - Loop the instructions from code label until ECX equals zero.
;		+ LOOP destination










;============================================================
; Chapter 5 - Procedures
;============================================================
;
;	* We define Procedures using 'PROC' operator:
;			myProc PROC
;			...
;			myProc ENDP
;
;	* Remember that procedures should call 'RET' so control is transferred back into calling procedure
;
;	* Procedures are called via 'CALL' instruction:
;		+ CALL myProc
;
;	* If the procedure is from external files, the 'PROTO' of the procedure must be included
;			myProcedure PROTO
;
;	* .inc files usually include those PROTO declarations. Then, the 'INCLUDE' will copy contents
;	  from the file and paste into where the operator is called
;
;	==============================================
;	Stack Operations
;	==============================================
;	* Within our memory (RAM), there is an area defined as Stack memory, a place for storing possibly
;	  essential data through CALL, RET, PUSH, POP etc, and we as programmers has access to it.
;
;	* In Intel design, the stack grow downwards. Eg stack base can be at 0100, and stack top can be at 0000
;	  Nevertheless, ESP register always hold the address of stack top
;
;	PUSH - Copies a 16 or 32 bit source operand into the stack. ESP decrements
;		   based on size of source operand
;		+ PUSH r/m16
;		+ PUSH r/m32
;		+ PUSH imm32
;
;	POP - First copies the content of stack element pointed by ESP into
;		  16 or 32 bit destination operand, then increments ESP
;		+ POP r/m16
;		+ POP r/m32
;
;	PUSHFD - Pushes 32-bit EFLAGS register onto the Stack
;	POPFD - Pops the stack into EFLAGS
;		+ PUSHFD
;		+ POPFD
;
;	PUSHAD - Push (EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI) onto stack
;	POPAD - Pops (EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI) from stack
;	PUSHA - Push (AX, CX, DX, BX, SP, BP, SI, DI) onto stack
;	POPA - Push (AX, CX, DX, BX, SP, BP, SI, DI) from stack
;		+ PUSHAD
;		+ POPAD
;		+ PUSHA
;		+ POPA
;
;	==============================================
;	Saving and Restoring Registers
;	==============================================
;
;	It might occur to you when inside a procedure, you want to
;	modify some registers, but at the end of procedure, want it to be
;	restored.
;	Although you can achieve this using PUSH and POP easily, one can use a more
;	elegant way via 'USES'
;
;	'USES" operator is coupled with PROC directive, let you list all the names of all
;	registers you want to modify within a procedure, but still having original value after procedure
;	returns
;
;		+ ArraySum PROC USES esi ecx
;			...
;			ret
;		  ArraySum ENDP







;============================================================
; Chapter 6 - Conditional Processing
;============================================================
;	
;	===================================
;	Boolean and Comparison Instructions
;	===================================
;
;	AND - bitwise AND between two operands of SAME SIZE (bit by bit). Places result in destination operand
;		  One usecase is convert ASCII to uppercase, by clearing bit 5 (0 indexed)
;		+ AND destination, source
;
;		+ AND reg, reg
;		+ AND reg, mem
;		+ AND reg, imm
;		+ AND mem, reg
;		+ AND mem, imm
;
;		Flag - Clears Overflow, Carry
;			 - Modifies Sign, Zero and Parity
;
;	OR - bitwise OR between two operands of SAME SIZE
;		 One usecase is convert single digit into ASCII counterpart, by setting bit 4 and 5 (0 indexed)
;		+ OR destination, source
;
;		Flag - Clears Overflow, Carry
;			   Modifies sign, zero and parity
;
;	XOR - bitwise XOR between two operands of SAME SIZE.
;		+ XOR destination, source
;
;		Flag - Clears Overflow, Carry
;			   Modifies Sign, Zero, Parity
;
;	NOT - toggles all bits in an operand, aka One's Complement
;		+ NOT reg
;		+ NOT mem
;
;		Flag - No affect
;
;	TEST - Performs implied AND operation, but doesn't change destination operand
;		   Flags are manipulated, so we can 'test' if individual bits in an operaand are set via aid of flags (Especially Zero Flag)
;		+ TEST destination, source 
;	
;		Flag - Clear Overflow, Carry
;			   Mofifies Sign, Zero, Parity
;
;	CMP - Performs implied SUBTRACTION of source operand from destination operand.
;		  NO operands are modified. Only flag is set
;		+ CMP destination, source
;	
;		Flag - Modifies Overflow, Sign, Zero, Carry, Auxiliary Carry, Parity
;
;		Unsigned
;		Cases: Dest < Src  => ZF = 0, CF = 1
;			   Dest > Src  => ZF = 0, CF = 0
;			   Dest = Src  => ZF = 1, CF = 0
;	
;		Signed
;		Cases: Dest < Src  => SF != OF
;			   Dest > Src  => SF = OF
;			   Dest = Src  => ZF = 1
;
;	==============================
;	Conditional Jumps
;	==============================
;
;	* All of those are based on the syntax
;			J<cond> destinationLabel
;	  but some are more semantically make sense than other
;	  
;	These Jump instructions mostly are called after a CMP or TEST or bitwise instructions
;	on:
;			CMP leftOp, rightOp
;
;	Based on Flag values:
;		JZ - Jump if zero
;		JNZ - Jumpt if not zero
;		JC - Jump if carry
;		JNC - Jump if not carry
;		JO - Jump if overflow
;		JNO - Jump if not overflow
;		JS - Jump if signed
;		JNS - Jump if not signed
;		JP - Jump if parity (even in lower byte)
;		JNP - Jump if not parity (odd in lower byte)
;
;	Based on Equality
;		JE - Jump if equal (leftOp == rightOp)
;		JNE - Jump if not equal (leftOp != rightOp)	
;		JCXZ - Jump if CX = 0
;		JECXZ - Jump if ECX = 0
;
;	Based on Unsigned Comparisons
;		JA - Jump if above (leftOp > rightOp)
;		JNBE - Jump if not below or equal (leftOp > rightOp)
;		JAE - Jump if above or equal (leftOp >= rightOp)
;		JNB - Jump if not below (leftOp >= rightOp)
;		JB - Jump if below (leftOp < rightOp)
;		JNAE - Jump if not above or equal (leftOp < rightOp)
;		JBE - Jump if below or equal (leftOp <= rightOp)
;		JNA - Jump if not above (leftOp <= rightOp)
;
;	Based on Signed Comparisons
;		JG - Jump if greater (leftOp > rightOp)
;		JNLE - Jump if not less than or equal (leftOp > rightOp)
;		JGE - Jump if greater than or equal (leftOp >= rightOp)
;		JNL - Jump if not less (leftOp >= rightOp)
;		JL - Jump if less (leftOp < rightOp)
;		JNGE - Jump if not greater than or equal (leftOp < rightOp)
;		JLE - Jump if less than or equal (leftOp <= rightOp)
;		JNG - Jump if not greater (leftOp <= rightOp)
;
;		
;	=============================
;	Conditional Loop Instructions
;	=============================
;
;	Previously, our loop only can check decreasing ECX as loop condition.
;	Now we will have several more instructions for conditional looping
;
;	LOOPZ / LOOPE - Loops while zero flag is 1, and ECX is greater than zero
;		+ LOOPZ destination
;		+ LOOPE destination
;
;	LOOPNZ / LOOPNE - Loops while zero flag is 0 and ECX is greater than zero
;		+ LOOPNZ destination
;		+ LOOPNE destination
;
;	============================================
;	IF, REPEAT AND WHILE directive (MASM Only)
;	============================================
;	MASM provides a powerful directive, '.IF', that makes conditional programming
;	much easier, if you decide to use it.
;
;	.IF condition1
;		statements
;	[.ELSEIF condition2
;		statements]
;	[.ELSE
;		statements]
;	.ENDIF
;
;	Anything within square brackets are optional.
;
;		expr1 == expr2	- True if expr1 equal to expr2
;		expr1 != expr2	- True if expr1 not equal to expr2
;		expr1 > expr2	- True if expr1 is greater than expr2
;		expr1 >= expr2	- True if expr1 is greater than or equal to expr2
;		expr1 < expr2	- True if expr1 is less than expr2
;		expr1 <= expr2	- True if expr1 is less than or equal to expr2
;		!expr			- True if expr is false
;		expr1 && expr2	- Logical AND between expr1 and expr2
;		expr1 || expr2	- Logical OR between expr1 and expr2
;		expr1 & expr2	- Bitwise AND between expr1 and expr2
;		CARRY?			- True if Carry flag is 1
;		OVERFLOW?		- True if Overflow flag is 1
;		PARITY?			- True if Parity flag is 1
;		SIGN?			- True if Sign flag is 1
;		ZERO?			- True if Zero flag is 1
;
;	Other than IF, we also have .REPEAT and .WHILE, which is equivalent to do-while and while loop
;
;		+ .REPEAT
;			statements
;		  .UNTIL condition
;
;		+ .WHILE condition
;			statements
;		  .ENDW
;





;=================================================
; Chapter 7: Integer Arithmetic
;=================================================
; 
; ========================
; Bitwise Instructions
; ========================
;
;	>	SHL <destination>, <count> - Performs bitwise shift left, lowest bit filled with 0
;	>	SHR <destination>, <count> - Performs bitwise shift right, highest bit filled with 0
;	>	SAL <destination>, <count> - Identical to SHL
;	>	SAR <destination>, <count> - Performs bitwise shift right, highest bit is duplicate of sign bit
;	>	ROL <destination>, <count> - Rotate left, shifting each bit to left, highest bit goes to lowest bit and also carry flag.
;	>	ROR <destination>, <count> - Rotate right, shifting each bit to right, lowest bit goes to highest bit and also carry flag
;	>	RCL <destination>, <count> - Rotate Carry right, shift each bit to left, copy carry flag to LSB, copy MSB into carry flag
;	>	RCR <destination>, <count> - Rotate Carry left, shift each bit to right, copy carry flag into MSB, copy LSB into carry flag
;	>	SHLD <destination>, <source>, <count> - Shift left count times. Rightmost bits are filled with highest bits of source operand
;	>	SHRD <destination>, <source>, <count> - Shift right count times. Leftmost bits are filled with lowest bits of source operand
;
;	Left shifting essentially performs multiplication of 2
;	Right shifting essentially performs division of 2
;	Using SAR, division by 2 can be done on signed integers
;	
;	Using Left Shifting or Right shift, each bit can be extracted through the help of carry flag
;
;
; =====================================
;	Multiplication and Division
; =====================================
;	>	MUL <multiplier> - (Unsigned Multiply) on AL, AX, or EAX based on size of operand
;
;		MULTIPLICAND | MULTIPLIER | PRODUCT
;		AL			 | r/m8		  | AX
;		AX			 | r/m16	  | DX:AX
;		EAX			 | r/m32	  | EDX:EAX
;
;	>	IMUL <multiplier> - (Signed Multiply) - Same as MUL, but preserves the sign of product
;	
;	>	DIV <divisor> - (Unsigned Divide)
;
;		DIVIDEND | DIVISOR | QUOTIENT | REMAINDER
;		AX		 | r/m8	   | AL		  | AH
;		DX:AX	 | r/m16   | AX		  | DX
;		EDX:EAX  | r/m32   | EAX	  | EDX
;
;	>	CBW - (Convert Byte to Word) - Extends sign bit of AL into AH.
;	>	CWD - (Convert Word to Doubleword) - Extends sign bit of AX into DX
;	>	CDQ - (Convert Dword to Quadword) - Extends sign bit of EAX into EDX
;
;	>	IDIV <divisor> - (Signed Division). One must sign extend before divide
;	
;		8 bit dividend > Call CBW
;		16 bit dividend > Call CWD
;		21 bit dividend > Call CDQ
;
;
; ======================================
;	Extended Addition and Subtraction
; ======================================
;
;	>	ADC <destination>, <operand> - (Add with carry) Adds destination with operand, but also add carry flag
;	>	SBB <destination>, <operand> - (Substraction with Borrow) Substracts destination with operand and carry flag
;	
;
;
; ======================================
;	ASCII and Packed Decimal Arithmetic
; ======================================
;
; Some instructions provided in x86 are designed to perform arithmetics directly from ASCII digits!
; First,
;	> From ASCII codes, digit '0' to '9' represented in HEX values are 30h to 39h respectively
;	  This means by performing AND with 00001111b (Eliminating the high 4 bits), I will get the correct digit value
; 
; REPRESENTATIONS:
;
; ASCII Decimal - Digits are stored in ASCII code. Eg: '1' stored as hexadecimal 31h
;				  In binary, the high 4 bit are always 0011b (3h), and lower is simply the value itself.
;
;					Eg: '2' - 32h
;						'9' - 39h
;
; Unpacked Decimal - After AND the ASCII code digit with 00001111b, you will get the digit value stored in a byte (8 bits),
;					where the high 4 bits is always 0. This is unpacked decimal - A digit stored in a byte
;
;					Eg: 2 - 02h - 0000 0010
;						9 - 09h - 0000 1001
;
; Packed Deciaml - TWO digits are stored in a byte, each occupying 4 bits. You can view hexidecimal as decimal
;
;					Eg: 32 - 32h - 0011 0010
;						99 - 99h - 1001 1001
;
;	=============================================================================
;	NOTE: ALL THE FOLLOWING INSTRUCTIONS REQUIRE YOU TO CLEAR AH FIRST TO ALL 0
;
;	> AAA - (ASCII adjust after addition) Called after adding two digits in ASCII REPRESENTATION in AL
;			Results in UNPACKED Decimal Representation in AX
;
;	> AAS - (ASCII adjust after subtraction) Called after substracting two digit in UNPACKED DECIMAL REPRESENTATION in AL
;			Results in UNPACKED Decimal Representation in AX
;
;	> AAM - (ASCII adjust after multiplication) Called after multiplying two digits in UNPACKED DECIMAL REPRESENTATION in AL
;			Results in UNPACKED Decimal Representation
;
;	> AAD - (ASCII adjust before division) Called BEFORE dividing up to 2 digits in AX (Eg: 0307h as 37d) in UNPACKED DECIMAL REPRESENTATION
;			Results in UNPACKED Decimal Representation
;			Quotient in AL, Remainder in AH
;
;	> DAA - (Decimal Adjust After Addition) Called After adding digits in PACKED DECIMAL REPRESENTATION in AL
;			Results in PACKED Decimal Representation
;
;	> DAS - (Deciaml Adjust After Subtraction) Called After subtracting digits in PACKED DECIMAL REPRESENTATION in AL
;			Results in PACKED Decimal Representation
;	









;========================================================
; Chapter 8: Advanced Procedures
;========================================================
;
;
; ====================================
;	Local Variables
; ====================================
;	
; All the variables declared in the data segment (.data) are called
; static global variables. They exist as long as the program is still running.
;
; Local variables on the other hand, should only exist within a single procedure.
; Once the procedure is returned, the local variable shall be destroyed as well.
;
; In Assembly language, local variables are created on the runtime stack, and popped once
; the procedure has finished its job, thus releasing the stack memory.
;
; To declare a local variable, we use the LOCAL directive immediately after the PROC directive
;
;			myProc PROC
;				LOCAL <varlist>
;
; where <varlist> is a list of variables separated by comma, taking the form <label>:<type>, like:
;
;			myProc PROC
;				LOCAL var1:BYTE,			;var1 of type BYTE
;					  var2:DWORD,			;var2 of type DWORD
;					  pArr:PTR WORD			;pArr is a memory address of type WORD
;					  arr[10]:DWORD			;An array of size 10, type DWORD
;
; When deassembled, the space used by local variables are reserved and stored in the stack.
; through a series of push and pop operations
;
; Be sure to allocate adequate stack space before assembling the program using directive:
;			.stack <memsize in bytes>
; In Irvine32.inc, it is already reserved 4096(4MB) of stack memory:
;			.stack 4096
;
;
; =================================
;	Stack Parameters
; =================================
;
; There are two types of procedure parameters:
;	>	Register parameters - Pass in arguments in specified register before calling procedure
;	>	Stack parameters - Push arguments to stack before calling the procedure
;
; In MASM, we can specify the stack parameters for proceures:
;		myProc PROC, <param1>, <param2>...
; which <param1>, <param2>... takes the form:
;		paramName:type
; like:
;		myProc PROC, num:DWORD, arr:PTR DWORD
;
;
; Conveniently, we call the procedure with stack parameters, using INVOKE:
;		
;		INVOKE myProc, <param1>, <param2>
; Like:
;		INVOKE myProc, EAX, ADDR myList
;
; * ADDR passes a pointer when used with INVOKE
; * OFFSET works similar to ADDR, but fails with Local variables. OFFSET works with global static variables only
; 
; Like in C++, to call a proceure before defining it, we need a prototype.
; It is simply the procedure name followed by PROTO directive
;	
;		<procName> PROTO, <param1>, <param2>...
;		
;
; Recall how we have been using MOV to copy data? When we INVOKE without using ADDR,
; we are always passing by value. Manipulating values of local variable will not be reflecte
; in actual ata itself.
; However, using ADDR and PTR combination, we pass by reference, where changing the value mutates
; the original data itself.



END