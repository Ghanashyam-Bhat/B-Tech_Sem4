.DATA
A:.BYTE 10,20,30,40,50
SUM:.BYTE 0

.TEXT
LDR R1,=A
LDR R2,=SUM

MOV R4,#0
MOV R5,#1

L1:
LDRB R3,[R1]
ADD R4,R4,R3

ADD R1,R1,#1
ADD R5,R5,#1

CMP R5,#6
BNE L1
STRB R4,[R2]
SWI 0X011