/*Store Halfword*/
.DATA 
A:.HWORD 10,20,30,40,50
B:.HWORD 0,0,0,0,0

.TEXT   
LDR R1,=A 
LDR R2,=B

MOV R5,#1 

L1:
LDRH R3,[R1] 
STRH R3,[R2] 

ADD R1,R1,#2
ADD R2,R2,#2
ADD R5,R5,#1 

CMP R5,#6 
BNE L1

SWI 0X011