; following code solves equations N= (D2+EC-RT), Y= (38A-56B)(43D+51E)/23F
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
		
    ENTRY
    EXPORT Reset_Handler
				  
Reset_Handler
start
     MOV r0, pc
     ADD r0, r0, #0x60
     LDR r1, =vn
	 
calculation
        LDMIA r0!, {r2-r9}
        MUL r10, r2, r2
		MUL r11, r3, r4
		ADD r10, r10, r11
		MUL r11, r5, r6
		SUB r10, r10, r11
		STR r10, [r1], #4
		
		MOV r12, #38
		MUL r10, r7, r12 ;cannot use immediate data in multiply instruction
        MOV r12, #56
        MUL r11, r8, r12
        SUB r10, r10, r11
		MOV r12, #43
		MUL r4, r2, r12
		MOV r12, #51
		MUL r5, r3, r12
		ADD r4, r4, r5
		MUL r10, r4, r10
		MOV r12, #23
		MUL r11, r9, r12
		UDIV r10, r10, r11
		STR r10, [r1], #4
        				

STOP
	 MOV R10, R1
	 
	 AREA  BlockData, DATA, READWRITE
vd     DCD 0x7caa
ve     DCD 0x9d10 
vc     DCD 0x1a7f
vr     DCD 0x20a5
vt     DCD 0x2728
va     DCD 0x6641
vb     DCD 0x791e 
vf     DCD 0x18be
vn     DCD 0
vy     DCD 0 
	 	END