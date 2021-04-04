;; Directives
	PRESERVE8
	THUMB
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x20001000
	DCD Reset_Handler ; reset vector
	ALIGN
		AREA MYCODE, CODE, READONLY
num     EQU   10                    ; set number of words			
    ENTRY
    EXPORT Reset_Handler
				  
Reset_Handler

start
    MOV r0, pc
	ADD r0, #0x4c
	MOV r1, #num
	MOV r5, r0 ;copy of first address which we can reuse

loop1
    ldr r2,[r0] ;; loads value from array to r2
    add r0, r0, #4 ;; adding 4 shifts memory location by 4 BYTES which brings us to next memory location.
	cmp r1,#0 ;; comparison: subtracts zero from r1(checking to see if zero bit gets set)
	BEQ start2
	sub r1, r1, #1
	cmp r3, r2 ;; checking if r2 is less than r3(max)
	BHI loop1
	MOV r3, r2
	b loop1 ;; restart loop
  
start2
    LDR r4, =nmax
    STR r3, [r4]
	MOV r0, r5
	LDR r3, [r0]
	MOV r1, #num
	
loop2
    ldr r2,[r0] ;; loads value from array to r2
    add r0, r0, #4 ;; adding 4 shifts memory location by 4 BYTES which brings us to next memory location.
	cmp r1,#0 ;; comparison: subtracts zero from r1(checking to see if zero bit gets set)
	BEQ STOP
	sub r1, r1, #1
	cmp r2, r3 ;; checking if r3 is less than r2(min)
	BHI loop2
	MOV r3, r2
	b loop2 ;; restart loop

STOP
	LDR r4, =nmin
	STR r3, [r4]
	 
END
	 AREA  BlockData, DATA, READWRITE
n1     DCD 0x43a846de
n2     DCD 0x27e1af67
n3     DCD 0xfabafed7
n4     DCD 0x4e81ca80
n5     DCD 0xff9a94af
n6     DCD 0xd6fa6707
n7     DCD 0x64d19127
n8     DCD 0x2c52846e
n9     DCD 0x7b62f52b
n10    DCD 0x00000003 
nmax   DCD 0
nmin   DCD 0
	 	END