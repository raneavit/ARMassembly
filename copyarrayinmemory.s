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
				  
Reset_Handler
start
        MOV r0 , pc		; r0 = pointer to source block
		ADD r0, r0, #28
        LDR   r1, =dst              ; r1 = pointer to destination block
        MOV   r2, #num              ; r2 = number of words to copy
wordcopy
        LDR   r3 , [r0], #4          ; load a word from the source and
        STR   r3, [r1] , #4        ; store it to the destination
        SUBS  r2, r2, #1            ; decrement the counter
        BNE   wordcopy              ; ... copy more
STOP
	 MOV R10, R0
	 MOV R11, R1
	 

	 AREA  BlockData, DATA, READWRITE ; declaring data in datablock
src     DCW   1,2,3,4,5,6,7,8,1,2
dst     DCW   0,0,0,0,0,0,0,0,0,0
	 	END