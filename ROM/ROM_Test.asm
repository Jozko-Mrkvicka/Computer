;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This is an example code of new assembly syntax.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.CONST
	UINT8		CONST0	255
	UINT16		CONST1	768						; Some constant of UINT16 type.
	STR			BEEF	"DEADBEEF"				; Some string constant.
	UINT8		CONST2	12
	INT16[4]	CONST3	0xF26F, 22, 58, -17
	STR			CONST1 	"123456789ABCDEF"


.DATA											; Addresses will be assigned to specified variables.
	UINT16		VAR1							; Variables can`t be initialized in the .DATA section, only in .TEXT.
	STR			VAR2
	UINT16[5]	VAR3
	STR			VAR4
	UINT8		VAR
	UINT8		INDEX


.TEXT
	START:
		LOADI	r2		VAR1
		LOADI	r1		VAR5
		STOREI	VAR3[4]	r2
		LOADI	r3		BEEF[INDEX]
		CALL	FUNC

	LABEL:
		JMP		LABEL

	FUNC:
		PUSH	r1
		PUSH	r2
		PUSH	r3
		MOV		r2		r1
		MOV		r1		r3
		POP		r3
		POP		r2
		POP		r1
		RET


; (done)
; Source text is parsed to sections (".CONST", ".DATA", ".TEXT").
;
; (done)
; Every section is parsed into lines.
;
; Rozdelit sekcie na riadky
; 	- Kazdy riadok v sekcii .CONST:
;  		- zacina datatypom
;   	- dalej nasleduje identifikator
;   	- konstanta alebo text string
; 		- CHECK - .CONST nesmie obsahovat instrukcie
; 
; Check the .DATA section.
; 	- Check: Every line in the .DATA section contains exactly two words (datatype and identifier). (done)
;  	- Check: A datatype is always at first position.
;   - Check: If datatype is an array (it contains square brackets) then there must be both (opening and closing) brackets.
; 	- Check: The .DATA section must not contain any instructions.
;	- Check: Sum of all variables fits into the RAM (sum <= RAM - STACK_SIZE).
;   - Identifier is stored to the identifier list.
;
; 	- Kazdy riadok v sekcii .TEXT:
;		- zacina s instrukciou
;		- dalej treba parsovat podla formatu instrukcie
;
; Check - If .CONST exists then all constants fit into the constant data ROM.
; Check - Datatype range.
; Check - Index range in an array.
; Check - Usage of uninitialized variable.
; Check - ROM can`t be written.
; Check - Constant and variable name can be declared only once.
; Check - Only defined symbols:
;         - Register.
;         - Instruction.
;         - Constants.
; Check - Matching quotes.

; Memory manipulation and alignment:
; - INT16/UINT16
;   - Always aligned.
;   - Can be manipulated with LOAD/STORE/LOADI/STOREI.
;   - 
;
; - INT8/UINT8:
;   - Variable name must contain also information about position of the variable in a memory word.
;   - Based on position correct LOADL/LOADU/STOREL/STOREU (+ new LOADIL/LOADIU/STOREIL/STOREIU) instruction 
;     will be automatically selected by assembler. Number of GP registers must be decreased to 8.

