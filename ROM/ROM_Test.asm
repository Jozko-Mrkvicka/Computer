;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This is an example code of new assembly syntax.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.CONST
	UINT8		CONST0[11b]		255 0xFF 100110b
	UINT16		CONST1			0xFBBA				; Some constant of UINT16 type.
	STR			CONST2			"DEADBEEF"			; Some string constant.
	INT8		CONST3[0x04]	12, 15, 20, 4
	INT16		CONST4[4]		0x026F, 22, -58, 17
	STR			CONST5 			"12345"


.DATA											; Addresses will be assigned to specified variables.
	UINT8		INDEX							; Variables can`t be initialized in the .DATA section, only in .TEXT.
	UINT8		VAR2[5]
	STR			VAR3[4]
	STR			VAR4
	UINT8		VAR5[0x07]
	UINT16		VAR6[10b]


.TEXT
	START:
		; Instruction format 3
		NOT			r1
		XOR			r0			r7
		OR			r0			r7
		AND			r0			r7
		LOADL		r0			r7				;
LABEL:	LOADU		r0			r7				;
		CMP			r0			r7
		RET
		POP			r2
		PUSH		r2
		SHIFT		r0			r7
		ADD			r0			r7
		;NOT_USED
		STOREL		r0			r7
		STOREU		r0			r7
		STORE		r0			r7
		LOAD		r0			r7				; 
		MOV			r0			r7

		; Instruction format 2
		ADDI		r0			-128			; Immediate value only.
		MOVU		r0			127				; Immediate value only.
		LOADI		r0			255				; Load a value from an absolute memory address.
		LOADI		r0			VAR2			; Load a value from the memory at address VAR2.
		MOVL		r0			-128			; Immediate value only.

		; Instruction format 1
		SHIFTI		r0			-15
		;NOT_USED
		STOREI		255			r0
		STOREI		VAR2		r0
		CMPI		r0			-128

		; Instruction format 0
FUNC:	JLT			LABEL
		JPE			FUNC
		CALL		START
		JMP			FUNC


