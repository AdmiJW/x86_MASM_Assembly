;================================================================================================================
;	Based on The Book "Kip R. Irvine - Assembly Language for Intel-based Computers-Prentice Hall"
;	For references of Irvine32 library, visit http://csc.csudh.edu/mmccullough/asm/help
;	For setting up in Visual Studio, watch https://www.youtube.com/watch?v=2fyoYNFO9XM&ab_channel=Dr.NinaJavaher
;	Apart from above setup, you also need to include the Irvine32 library.
;=================================================================================================================

;================================================================================================================
;	To include external assembly files, you have to:
;		1.	Ensure no collision occur in including assembly files
;		2.	Have a inc file which declares the procedure prototype
;		3.	Include the inc inside this main assembly source file
;================================================================================================================




TITLE Main Program

INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDE exercise_chap4.inc

;To include external assembly, you must include the inc file

.data
	;Data...
.data?
	;Uninitialized Data...

.code
main PROC
	;Codes...

	CALL exercise4_8
	
	exit
main ENDP
END main






