		.DATA
	A:.WORD 0,1,0,0,0,0,0,0,0,0
	
		.TEXT
	LDR R2,=A
	MOV R0,#0
	MOV R1,#1
	ADD R2,R2,#8
	MOV R4,#1

LOOP:
	ADD R3,R0,R1
	MOV R0,R1
	MOV R1,R3
	STR R3,[R2],#4 /*Post increment*/
	ADD R4,R4,#1
	CMP R4,#9
	BNE LOOP
	SWI 0X11