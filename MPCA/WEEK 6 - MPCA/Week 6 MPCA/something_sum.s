		.DATA
	A:.WORD 6666
	
		.TEXT
	LDR R0,=A
	LDR R0,[R0]
	MOV R1,#0
	MOV R2,#0
	
LOOP:
	CMP R0,#0
	BEQ FINISH
	ADD R3,R2,R0,LSR #4
	ADD R3,R2,R3,LSL #4
	SUB R4,R0,R3 
	SUBS R5,R4,#10
	BMI MODULUS
	ADD R1,R1,R5
	ADD R0,R2,R0,LSR #4
	ADD R0,R0,#1
	B LOOP
	
MODULUS:
	ADD R1,R1,R4
	ADD R0,R2,R0,LSR #4
	B LOOP
	
FINISH:

		.END