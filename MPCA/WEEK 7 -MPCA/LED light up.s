;  Set LED to light up
		.Text
	mov r0, #1
loop:
	swi 0x201  
	Ldr r4,=A
	Ldr r4,[r4]
delay: 
	sub r4, r4,#1
	cmp r4, #0
	bne delay
	add r0, r0, #1
	cmp r0, #3
	ble loop
	swi 0x011
	
		.Data
A:.word 84000



