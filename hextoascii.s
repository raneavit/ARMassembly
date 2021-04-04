;following program takes 2 hex digits and gives ASCII values of each digit in hex
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

entry
      mov r0,#&1e ; hex input
      mov r1,r0
      and r2,r1,#&0f ; taking lower nibble
      bl next
      mov r3,r2
      and r2,r0,#&f0  ;taking upper nibble
      mov r2,r2,lsr#04 ;lef shift
      bl next
      b stop
next  cmp r2,#09
      addcs r2,r2,#&37 ; to find hex
      addcc r2,r2,#&30
      mov pc,lr
	  
stop  
      LDR r5, =result
	  STMIA r5!, {r2-r3}
	

	    AREA  BlockData, DATA, READWRITE
result  DCD 0
	 	END
		
		