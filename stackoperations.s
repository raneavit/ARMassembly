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
num     EQU   5                    ; set number of words to be copied			
    ENTRY
    EXPORT Reset_Handler

stack_base DCD 0x04000000
Reset_Handler
;MAP 0x02000000, 0x04000000 READ WRITE EXEC 
;use above command in simulation console to enable memory read and write

start
        LDR r0, stack_base
		MOV r13, r0
        MOV32 r0 , #0x2da39c11
		MOV32 r1 , #0x19c1ceb7
		MOV32 r2 , #0x3fe7e83d
		MOV32 r3 , #0xb2349a9e
		MOV32 r4 , #0xc8340046
		MOV32 r5 , #0x2523f33d
		MOV32 r6 , #0x3b2725a2
		MOV32 r7 , #0x910b5fbd
		MOV32 r8 , #0x04e87eef
		MOV32 r9 , #0x3d013511
		MOV r12, #num
		
store
		STMFD sp!, {r0-r9} ;;store from register to stack
		POP {r10, r11}
		AND r10, r10, r11
		LSL r11, r11, #8
		PUSH {r10}
		PUSH {r11}
		ADD sp, sp, #8 ;;move to different location in stack
		POP {r10, r11}
		ORR r10, r10, r11
        EOR r11, r10, r11	
        PUSH {r10}
		PUSH {r11}
        SUB sp, sp, #8		
		LDMIA r13!, {r0-r7}
		SUB r12, r12, #1
		BNE store
		
		
		
	 
