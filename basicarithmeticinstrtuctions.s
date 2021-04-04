
        PRESERVE8
	      THUMB
			  
		  AREA    RESET, DATA, READONLY
		  EXPORT   __Vectors
			  
__Vectors
          DCD 0x20001000
			  
		  DCD Reset_Handler
			  
		  ALIGN
			  
			  
		  AREA    MYCODE, CODE, READONLY
			  
		  ENTRY
		  EXPORT Reset_Handler
			  
Value1    ;DCW 0x4EFF
          DCD 0xA24E8476
          ALIGN
			  
Value2    ;DCW 0xA8BC
          DCD 0x1E9B3A09
          ALIGN
			  
Result    DCD 0
    
	
Reset_Handler
          	  LDR R0, Value1
			  LDR R1, Value2
			  
STOP
              ADD R2, R0, R1
			  LDR R3, =Result
			  STR R2, [R3]
			  SUB R3, R1, R0
			  SBC R4, R1, R0
			  RSB R5, R1, R0
			  MUL R6, R1, R0
			  MLA R7, R1, R0, R2
			  MOV R8, R0, ASR#1
			  SMLAL R9, R10, R0, R1
			  SMULL R9, R10, R0, R1
			  UMLAL R9, R10, R0, R1
			  UMULL R9, R10, R0, R1
			  CMP R0, R1
			  ADDNE R11, R0, R1
			  SUBNE R12, R1, R0
			  
			  MOV32 R0, #0x08000060
			  STMIA R0!, {R1-R12}
			  
			  B   STOP
			 
			  
			  END
		  