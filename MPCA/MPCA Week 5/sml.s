		.DATA
	A:.WORD 20,10,15,25,30
	SMALL:.WORD 0

		.TEXT
	LDR R0,=A
	LDR R1,=SMALL
	LDR R2,[R0]
	MOV R4,#4

LOOP:	LDR R3,[R0],#4
	CMP R2,R3
	MOVGE R2,R3
	SUB R4,R4,#1
	CMP R4,#0
	BNE LOOP
	STR R2,[R1]
	SWI 0X11