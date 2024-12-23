	AREA DATA2 , DATA, READWRITE 
SAVEDVALUE DCD 0
	; LDR R0, =SAVEDVALUE
	;LDR R1, [R0]
	; ADD R1,R1,#1
	; STR R1, [R0]	
	
	AREA MYDATA, DATA, READONLY


INITIAL_TIME EQU 26640 ;

BIT_MASK EQU 0x333333
B_BIT_MASK EQU 0x8888888

;RCC_BASE EQU 0x40021000
;RCC_APB2ENR EQU RCC_BASE + 0x18 ;this register is responsible for enabling certain ports, by making the clock affect the target port.
;
;GPIOA_BASE EQU 0x40010800	;Base of port E
;;this is where you write your data as an output into the port
;GPIOA_ODR	EQU GPIOA_BASE+0x0C   	;output register of port E, PE0 - PE15
;GPIOA_CRL	EQU GPIOA_BASE+0x00		;this is where you configure the port's direction as output
;GPIOA_CRH   EQU GPIOA_BASE+0x04	

;--------------- Base Addresses -----------;
RCC_BASE 	EQU 0X40021000 
GPIOA_BASE  EQU 0X40010800
GPIOB_BASE  EQU 0X40010C00
GPIOC_BASE  EQU 0X40011000
PWR_BASE 	EQU 0x40007000
RTC_BASE	EQU 0x40002800
AFIO_BASE   EQU 0x40010000
EXTI_BASE   EQU 0x40010400
NVIC_ISER0  EQU 0xE000E100
NVIC_ISER1	EQU 0xE000E104
ADC1_BASE	EQU 0x40012400
TIM2_BASE   EQU 0x40000000      ; Base address for TIM2
	
;--------------- Port Enabler -----------;
RCC_APB2ENR EQU RCC_BASE + 0X18
RCC_APB1ENR EQU RCC_BASE + 0x1C
RCC_BDCR	EQU RCC_BASE + 0x20
RCC_CSR		EQU RCC_BASE + 0x24

;--------------- Power control -----------;
PWR_CR		EQU PWR_BASE + 0x000

;--------------- GPIO Pin Config -----------;
GPIOA_CRL   EQU GPIOA_BASE + 0X00
GPIOB_CRL   EQU GPIOB_BASE + 0X00
GPIOC_CRL   EQU GPIOC_BASE + 0X00

GPIOA_CRH   EQU GPIOA_BASE + 0X04
GPIOB_CRH   EQU GPIOB_BASE + 0X04
GPIOC_CRH   EQU GPIOC_BASE + 0X04
	
GPIOA_IDR   EQU GPIOA_BASE + 0X08
GPIOB_IDR   EQU GPIOB_BASE + 0X08
GPIOC_IDR   EQU GPIOC_BASE + 0X08

GPIOA_ODR   EQU GPIOA_BASE + 0X0C
GPIOB_ODR   EQU GPIOB_BASE + 0X0C
GPIOC_ODR   EQU GPIOC_BASE + 0X0C

;---------------RTC Pin Config -----------;
RTC_CRL		EQU RTC_BASE + 0x04
RTC_CRH		EQU RTC_BASE + 0x00
RTC_PRLL	EQU RTC_BASE + 0x0C
RTC_CNTH	EQU RTC_BASE + 0x18
RTC_CNTL    EQU RTC_BASE + 0x1C
RTC_ALRH	EQU RTC_BASE + 0x20
RTC_ALRL 	EQU RTC_BASE + 0x24
RTC_PRLH	EQU RTC_BASE + 0x08
;---------------EXTI Pin Config -----------;
AFIO_EXTICR4 EQU AFIO_BASE + 0x14
EXTI_IMR     EQU EXTI_BASE + 0x00
EXTI_RTSR    EQU EXTI_BASE + 0x08
EXTI_FTSR	 EQU EXTI_BASE + 0x0C
EXTI_PR      EQU EXTI_BASE + 0x14
	
ADC_SR		EQU ADC1_BASE + 0x00
ADC1_SMPR2	EQU ADC1_BASE + 0x10
ADC_SQR3	EQU ADC1_BASE + 0x34
ADC1_CR1	EQU ADC1_BASE + 0x04
ADC1_CR2	EQU ADC1_BASE + 0x08
TIM2_CR1        EQU TIM2_BASE + 0x00 ; Control Register 1
TIM2_PSC        EQU TIM2_BASE + 0x28 ; Prescaler
TIM2_ARR        EQU TIM2_BASE + 0x2C ; Auto-Reload Register
TIM2_DIER       EQU TIM2_BASE + 0x0C ; DMA/Interrupt Enable Register
TIM2_SR         EQU TIM2_BASE + 0x10 ; Status Register

;GPIOC_BASE EQU 0x40020800
;GPIOC_PUPDR EQU GPIOC_BASE + 0x0C
;GPIOC_IDR EQU GPIOC_BASE + 0x10

RST_PIN EQU 8
CS_PIN EQU 9
RS_PIN EQU 10
WR_PIN EQU 11
RD_PIN EQU 12


;AFIO_BASE		EQU		0x40010000   ;in TA's code but we dont know why
AFIO_MAPR	EQU		AFIO_BASE + 0x04   ;in TA's code but we dont know why

INTERVAL EQU 0x186004		;just a number to perform the delay. this number takes roughly 1 second to decrement until it reaches 0


;the following are pins connected from the TFT to our EasyMX board
;RD = PE10		Read pin	--> to read from touch screen input 
;WR = PE11		Write pin	--> to write data/command to display
;RS = PE12		Command pin	--> to choose command or data to write
;CS = PE15		Chip Select	--> to enable the TFT, lol	(active low)
;RST= PE8		Reset		--> to reset the TFT (active low)
;D0-7 = PE0-7	Data BUS	--> Put your command or data on this bus


;just some color codes, 16-bit colors coded in RGB 565
BLACK	EQU   	0x0000
BLUE 	EQU  	0x001F
RED  	EQU  	0xF800
RED2   	EQU 	0x4000
GREEN 	EQU  	0x07E0
CYAN  	EQU  	0x07FF
MAGENTA EQU 	0xF81F
YELLOW	EQU  	0xFFE0
WHITE 	EQU  	0xFF1F
GREEN2 	EQU 	0x2FA4
CYAN2 	EQU  	0x07FF

	
	AREA	MYCODE, CODE, READONLY
		
	EXPORT __main
ENTRY
	
__main FUNCTION

	;This is the main funcion, you should only call two functions, one that sets up the TFT
	;And the other that draws a rectangle over the entire screen (ie from (0,0) to (320,240)) with a certain color of your choice

;=>>drawing the background theme :
	;CALL FUNCTION SETUP
	BL SETUP
	BL GPIO_ENABLE_PORT_B
	
	
	
	bl RTC_INIT
	;BL DRAW_BIMO
	 
;PUSH {R0-R1}
;LDR R0, =GPIOB_IDR
;LDR R1, [R0]
;MOV R9, R1      ; Save the initial value of GPIOB_IDR to R9
;POP {R0-R1}
; INSIDE SUPERLOOP
;superloop:
;    PUSH {R0-R2}            ; Save registers to avoid clobbering
;    LDR R0, =GPIOB_IDR
;    LDR R1, [R0]            ; Load current GPIOB_IDR value
;    CMP R1, R9              ; Compare with saved value in R9
;    BEQ CONTINUE_LOOP       ; If unchanged, continue loop
;    B VALUE_CHANGED         ; If changed, branch to handle it
;
;CONTINUE_LOOP:
;    POP {R0-R2}
;    ; Perform other operations
;    B superloop
;
;VALUE_CHANGED:
;    POP {R0-R2}
;    ; Add handling for value change (e.g., log, alert, reset)
;    B superloop


VALUE_CHANGED
	PUSH {R0-R2}
	LDR R0, =GPIOB_IDR
	LDR R1,[R0]
	AND R1, R1 , #(1<<1)
	MOV R5, R1
	CMP R1, #0
	
	BNE TWO2
	POP{R0-R2}
	
	;MOV R8, #30
	BL THEME1_BACKGROUND
	B DONE2
	
TWO2
	;MOV R8, #20
	BL THEME2_BACKGROUND
	
DONE2
   
   MOV R9,#0
  

superloop
	;BL delay_1_second
	; ANA ANA ANA
	
	PUSH {R0-R2}
	LDR R0, =GPIOB_IDR
	LDR R1,[R0]
	AND R1, R1 , #(1<<14)
	CMP R1,#0
	BEQ STOPWATCH
	BL TIM2_INIT
STOPWATCH
	POP{R0-R2}
	
	PUSH {R0-R2}
	LDR R0, =GPIOB_IDR
	LDR R1,[R0]
	AND R1, R1 , #(1<<1)
	
	
	CMP R1, R5
	BEQ CONTINUE_LOOP
	BNE VALUE_CHANGED 
CONTINUE_LOOP
	CMP R1, #0
	BNE TWO
	POP{R0-R2} 
	BL THEME1_TEXTILE
    ;MOV R8,# 20
	B DONE
TWO
	
	BL THEME2_TEXTILE
	;MOV R8 , #30
	
DONE
	;BL DRAW_DET
	;CMP R6,R5

	;BEQ CHECK
	;MOV R6,R5
	
    B superloop
	
	

	
	
;	ldr r10, =GREEN
;	mov r0, #150
;	mov r1, #100
;	mov r3, #170
;	mov r4, #140
;	
;	bl DRAW_RECTANGLE_FILLED
	
	

	;BL LCD_INIT
	;FINAL TODO: DRAW THE ENTIRE SCREEN WITH A CERTAIN COLOR


	


	ENDFUNC




; BLACKOUT





;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ FUNCTIONS' DEFINITIONS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

DRAW_DET1 FUNCTION
	PUSH {R0-R12,LR}
	MOV R8,#7
	BL TIME_POSITION   ;TERSM D
	LDR R10, = BLACK
	MOV R8, #10
	BL DRAWSEC_BCD
	
	MOV R8,#8
	BL TIME_POSITION
	LDR R10, = BLACK    ;TERSEM E
	MOV R8, #11
	BL DRAWSEC_BCD
	
	MOV R8,#9
	BL TIME_POSITION
	LDR R10, = BLACK     ;TERSEM T
	MOV R8, #12
	BL DRAWSEC_BCD
	
	LDR R10, = BLACK
	BL DRAW_DOT  	;TERSEM EL :
	
	;MOV R8,#11
	;BL TIME_POSITION
	;LDR R10, = BLACK
	;MOV R8, #14          ;TERSEM EL F KA DEFUALT
	;BL DRAWSEC_BCD
	
	LDR R0, =GPIOA_IDR
	LDR R1, [R0]                 ;DA 3ASHAN LOW ANA 3AYZA EL PIN 3ALA HIGH
	AND R1,R1,#(1<<15)
	CMP R1,#0
	BEQ F_DEFUALT
	
	MOV R8,#11
	BL TIME_POSITION
	LDR R10, = BLACK
	MOV R8, #12 
	BL DRAWSEC_BCD
	;STR R1, [R0]            ; KANET 3AMLA AZMA ALLAH W A3LAM EH HEYA
	B TARGET
	
F_DEFUALT
	MOV R8,#11
	BL TIME_POSITION
	LDR R10, = BLACK
	MOV R8, #14          ;TERSEM EL F KA DEFUALT
	BL DRAWSEC_BCD
	
TARGET 
	POP {R0-R12,PC}
	ENDFUNC

	

DRAW_DET2 FUNCTION
	PUSH {R0-R12,LR}
	MOV R8,#7
	BL TIME_POSITION   ;TERSM D
	LDR R10, = BLUE
	MOV R8, #10
	BL DRAWSEC_BCD
	
	MOV R8,#8
	BL TIME_POSITION
	LDR R10, = BLUE    ;TERSEM E
	MOV R8, #11
	BL DRAWSEC_BCD
	
	MOV R8,#9
	BL TIME_POSITION
	LDR R10, = BLUE      ;TERSEM T
	MOV R8, #12
	BL DRAWSEC_BCD
	
	LDR R10, = BLUE
	BL DRAW_DOT  	;TERSEM EL :
	
	;MOV R8,#11
	;BL TIME_POSITION
	;LDR R10, = BLACK
	;MOV R8, #14          ;TERSEM EL F KA DEFUALT
	;BL DRAWSEC_BCD
	
	LDR R0, =GPIOA_IDR
	LDR R1, [R0]                 ;DA 3ASHAN LOW ANA 3AYZA EL PIN 3ALA HIGH
	AND R1,R1,#(1<<15)
	CMP R1,#0
	BEQ F_DEFUALT2
	
	MOV R8,#11
	BL TIME_POSITION
	LDR R10, = BLUE
	MOV R8, #12 
	BL DRAWSEC_BCD
	;STR R1, [R0]            ; KANET 3AMLA AZMA ALLAH W A3LAM EH HEYA
	B TARGET2
	
F_DEFUALT2
	MOV R8,#11
	BL TIME_POSITION
	LDR R10, = BLUE
	MOV R8, #14          ;TERSEM EL F KA DEFUALT
	BL DRAWSEC_BCD
	
TARGET2 
	POP {R0-R12,PC}
	ENDFUNC

;#####################################################################################################################################################################
LCD_WRITE FUNCTION
	;this function takes what is inside r2 and writes it to the tft
	;this function writes 8 bits only
	;later we will choose whether those 8 bits are considered a command, or just pure data
	;your job is to just write 8-bits (regardless if data or command) to PE0-7 and set WR appropriately
	;arguments: R2 = data to be written to the D0-7 bus

	;TODO: PUSH THE NEEDED REGISTERS TO SAVE THEIR CONTENTS. HINT: Push any register you will modify inside the function, and LR 
	PUSH{R0-R2, LR}
	

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING WR to 0 ;;;;;;;;;;;;;;;;;;;;;
	;TODO: RESET WR TO 0
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	BIC R1, R1,#(1<<WR_PIN)
	STR R1,[R0]
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LDR R0, =GPIOA_ODR         ; Load address of GPIOA_ODR
	LDR R1, [R0]               ; Load current value of GPIOA_ODR
	BIC R1, R1, #0xFF          ; Clear bits 0-7
	ORR R1, R1, R2             ; Set the lower 8 bits of R2
	STR R1, [R0]               ; Store the new value back to GPIOA_ODR



	;;;;;;;;;;;;; HERE YOU PUT YOUR DATA which is in R2 TO PE0-7 ;;;;;;;;;;;;;;;;;
	;TODO: SET PE0-7 WITH THE LOWER 8-bits of R2
	;only write the lower byte to PE0-7

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING WR to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET WR TO 1 AGAIN (ie make a rising edge)
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<WR_PIN)
	STR R1, [R0]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	POP{R0-R2, PC}
	;TODO: POP THE REGISTERS YOU JUST PUSHED, and PC
	ENDFUNC
	
;#####################################################################################################################################################################


;BLACKOUT








;#####################################################################################################################################################################
LCD_COMMAND_WRITE FUNCTION
	;this function writes a command to the TFT, the command is read from R2
	;it writes LOW to RS first to specify that we are writing a command not data.
	;then it normally calls the function LCD_WRITE we just defined above
	;arguments: R2 = data to be written on D0-7 bus

	;TODO: PUSH ANY NEEDED REGISTERS
	PUSH{R0-R1, LR}

	

	;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING RD to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RD HIGH (we won't need reading anyways, but we must keep read pin to high, which means we will not read anything)
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<RD_PIN)
	STR R1, [R0]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	;;;;;;;;;;;;;;;;;;;;;;;;; SETTING RS to 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RS TO 0 (to specify that we are writing commands not data on the D0-7 bus)
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	BIC R1, R1,#(1<<RS_PIN)
	;AND R1, R1,R3
	STR R1,[R0]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;TODO: CALL FUNCTION LCD_WRITE
	BL LCD_WRITE


	;TODO: POP ALL REGISTERS YOU PUSHED
	POP{R0-R1, PC}
	ENDFUNC

;#####################################################################################################################################################################






;#####################################################################################################################################################################
LCD_DATA_WRITE FUNCTION
	;this function writes Data to the TFT, the data is read from R2
	;it writes HIGH to RS first to specify that we are writing actual data not a command.
	;arguments: R2 = data

	;TODO: PUSH ANY NEEDED REGISTERS
	
	
	PUSH{R0-R1, LR}


	;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING RD to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RD HIGH (we won't need reading anyways, but we must keep read pin to high, which means we will not read anything)
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<RD_PIN)
	STR R1, [R0]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	



	;;;;;;;;;;;;;;;;;;;; SETTING RS to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RS TO 1 (to specify that we are sending actual data not a command on the D0-7 bus)
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<RS_PIN)
	STR R1, [R0]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	;TODO: CALL FUNCTION LCD_WRITE
	BL LCD_WRITE


	;TODO: POP ANY REGISTER YOU PUSHED
	POP{R0-R1, PC}
	ENDFUNC

;#####################################################################################################################################################################




; REVISE WITH YOUR TA THE LAST 3 FUNCTIONS (LCD_WRITE, LCD_COMMAND_WRITE AND LCD_DATA_WRITE BEFORE PROCEEDING)




;#####################################################################################################################################################################
LCD_INIT FUNCTION
	;This function executes the minimum needed LCD initialization measures
	;Only the necessary Commands are covered
	;Eventho there are so many more in the DataSheet

	;TODO: PUSH ANY NEEDED REGISTERS
	PUSH{R0-R12, LR}


	;;;;;;;;;;;;;;;;; HARDWARE RESET (putting RST to high then low then high again) ;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RESET PIN TO HIGH
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<RST_PIN)
	STR R1, [R0]


	;TODO: DELAY FOR SOME TIME (USE ANY FUNCTION AT THE BOTTOM OF THIS FILE)
	BL delay_half_second
	
	;TODO: RESET RESET PIN TO LOW
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	BIC R1, R1,#(1<<RST_PIN)
	STR R1,[R0]

	;TODO: DELAY FOR SOME TIME (USE ANY FUNCTION AT THE BOTTOM OF THIS FILE)
	BL delay_half_second

	;TODO: SET RESET PIN TO HIGH AGAIN
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<RST_PIN)
	STR R1, [R0]

	;TODO: DELAY FOR SOME TIME (USE ANY FUNCTION AT THE BOTTOM OF THIS FILE)
	BL delay_half_second
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






	;;;;;;;;;;;;;;;;; PREPARATION FOR WRITE CYCLE SEQUENCE (setting CS to high, then configuring WR and RD, then resetting CS to low) ;;;;;;;;;;;;;;;;;;
	;TODO: SET CS PIN HIGH
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<CS_PIN)
	STR R1, [R0]

	;TODO: SET WR PIN HIGH
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<WR_PIN)
	STR R1, [R0]

	;TODO: SET RD PIN HIGH
	
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1,R1,#(1<<RD_PIN)
	STR R1, [R0]
	;TODO: SET CS PIN LOW
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	BIC R1, R1,#(1<<CS_PIN)
	STR R1,[R0]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	




	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SOFTWARE INITIALIZATION SEQUENCE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV R2, #0x01 ; Software Reset
	BL LCD_COMMAND_WRITE
	BL delay_1_second

	MOV R2, #0x28 ; Display OFF
	BL LCD_COMMAND_WRITE
	
	
	;ISSUE THE "SET CONTRAST" COMMAND, ITS HEX CODE IS 0xC5
	MOV R2, #0xC5 ;1100 0101
	BL LCD_COMMAND_WRITE

	;THIS COMMAND REQUIRES 2 PARAMETERS TO BE SENT AS DATA, THE VCOM H, AND THE VCOM L
	;WE WANT TO SET VCOM H TO A SPECIFIC VOLTAGE WITH CORRESPONDS TO A BINARY CODE OF 1111111 OR 0x7F HEXA
	;SEND THE FIRST PARAMETER (THE VCOM H) NEEDED BY THE COMMAND, WITH HEX 0x7F, PARAMETERS ARE SENT AS DATA BUT COMMANDS ARE SENT AS COMMANDS
	MOV R2, #0x7F ;0111 1111 0x7F
	BL LCD_DATA_WRITE

	;WE WANT TO SET VCOM L TO A SPECIFIC VOLTAGE WITH CORRESPONDS TO A BINARY CODE OF 00000000 OR 0x00 HEXA
	;SEND THE SECOND PARAMETER (THE VCOM L) NEEDED BY THE CONTRAST COMMAND, WITH HEX 0x00, PARAMETERS ARE SENT AS DATA BUT COMMANDS ARE SENT AS COMMANDS
	MOV R2, #0x00 ;00000
	BL LCD_DATA_WRITE


	;MEMORY ACCESS CONTROL AKA MADCLT | DATASHEET PAGE 127
	;WE WANT TO SET MX (to draw from left to right) AND SET MV (to configure the TFT to be in horizontal landscape mode, not a vertical screen)
	;TODO: ISSUE THE COMMAND MEMORY ACCESS CONTROL, HEXCODE 0x36
	MOV R2,#0x36 ;0011 0110
	BL LCD_COMMAND_WRITE


	;TODO: SEND ONE NEEDED PARAMETER ONLY WITH MX AND MV SET TO 1. HOW WILL WE SEND PARAMETERS? AS DATA OR AS COMMAND?
	
	
	

	MOV R2,#0x68 ;0110 0000 ;60
	BL LCD_DATA_WRITE
	
	
	;COLMOD: PIXEL FORMAT SET | DATASHEET PAGE 134
	;THIS COMMAND LETS US CHOOSE WHETHER WE WANT TO USE 16-BIT COLORS OR 18-BIT COLORS.
	;WE WILL ALWAYS USE 16-BIT COLORS
	;TODO: ISSUE THE COMMAND COLMOD
	MOV R2,#0x3A ;0011 1010
	BL LCD_COMMAND_WRITE


	;TODO: SEND THE NEEDED PARAMETER WHICH CORRESPONDS TO 16-BIT RGB AND 16-BIT MCU INTERFACE FORMAT
	MOV R2,#0x55 ;0101 0101
	BL LCD_DATA_WRITE
	

	;SLEEP OUT | DATASHEET PAGE 101
	;TODO: ISSUE THE SLEEP OUT COMMAND TO EXIT SLEEP MODE (THIS COMMAND TAKES NO PARAMETERS, JUST SEND THE COMMAND)
	MOV R2,#0x11 ;0001 0001
	BL LCD_COMMAND_WRITE


	;NECESSARY TO WAIT 5ms BEFORE SENDING NEXT COMMAND
	;I WILL WAIT FOR 10MSEC TO BE SURE
	;TODO: DELAY FOR AT LEAST 10ms
	BL delay_1_second ;half


	;DISPLAY ON | DATASHEET PAGE 109
	;TODO: ISSUE THE COMMAND, IT TAKES NO PARAMETERS
	MOV R2,#0x29 ;0010 1001
	BL LCD_COMMAND_WRITE
	
	
	;COLOR INVERSION OFF | DATASHEET PAGE 105
	;NOTE: SOME TFTs HAS COLOR INVERTED BY DEFAULT, SO YOU WOULD HAVE TO INVERT THE COLOR MANUALLY SO COLORS APPEAR NATURAL
	;MEANING THAT IF THE COLORS ARE INVERTED WHILE YOU ALREADY TURNED OFF INVERSION, YOU HAVE TO TURN ON INVERSION NOT TURN IT OFF.
	;TODO: ISSUE THE COMMAND, IT TAKES NO PARAMETERS
	MOV R2,#0x20 ;0010 0001
	BL LCD_COMMAND_WRITE


	;MEMORY WRITE | DATASHEET PAGE 245
	;WE NEED TO PREPARE OUR TFT TO SEND PIXEL DATA, MEMORY WRITE SHOULD ALWAYS BE ISSUED BEFORE ANY PIXEL DATA SENT
	;TODO: ISSUE MEMORY WRITE COMMAND
	MOV R2,#0x2C ;0010 1100
	BL LCD_COMMAND_WRITE


	;TODO: POP ALL PUSHED REGISTERS
	POP{R0-R12, PC}
	ENDFUNC


;#####################################################################################################################################################################






; REVISE THE FUNCTION LCD_INIT WITH YOUR TA BEFORE PROCEEDING






;#####################################################################################################################################################################
ADDRESS_SET FUNCTION
	;THIS FUNCTION TAKES X1, X2, Y1, Y2
	;IT ISSUES COLUMN ADDRESS SET TO SPECIFY THE START AND END COLUMNS (X1 AND X2)
	;IT ISSUES PAGE ADDRESS SET TO SPECIFY THE START AND END PAGE (Y1 AND Y2)
	;THIS FUNCTION JUST MARKS THE PLAYGROUND WHERE WE WILL ACTUALLY DRAW OUR PIXELS, MAYBE TARGETTING EACH PIXEL AS IT IS.
	;R0 = X1
	;R1 = X2
	;R3 = Y1
	;R4 = Y2

	;PUSHING ANY NEEDED REGISTERS
	PUSH {R0-R5, LR}
	

	;COLUMN ADDRESS SET | DATASHEET PAGE 110
	MOV R2, #0x2A ;0010 1010
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE FIRST PARAMETER (HIGHER 8-BITS OF THE STARTING COLUMN, AKA HIGHER 8-BITS OF X1)
	mov r5, r0, lsr #8  
	mov r2, r5  
	BL LCD_DATA_WRITE  
	;TODO: SEND THE SECOND PARAMETER (LOWER 8-BITS OF THE STARTING COLUMN, AKA LOWER 8-BITS OF X1)
	mov r2, r0
	BL LCD_DATA_WRITE

	
	;TODO: SEND THE THIRD PARAMETER (HIGHER 8-BITS OF THE ENDING COLUMN, AKA HIGHER 8-BITS OF X2)
	mov r5, r1, lsr #8  
	mov r2, r5  
	BL LCD_DATA_WRITE  

	
	;TODO: SEND THE FOURTH PARAMETER (LOWER 8-BITS OF THE ENDING COLUMN, AKA LOWER 8-BITS OF X2)
	mov r2, r1
	BL LCD_DATA_WRITE

	;PAGE ADDRESS SET | DATASHEET PAGE 110
	MOV R2, #0x2B ;0010 1011
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE FIRST PARAMETER (HIGHER 8-BITS OF THE STARTING PAGE, AKA HIGHER 8-BITS OF Y1)
	mov r5, r3, lsr #8  
	mov r2, r5  
	BL LCD_DATA_WRITE  


	;TODO: SEND THE SECOND PARAMETER (LOWER 8-BITS OF THE STARTING PAGE, AKA LOWER 8-BITS OF Y1)
	mov r2, r3
	BL LCD_DATA_WRITE
	;TODO: SEND THE THIRD PARAMETER (HIGHER 8-BITS OF THE ENDING PAGE, AKA HIGHER 8-BITS OF Y2)
	mov r5, r4, lsr #8  
	mov r2, r5  
	BL LCD_DATA_WRITE

	;TODO: SEND THE FOURTH PARAMETER (LOWER 8-BITS OF THE ENDING PAGE, AKA LOWER 8-BITS OF Y2)
	mov r2, r4
	BL LCD_DATA_WRITE

	;MEMORY WRITE
	MOV R2, #0x2C ;0010 1100
	BL LCD_COMMAND_WRITE


	;POPPING ALL REGISTERS I PUSHED
	POP {R0-R5, PC}
	
	ENDFUNC
;#####################################################################################################################################################################



;#####################################################################################################################################################################
DRAWPIXEL
	PUSH {R0-R4, r10, LR}
	;THIS FUNCTION TAKES X AND Y AND A COLOR AND DRAWS THIS EXACT PIXEL
	;NOTE YOU HAVE TO CALL ADDRESS SET ON A SPECIFIC PIXEL WITH LENGTH 1 AND WIDTH 1 FROM THE STARTING COORDINATES OF THE PIXEL, THOSE STARTING COORDINATES ARE GIVEN AS PARAMETERS
	;THEN YOU SIMPLY ISSUE MEMORY WRITE COMMAND AND SEND THE COLOR
	;R0 = X
	;R1 = Y
	;R10 = COLOR

	;CHIP SELECT ACTIVE, WRITE LOW TO CS
	LDR r3, =GPIOA_ODR
	LDR r4, [r3]
	AND r4, r4, #0xFFFF7FFF
	STR r4, [r3]

	;TODO: SETTING PARAMETERS FOR FUNC 'ADDRESS_SET' CALL, THEN CALL FUNCTION ADDRESS SET
	;NOTE YOU MIGHT WANT TO PERFORM PARAMETER REORDERING, AS ADDRESS SET FUNCTION TAKES X1, X2, Y1, Y2 IN R0, R1, R3, R4 BUT THIS FUNCTION TAKES X,Y IN R0 AND R1
	


	
	;MEMORY WRITE
	MOV R2, #0x2C ;0010 1100
	BL LCD_COMMAND_WRITE


	;SEND THE COLOR DATA | DATASHEET PAGE 114
	;HINT: WE SEND THE HIGHER 8-BITS OF THE COLOR FIRST, THEN THE LOWER 8-BITS
	;HINT: WE SEND THE COLOR OF ONLY 1 PIXEL BY 2 DATA WRITES, THE FIRST TO SEND THE HIGHER 8-BITS OF THE COLOR, THE SECOND TO SEND THE LOWER 8-BITS OF THE COLOR
	;REMINDER: WE USE 16-BIT PER PIXEL COLOR
	;TODO: SEND THE SINGLE COLOR, PASSED IN R10
	


	
	POP {R0-R4, r10, PC}
;#####################################################################################################################################################################


;	REVISE THE PREVIOUS TWO FUNCTIONS (ADDRESS_SET AND DRAW_PIXEL) WITH YOUR TA BEFORE PROCEEDING



	B skipped
	LTORG
skipped




;##########################################################################################################################################
DRAW_RECTANGLE_FILLED
	;TODO: IMPLEMENT THIS FUNCTION ENTIRELY, AND SPECIFY THE ARGUMENTS IN COMMENTS, WE DRAW A RECTANGLE BY SPECIFYING ITS TOP-LEFT AND LOWER-RIGHT POINTS, THEN FILL IT WITH THE SAME COLOR
	;X1 = [] r0
	;Y1 = [] r1
	;X2 = [] r3
	;Y2 = [] r4
	;COLOR = [] r10
	PUSH {R0-R12, LR}
	
	;R0 = X1
	;R1 = X2
	;R3 = Y1
	;R4 = Y2
	
	mov r9, r1
	mov r1, r3
	mov r3, r9
	
	BL ADDRESS_SET
	

	
	sub r11, r1, r0
	sub r12, r4, r3
	mul r11, r11, r12
	
loop
	mov r5, r10, lsr #8
	mov r2, r5
	BL LCD_DATA_WRITE
	mov r2, r10
	BL LCD_DATA_WRITE
	
	subs r11, #1
	bne loop



	POP {R0-R12, PC}
;##########################################################################################################################################


TIME_POSITION FUNCTION
	PUSH {R3-R12, LR}
	
	CMP R8,#1
	BLEQ HOURS_TENS_POS
	CMP R8,#2
	BLEQ HOURS_ONES_POS
	CMP R8,#3
	BLEQ MIN_TENS_POS
	CMP R8,#4
	BLEQ MIN_ONES_POS
	CMP R8,#5
	BLEQ SEC_TENS_POS
	CMP R8,#6
	BLEQ SEC_ONES_POS
	CMP R8,#7
	BLEQ LETTER1
	CMP R8,#8
	BLEQ LETTER2
	CMP R8,#9
	BLEQ LETTER3
	CMP R8,#10
	BLEQ LETTER4
	CMP R8,#11
	BLEQ LETTER5
	
	CMP R8,#12
	BLEQ SWH_TENS_POS
	CMP R8,#13
	BLEQ SWH_ONES_POS
	CMP R8,#14
	BLEQ SWM_TENS_POS
	CMP R8,#15
	BLEQ SWM_ONES_POS
	
	
HOURS_TENS_POS
	MOV R0,#110
	MOV R1,#120
	B ENDING
HOURS_ONES_POS
	MOV R0,#170
	MOV R1,#120
	B ENDING
MIN_TENS_POS
	MOV R0,#110
	MOV R1,#60
	B ENDING
MIN_ONES_POS
	MOV R0,#170
	MOV R1,#60
	B ENDING
SEC_TENS_POS
	MOV R0,#230
	MOV R1,#60
	B ENDING
SEC_ONES_POS
	MOV R0,#260
	MOV R1,#60
	B ENDING
LETTER1
	MOV R0,#220
	MOV R1, #205
	B ENDING
LETTER2
	MOV R0,#245
	MOV R1, #205
	B ENDING
LETTER3
	MOV R0,#270
	MOV R1, #205
	B ENDING
LETTER4
	MOV R0,#295
	MOV R1, #205
	B ENDING
LETTER5
	MOV R0,#255
	MOV R1, #182
	B ENDING
	
SWH_TENS_POS
	MOV R0,#10
	MOV R1, #155
	B ENDING
SWH_ONES_POS
	MOV R0,#35
	MOV R1, #155
	B ENDING
SWM_TENS_POS
	MOV R0,#10
	MOV R1, #130
	B ENDING
SWM_ONES_POS
	MOV R0,#35
	MOV R1, #130
	B ENDING
	
	
ENDING
	POP {R3-R12, PC}
	ENDFUNC



;##########################################################################################################################
;#############FUNCTIONS THEMES####################################################################################
THEME1_BACKGROUND FUNCTION
	PUSH{R0-R12, LR}
	; =>drawing the date and temperature rectangles:
	;CMP R8,# 20
	;BEQ BARA1
	ldr r10, = BLACK
    MOV R0, #0
    MOV R1, #0
    MOV R3, #320
    MOV R4, #240 ;COLOR THE BACKGROUND BLACK
	BL DRAW_RECTANGLE_FILLED
	LDR R10, =RED
	MOV R0,#0
	MOV R1, #180
	MOV R3, #105
	MOV R4, #240
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10, =RED
	MOV R0,#215
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	BL DRAW_RECTANGLE_FILLED
	
	BL DRAW_SUBMISSION_DATE
	
;BARA1
	POP{R0-R12, PC}
	ENDFUNC
	
	
THEME1_TEXTILE FUNCTION
	PUSH{R0-R12, LR}
	PUSH{R0-R2}
	bl GetTimeFromRTC
	mov r5,r0 ; hours
	mov r6,r1 ; mins
	mov r7, r2 ; sec
	POP{R0-R2}
	
    
;--------------------------------------------------------------------------------------------------	
	
    BL delay_1_second
	BL DRAW_DET1
	BL DRAW_BIMO1
;=>>drawing the hours :
	
;.................
    ;R0 FEEHA EL HOURS , EL HOURS TWO SECTIONS AWEL SECTION 0 AW 1 TANY SECTION 0-9
    ldr r10, =RED
	;R5=HOURS
	CMP R5,#9
	BLE LABEL_HOUR1
	
	
	
	
	MOV R8,#1     ;;DA LOW AKBAR
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#2
	BL TIME_POSITION
	SUBS R8,R5,#10
	LDR R10, =RED
	BL DRAW_BCD
	B TARGET_HOUR1
	
	
LABEL_HOUR1
	MOV R8,#1
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#2
	BL TIME_POSITION
	MOV R8,R5
	LDR R10, =RED
	BL DRAW_BCD
	 
TARGET_HOUR1
	
	;=>>drawing the minutes :
	
	
	ldr r10, =RED
	;R6=MINUTES
	CMP R6,#9
	BLE LABEL_MIN_Z1
	CMP R6,#19
	BLE LABEL_MIN_O1
    CMP R6,#29
	BLE LABEL_MIN_T1
	CMP R6,#39
	BLE LABEL_MIN_TH1
	CMP R6,#49
	BLE LABEL_MIN_F1
	CMP R6,#59
	BLE LABEL_MIN_FI1
	
	
	
LABEL_MIN_Z1 
	MOV R8,#3
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	MOV R8,R6
	LDR R10, =RED
	BL DRAW_BCD
	B TARGET_MIN1
	
    
	
LABEL_MIN_O1
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#10
	LDR R10, =RED
	BL DRAW_BCD
	B TARGET_MIN1
	
	
	
LABEL_MIN_T1
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#20
	LDR R10, =RED
	BL DRAW_BCD
	B TARGET_MIN1
	

	
LABEL_MIN_TH1
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#3
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#30
	LDR R10, =RED
	BL DRAW_BCD
	B TARGET_MIN1
	

	
LABEL_MIN_F1
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#4
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#40
	LDR R10, =RED
	BL DRAW_BCD
	B TARGET_MIN1
	

	
LABEL_MIN_FI1
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#5
	LDR R10, =RED
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#50
	LDR R10, =RED
	BL DRAW_BCD
	B TARGET_MIN1
	 
TARGET_MIN1
	
	
	;ldr r10, =RED
	;MOV R8,#3
	;BL TIME_POSITION
	;MOV R8,#0
	;BL DRAW_BCD
	;
	;ldr r10, =RED
	;MOV R8,#4
	;BL TIME_POSITION
	;MOV R8,#0
	;BL DRAW_BCD
	;--------------------------------------------------------------------------------------
	
	;=> drawing the seconds :
	
	ldr r10, =RED
	;R7=SECONDS
	CMP R7,#9
	BLE LABEL_SEC_Z1
	CMP R7,#19
	BLE LABEL_SEC_O1
 	CMP R7,#29
	BLE LABEL_SEC_T1
	CMP R7,#39
	BLE LABEL_SEC_TH1
	CMP R7,#49
	BLE LABEL_SEC_F1
	CMP R7,#59
	BLE LABEL_SEC_FI1
	
LABEL_SEC_Z1 
	MOV R8,#5
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =RED
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	MOV R8,R7
	LDR R10, =RED
	BL DRAWSEC_BCD
	B TARGET_SEC1
	

	
LABEL_SEC_O1
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =RED
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#10
	LDR R10, =RED
	BL DRAWSEC_BCD
	B TARGET_SEC1
	

	
LABEL_SEC_T1
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =RED
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#20
	LDR R10, =RED
	BL DRAWSEC_BCD
	B TARGET_SEC1
	

	
LABEL_SEC_TH1
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#3
	LDR R10, =RED
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#30
	LDR R10, =RED
	BL DRAWSEC_BCD
	B TARGET_SEC1
	

	
LABEL_SEC_F1
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#4
	LDR R10, =RED
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#40
	LDR R10, =RED
	BL DRAWSEC_BCD
	B TARGET_SEC1
	

	
LABEL_SEC_FI1
	MOV R8,#5  
	BL TIME_POSITION
	MOV R8,#5
	LDR R10, =RED
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#50
	LDR R10, =RED
	BL DRAWSEC_BCD
	B TARGET_SEC1
	 
TARGET_SEC1
	;ldr r10, =RED
	;MOV R8,#5
	;BL TIME_POSITION
	;MOV R8,#0
	;BL DRAWSEC_BCD
	;
	;ldr r10, =RED
	;MOV R8,#6
	;BL TIME_POSITION
	;MOV R8,#0
	;BL DRAWSEC_BCD
	;--------------------------------------------------------------------------------------
	
	
	; =>drawing the date and temperature rectangles:
	;LDR R10, =RED
	;MOV R0,#0
	;MOV R1, #180
	;MOV R3, #105
	;MOV R4, #240
	;BL DRAW_RECTANGLE_FILLED
	;
	;LDR R10, =RED
	;MOV R0,#215
	;MOV R1, #180
	;MOV R3, #320
	;MOV R4, #240
	;BL DRAW_RECTANGLE_FILLED
	;
	;BL DRAW_SUBMISSION_DATE
	;BL DRAW_BIMO
	BL delay_1_second
    BL BLACKOUT
	BL delay_1_second
	BL DRAW_BIMO1_BLACKOUT
	POP{R0-R12, PC}
	ENDFUNC
	;-----------------------------THEME 2-------------------------------
THEME2_BACKGROUND FUNCTION 
	PUSH{R0-R12,LR}
	; =>drawing the date and temperature rectangles:
	;CMP R8, #30
	;BEQ BARA2
	ldr r10, = BLUE
    MOV R0, #0
    MOV R1, #0
    MOV R3, #320
    MOV R4, #240 ;COLOR THE BACKGROUND BLACK
	BL DRAW_RECTANGLE_FILLED
	LDR R10, =BLACK
	MOV R0,#0
	MOV R1, #180
	MOV R3, #105
	MOV R4, #240
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10, =BLACK
	MOV R0,#215
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	BL DRAW_RECTANGLE_FILLED
	;LDR R10, =BLACK
	;MOV R0,#23
	;MOV R1, #75
	;MOV R3, #25
	;MOV R4, #77
	;BL DRAWPIXEL
	
	
	BL DRAW_SUBMISSION_DATE2
	
;BARA2
	POP{R0-R12,PC}
	ENDFUNC

THEME2_TEXTILE FUNCTION
	PUSH{R0-R12,LR}
	
	PUSH{R0-R2}
	bl GetTimeFromRTC
	mov r5,r0 ; hours
	mov r6,r1 ; mins
	mov r7, r2 ; sec
	POP{R0-R2}
	
    
;--------------------------------------------------------------------------------------------------	
	
    BL delay_1_second
	BL DRAW_DET2
;=>>drawing the hours :
	
;.................
    BL DRAW_BIMO2
	
	;R0 FEEHA EL HOURS , EL HOURS TWO SECTIONS AWEL SECTION 0 AW 1 TANY SECTION 0-9
    ldr r10, =BLACK
	;R5=HOURS
	CMP R5,#9
	BLE LABEL2_HOUR
	
	
	
	
	MOV R8,#1     ;;DA LOW AKBAR
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#2
	BL TIME_POSITION
	SUBS R8,R5,#10
	LDR R10, =BLACK
	BL DRAW_BCD
	B TARGET2_HOUR
	
	
LABEL2_HOUR
	MOV R8,#1
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#2
	BL TIME_POSITION
	MOV R8,R5
	LDR R10, =BLACK
	BL DRAW_BCD
	 
TARGET2_HOUR
;......................	
	ldr r10, =BLACK
	;R6=MINUTES
	CMP R6,#9
	BLE LABEL2_MIN_Z
	CMP R6,#19
	BLE LABEL2_MIN_O
    CMP R6,#29
	BLE LABEL2_MIN_T
	CMP R6,#39
	BLE LABEL2_MIN_TH
	CMP R6,#49
	BLE LABEL2_MIN_F
	CMP R6,#59
	BLE LABEL2_MIN_FI
	
	
	
LABEL2_MIN_Z 
	MOV R8,#3
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	MOV R8,R6
	LDR R10, =BLACK
	BL DRAW_BCD
	B TARGET2_MIN
	
    
	
LABEL2_MIN_O
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#10
	LDR R10, =BLACK
	BL DRAW_BCD
	B TARGET2_MIN
	
	
	
LABEL2_MIN_T
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#20
	LDR R10, =BLACK
	BL DRAW_BCD
	B TARGET2_MIN
	

	
LABEL2_MIN_TH
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#3
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#30
	LDR R10, =BLACK
	BL DRAW_BCD
	B TARGET2_MIN
	

	
LABEL2_MIN_F
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#4
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#40
	LDR R10, =BLACK
	BL DRAW_BCD
	B TARGET2_MIN
	

	
LABEL2_MIN_FI
	MOV R8,#3   
	BL TIME_POSITION
	MOV R8,#5
	LDR R10, =BLACK
	BL DRAW_BCD
	MOV R8,#4
	BL TIME_POSITION
	SUBS R8,R6,#50
	LDR R10, =BLACK
	BL DRAW_BCD
	B TARGET2_MIN
	 
TARGET2_MIN
	
	
	;ldr r10, =RED
	;MOV R8,#3
	;BL TIME_POSITION
	;MOV R8,#0
	;BL DRAW_BCD
	;
	;ldr r10, =RED
	;MOV R8,#4
	;BL TIME_POSITION
	;MOV R8,#0
	;BL DRAW_BCD
	;--------------------------------------------------------------------------------------
	
	;=> drawing the seconds :
	
	ldr r10, =BLACK
	;R7=SECONDS
	CMP R7,#9
	BLE LABEL2_SEC_Z
	CMP R7,#19
	BLE LABEL2_SEC_O
 	CMP R7,#29
	BLE LABEL2_SEC_T
	CMP R7,#39
	BLE LABEL2_SEC_TH
	CMP R7,#49
	BLE LABEL2_SEC_F
	CMP R7,#59
	BLE LABEL2_SEC_FI
	
LABEL2_SEC_Z 
	MOV R8,#5
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	MOV R8,R7
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_SEC
	

	
LABEL2_SEC_O
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#10
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_SEC
	

	
LABEL2_SEC_T
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#20
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_SEC
	

	
LABEL2_SEC_TH
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#3
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#30
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_SEC
	

	
LABEL2_SEC_F
	MOV R8,#5   
	BL TIME_POSITION
	MOV R8,#4
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#40
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_SEC
	

	
LABEL2_SEC_FI
	MOV R8,#5  
	BL TIME_POSITION
	MOV R8,#5
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#6
	BL TIME_POSITION
	SUBS R8,R7,#50
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_SEC
	 
TARGET2_SEC
	
	BL delay_1_second
	LDR R10, =BLUE
    BL BLACKOUT2
	BL delay_1_second
	
	BL DRAWSTOP2
	
	
	POP{R0-R12,PC}
	ENDFUNC
;##########################################################################################################################
; BIMO
SEGMENT_A FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R1,R1,#32
	ADD R3,R0,#40
	ADD R4,R1,#8
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC
	
SEGMENT_B FUNCTION
	PUSH {R0-R12,LR}
	
	ADD R1,R1,#20
	ADD R3,R0,#10
	ADD R4,R1,#20
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_C FUNCTION
	PUSH {R0-R12,LR}
	
	ADD R0,R0,#30
	ADD R1,R1,#20
	ADD R3,R0,#10
	ADD R4,R1,#20	
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_D FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R1,R1,#16
	ADD R3,R0,#40
	ADD R4,R1,#8
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_E FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R1,R1,#8
	ADD R3,R0,#10
	ADD R4,R1,#12
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_F FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R0,R0,#30
	ADD R3,R0,#10
	ADD R4,R1,#20
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_G FUNCTION
	PUSH {R0-R12,LR}
	
	ADD R3,R0,#40
	ADD R4,R1,#8
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC
;##############################################################################################################################
BLACKOUT FUNCTION 
	PUSH {R0-R12,LR}
	ldr r10, = BLACK
	mov r8,#1
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, = BLACK
	mov r8,#2
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, = BLACK
	mov r8,#3
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, =BLACK
	mov r8,#4
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, = BLACK
	mov r8,#5
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLACK
	mov r8,#6
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	
	ldr r10, = RED
	mov r8,#11
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	
	
	ldr r10, = BLACK
	mov r8,#12         ;SWH_TENS
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLACK
	mov r8,#13         ;SWH_ONES
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLACK
	mov r8,#14         ;SWM_TENS
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLACK
	mov r8,#15         ;SWH_ONES
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	
	POP {R0-R12,PC}
	ENDFUNC

BLACKOUT2 FUNCTION 
	PUSH {R0-R12,LR}
	ldr r10, = BLUE
	mov r8,#1
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, = BLUE
	mov r8,#2
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, = BLUE
	mov r8,#3
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, =BLUE
	mov r8,#4
	BL TIME_POSITION
	mov r8,#8
	BL DRAW_BCD
	ldr r10, = BLUE
	mov r8,#5
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLUE
	mov r8,#6
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLACK
	mov r8,#11
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	
	ldr r10, = BLUE
	mov r8,#12         ;SWH_TENS
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLUE
	mov r8,#13         ;SWH_ONES
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLUE
	mov r8,#14         ;SWM_TENS
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	ldr r10, = BLUE
	mov r8,#15         ;SWH_ONES
	BL TIME_POSITION
	mov r8,#8
	BL DRAWSEC_BCD
	BL DRAW_BIMO2_BLACKOUT
	POP {R0-R12,PC}
	ENDFUNC

;######################################################################################################################################
SEGMENT_ASEC FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R1,R1,#16
	ADD R3,R0,#20
	ADD R4,R1,#4
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC
	
SEGMENT_BSEC FUNCTION
	PUSH {R0-R12,LR}
	
	ADD R1,R1,#10
	ADD R3,R0,#5
	ADD R4,R1,#10
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_CSEC FUNCTION
	PUSH {R0-R12,LR}
	
	ADD R0,R0,#15
	ADD R1,R1,#10
	ADD R3,R0,#5
	ADD R4,R1,#10	
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_DSEC FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R1,R1,#8
	ADD R3,R0,#20
	ADD R4,R1,#4
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_ESEC FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R1,R1,#4
	ADD R3,R0,#5
	ADD R4,R1,#6
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_FSEC FUNCTION
	PUSH {R0-R12,LR}
	
	
	ADD R0,R0,#15
	ADD R3,R0,#5
	ADD R4,R1,#15    ; 15 instead of 10 for better look
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

SEGMENT_GSEC FUNCTION
	PUSH {R0-R12,LR}
	
	ADD R3,R0,#20
	ADD R4,R1,#4
	BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	ENDFUNC

;######################################################################################################################################
DRAW_BCD FUNCTION
	PUSH{R0-R12,LR}
	
	CMP R8,#0
	BLEQ DRAW_0
	CMP R8,#1
	BLEQ DRAW_1
	CMP R8,#2
	BLEQ DRAW_2
	CMP R8,#3
	BLEQ DRAW_3
	CMP R8,#4
	BLEQ DRAW_4
	CMP R8,#5
	BLEQ DRAW_5
	CMP R8,#6
	BLEQ DRAW_6
	CMP R8,#7
	BLEQ DRAW_7
	CMP R8,#8
	BLEQ DRAW_8
	CMP R8,#9
	BLEQ DRAW_9
	
	
	
	
	POP {R0-R12,PC}
	ENDFUNC


DRAW_0 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_C
	BL SEGMENT_E
	BL SEGMENT_B
	BL SEGMENT_F
	BL SEGMENT_A
	BL SEGMENT_G
	
	POP{R0-R12,PC}
	ENDFUNC	

DRAW_1 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_C
	BL SEGMENT_F
	
	POP{R0-R12,PC}
	ENDFUNC

DRAW_2 FUNCTION
	PUSH{R0-R12, LR}
	
	
	BL SEGMENT_C
	BL SEGMENT_E
	BL SEGMENT_G
	BL SEGMENT_A
	BL SEGMENT_D
	
	POP{R0-R12,PC}
	ENDFUNC
	
DRAW_3 FUNCTION
	PUSH{R0-R12, LR}
	
	
	BL SEGMENT_C
	BL SEGMENT_F
	BL SEGMENT_G
	BL SEGMENT_A
	BL SEGMENT_D	
	
	POP{R0-R12,PC}
	ENDFUNC	
	
DRAW_4 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_B
	BL SEGMENT_F
	BL SEGMENT_C
	BL SEGMENT_D
	
	POP{R0-R12,PC}
	ENDFUNC

DRAW_5 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_B
	BL SEGMENT_F
	BL SEGMENT_D
	BL SEGMENT_A
	BL SEGMENT_G
	
	POP{R0-R12,PC}
	ENDFUNC

DRAW_6 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_E
	BL SEGMENT_B
	BL SEGMENT_F
	BL SEGMENT_D
	BL SEGMENT_A
	BL SEGMENT_G
	
	POP{R0-R12,PC}
	ENDFUNC
	
DRAW_7 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_C
	BL SEGMENT_F
	BL SEGMENT_A
	BL SEGMENT_D
	
	POP{R0-R12,PC}
	ENDFUNC
	
DRAW_8 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_C
	BL SEGMENT_E
	BL SEGMENT_B
	BL SEGMENT_F
	BL SEGMENT_D
	BL SEGMENT_A
	BL SEGMENT_G
	
	POP{R0-R12,PC}
	ENDFUNC	
	
DRAW_9 FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_C
	BL SEGMENT_B
	BL SEGMENT_F
	BL SEGMENT_D
	BL SEGMENT_A
	BL SEGMENT_G
	
	POP{R0-R12,PC}
	ENDFUNC		
;########################################################################################################################################
DRAWSEC_BCD FUNCTION
	PUSH{R0-R12,LR}
	
	CMP R8,#0
	BLEQ DRAW_0SEC
	CMP R8,#1
	BLEQ DRAW_1SEC
	CMP R8,#2
	BLEQ DRAW_2SEC
	CMP R8,#3
	BLEQ DRAW_3SEC
	CMP R8,#4
	BLEQ DRAW_4SEC
	CMP R8,#5
	BLEQ DRAW_5SEC
	CMP R8,#6
	BLEQ DRAW_6SEC
	CMP R8,#7
	BLEQ DRAW_7SEC
	CMP R8,#8
	BLEQ DRAW_8SEC
	CMP R8,#9
	BLEQ DRAW_9SEC
	CMP R8,#10
	BLEQ DRAW_D
	CMP R8,#11
	BLEQ DRAW_E
	CMP R8,#12
	BLEQ DRAW_T
	CMP R8,#13
	BLEQ DRAW_DOT
	CMP R8,#14
	BLEQ DRAW_F
	
	
	
	
	POP {R0-R12,PC}
	ENDFUNC


DRAW_0SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_CSEC
	BL SEGMENT_ESEC
	BL SEGMENT_BSEC
	BL SEGMENT_FSEC
	BL SEGMENT_ASEC
	BL SEGMENT_GSEC
	
	POP{R0-R12,PC}
	ENDFUNC	

DRAW_1SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_CSEC
	BL SEGMENT_FSEC
	
	POP{R0-R12,PC}
	ENDFUNC

DRAW_2SEC FUNCTION
	PUSH{R0-R12, LR}
	
	
	BL SEGMENT_CSEC
	BL SEGMENT_ESEC
	BL SEGMENT_GSEC
	BL SEGMENT_ASEC
	BL SEGMENT_DSEC
	
	POP{R0-R12,PC}
	ENDFUNC
	
DRAW_3SEC FUNCTION
	PUSH{R0-R12, LR}
	
	
	BL SEGMENT_CSEC
	
	BL SEGMENT_FSEC
	BL SEGMENT_GSEC
	BL SEGMENT_ASEC
	BL SEGMENT_DSEC
	
	POP{R0-R12,PC}
	ENDFUNC	
	
DRAW_4SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_BSEC
	BL SEGMENT_FSEC
	BL SEGMENT_CSEC
	BL SEGMENT_DSEC
	
	POP{R0-R12,PC}
	ENDFUNC

DRAW_5SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_BSEC
	BL SEGMENT_FSEC
	BL SEGMENT_DSEC
	BL SEGMENT_ASEC
	BL SEGMENT_GSEC
	
	POP{R0-R12,PC}
	ENDFUNC

DRAW_6SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_ESEC
	BL SEGMENT_BSEC
	BL SEGMENT_FSEC
	BL SEGMENT_DSEC
	BL SEGMENT_ASEC
	BL SEGMENT_GSEC
	
	POP{R0-R12,PC}
	ENDFUNC
	
DRAW_7SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_CSEC
	BL SEGMENT_FSEC
	BL SEGMENT_ASEC
	BL SEGMENT_DSEC
	
	POP{R0-R12,PC}
	ENDFUNC
	
DRAW_8SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_CSEC
	BL SEGMENT_ESEC
	BL SEGMENT_BSEC
	BL SEGMENT_FSEC
	BL SEGMENT_DSEC
	BL SEGMENT_ASEC
	BL SEGMENT_GSEC
	
	POP{R0-R12,PC}
	ENDFUNC	
	
DRAW_9SEC FUNCTION
	PUSH{R0-R12, LR}
	
	BL SEGMENT_CSEC
	BL SEGMENT_BSEC
	BL SEGMENT_FSEC
	BL SEGMENT_DSEC
	BL SEGMENT_ASEC
	BL SEGMENT_GSEC
	
	POP{R0-R12,PC}
	ENDFUNC	
DRAW_D FUNCTION 
	PUSH{R0-R12, LR}
	
	
	BL SEGMENT_CSEC
	BL SEGMENT_ESEC
	BL SEGMENT_BSEC
	BL SEGMENT_FSEC
	BL SEGMENT_ASEC
	BL SEGMENT_GSEC
	
	POP{R0-R12,PC}
	ENDFUNC	
DRAW_E FUNCTION
	PUSH{R0-R12, LR}
	
	
	BL SEGMENT_BSEC
	
	BL SEGMENT_ESEC
	BL SEGMENT_GSEC
	BL SEGMENT_ASEC
	BL SEGMENT_DSEC
	
	POP{R0-R12,PC}
	ENDFUNC	
DRAW_T FUNCTION
		PUSH{R0-R12, LR}
	
	
	BL SEGMENT_BSEC
	
	BL SEGMENT_ESEC
	BL SEGMENT_GSEC
	BL SEGMENT_DSEC
	
	POP{R0-R12,PC}
	ENDFUNC	
DRAW_F FUNCTION
	PUSH{R0-R12, LR}
	
	
	BL SEGMENT_BSEC
	
	BL SEGMENT_ESEC
	BL SEGMENT_ASEC
	BL SEGMENT_DSEC
	
	POP{R0-R12,PC}
	ENDFUNC	
DRAW_DOT FUNCTION 
	push{R0-R12,LR}
	
	MOV R0,#300
	MOV R1,#205
	MOV R3,#305
	MOV R4,#210
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0,#300
	MOV R1,#220
	MOV R3,#305
	MOV R4,#225
	BL DRAW_RECTANGLE_FILLED
	
	
	POP{R0-R12,PC}
	ENDFUNC	
;#####################################################################################################################################################################
DRAW_SUBMISSION_DATE FUNCTION
	PUSH{R0-R12, LR}
	LDR R10, =BLACK
	
	MOV R0,#5
	MOV R1,#190 
	BL DRAW_2SEC
	LDR R10, =BLACK
	MOV R0, #30
	MOV R1, #190
	BL DRAW_3SEC
	
	
	LDR R10, = BLACK
	MOV R0, # 50
	MOV R1, #190
	BL DRAW_1SEC
	
	LDR R10, =BLACK
	
	MOV R0,#75
	MOV R1,#190 
	BL DRAW_2SEC
	

	
	POP{R0-R12,PC}
	ENDFUNC
	
DRAW_SUBMISSION_DATE2 FUNCTION
	PUSH{R0-R12, LR}
	LDR R10, =BLUE
	
	MOV R0,#5
	MOV R1,#190 
	BL DRAW_2SEC
	LDR R10, =BLUE
	MOV R0, #30
	MOV R1, #190
	BL DRAW_3SEC
	
	
	LDR R10, = BLUE
	MOV R0, # 50
	MOV R1, #190
	BL DRAW_1SEC
	
	LDR R10, =BLUE
	
	MOV R0,#75
	MOV R1,#190 
	BL DRAW_2SEC
	

	
	POP{R0-R12,PC}
	ENDFUNC
;####################################################################################################################################

;DRAW_BIMO FUNCTION 
;	PUSH{R0-R12, LR}
;	LDR R10,=RED
;	MOV R0,#280
;	MOV R1,#40
;	ADD R3, R0,#30
;	ADD R4,R1,#15
;	BL DRAW_RECTANGLE_FILLED
;	
;	POP{R0-R12,PC}
;	
;	
;	ENDFUNC

DRAW_BIMO1 FUNCTION 
	PUSH{R0-R12, LR}
	MOV R9,#4
	MUL R11,R7,R9
	
	
	LDR R10,=RED
	MOV R12, #295
	SUB R0,R12,R11       ;ras  bimo
	MOV R1,#40
	MOV R12, #315
	SUB R3,R12, R11
	MOV R4, #50
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12, #299
	SUB R0,R12,R11      ;EL 3EIN EL SHEMAL  bimo
	MOV R1,#42
	MOV R12,#303
	SUB R3, R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#307
	SUB R0,R12,R11      ;EL 3EIN EL YEMIN  bimo
	MOV R1,#42
	MOV R12,#311
	SUB R3,R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=RED
	MOV R12,#295
	SUB R0,R12,R11      ;GESM  bimo
	MOV R1,#15
	MOV R12,#315
	SUB R3,R12,R11
	MOV R4, #35
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=RED
	MOV R12,#299
	SUB R0,R12,R11      ;REGL EL SHEMAL bimo
	MOV R1,#0
	MOV R12,#303
	SUB R3,R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=RED
	MOV R12,307
	SUB R0,R12,R11       ;REGL EL YEMYN bimo
	MOV R1,#0
	MOV R12,#311
	SUB R3,R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#307
	SUB R0,R12,R11      ;EYD EL YEMYN bimo
	MOV R1,#25
	MOV R12,#311
	SUB R3,R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#299
	SUB R0,R12,R11      ;EYD EL SHEMAL bimo
	MOV R1,#25
	MOV R12,#303
	SUB R3,R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	
	
	
	POP{R0-R12,PC}
	
	
	ENDFUNC
	
DRAW_BIMO1_BLACKOUT FUNCTION 
	PUSH{R0-R12, LR}
	MOV R9,#4
	MUL R11,R7,R9
	
	
	LDR R10,=BLACK
	MOV R12, #295
	SUB R0,R12,R11       ;ras  bimo
	MOV R1,#40
	MOV R12, #315
	SUB R3,R12, R11
	MOV R4, #50
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12, #299
	SUB R0,R12,R11      ;EL 3EIN EL SHEMAL  bimo
	MOV R1,#42
	MOV R12,#303
	SUB R3, R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#307
	SUB R0,R12,R11      ;EL 3EIN EL YEMIN  bimo
	MOV R1,#42
	MOV R12,#311
	SUB R3,R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#295
	SUB R0,R12,R11      ;GESM  bimo
	MOV R1,#15
	MOV R12,#315
	SUB R3,R12,R11
	MOV R4, #35
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#299
	SUB R0,R12,R11      ;REGL EL SHEMAL bimo
	MOV R1,#0
	MOV R12,#303
	SUB R3,R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,307
	SUB R0,R12,R11       ;REGL EL YEMYN bimo
	MOV R1,#0
	MOV R12,#311
	SUB R3,R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#307
	SUB R0,R12,R11      ;EYD EL YEMYN bimo
	MOV R1,#25
	MOV R12,#311
	SUB R3,R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#299
	SUB R0,R12,R11      ;EYD EL SHEMAL bimo
	MOV R1,#25
	MOV R12,#303
	SUB R3,R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	
	
	
	
	
	POP{R0-R12,PC}
	
	
	ENDFUNC
	
DRAW_BIMO2 FUNCTION 
	PUSH{R0-R12, LR}
	LDR R10,=BLACK
	MOV R9,#4
	MUL R11, R7,R9
	MOV R12,#5
	ADD R0,R12,R11   ;X1    ;ras  bimo
	MOV R1,#40    ;Y1
	MOV R12,#25
	ADD R3, R12,R11  ;X2
	MOV R4, #50   ;Y2
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#9
	ADD R0, R12,R11      ;EL 3EIN EL SHEMAL  bimo
	MOV R1,#42
	MOV R12, #13
    ADD R3, R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#17
	ADD R0, R12,R11     ;EL 3EIN EL YEMIN  bimo
	MOV R1,#42
	MOV R12, #21
	ADD R3, R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	
	MOV R12,#5 
    ADD R0, R12,R11	;GESM  bimo
	MOV R1,#15
	MOV R12, #25
	ADD R3, R12,R11
	MOV R4, #35
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	MOV R12,#9
	ADD R0, R12,R11;REGL EL SHEMAL bimo
	MOV R1,#0
	MOV R12, #13
	ADD R3, R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLACK
	
	MOV R12,#17
	ADD R0, R12,R11;REGL EL YEMYN bimo
	MOV R1,#0
	MOV R12, #21
	ADD R3, R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#17
	ADD R0, R12,R11	;EYD EL YEMYN bimo
	MOV R1,#25
	MOV R12, #21
	ADD R3, R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#9
	ADD R0, R12,R11;EYD EL SHEMAL bimo
	MOV R1,#25
	MOV R12, #13
	ADD R3, R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	
	ENDFUNC
	
DRAW_BIMO2_BLACKOUT FUNCTION 
	PUSH{R0-R12, LR}
	LDR R10,=BLUE
	MOV R9,#4
	MUL R11, R7,R9
	MOV R12,#5
	ADD R0,R12,R11   ;X1    ;ras  bimo
	MOV R1,#40    ;Y1
	MOV R12,#25
	ADD R3, R12,R11  ;X2
	MOV R4, #50   ;Y2
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#9
	ADD R0, R12,R11      ;EL 3EIN EL SHEMAL  bimo
	MOV R1,#42
	MOV R12, #13
    ADD R3, R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#17
	ADD R0, R12,R11     ;EL 3EIN EL YEMIN  bimo
	MOV R1,#42
	MOV R12, #21
	ADD R3, R12,R11
	MOV R4, #46
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#5 
    ADD R0, R12,R11	;GESM  bimo
	MOV R1,#15
	MOV R12, #25
	ADD R3, R12,R11
	MOV R4, #35
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#9
	ADD R0, R12,R11;REGL EL SHEMAL bimo
	MOV R1,#0
	MOV R12, #13
	ADD R3, R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	
	MOV R12,#17
	ADD R0, R12,R11;REGL EL YEMYN bimo
	MOV R1,#0
	MOV R12, #21
	ADD R3, R12,R11
	MOV R4, #5
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#17
	ADD R0, R12,R11	;EYD EL YEMYN bimo
	MOV R1,#25
	MOV R12, #21
	ADD R3, R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	LDR R10,=BLUE
	MOV R12,#9
	ADD R0, R12,R11;EYD EL SHEMAL bimo
	MOV R1,#25
	MOV R12, #13
	ADD R3, R12,R11
	MOV R4, #30
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	
	ENDFUNC
;#############################################################################################





;#####################################################################################################################################################################
SETUP FUNCTION
	;THIS FUNCTION ENABLES PORT A, MARKS IT AS OUTPUT, CONFIGURES SOME GPIO
	;THEN FINALLY IT CALLS LCD_INIT (HINT, USE THIS SETUP FUNCTION DIRECTLY IN THE MAIN)
	PUSH {R0-R12, LR}

	;Enable GPIOA Clock
	LDR r1, =RCC_APB2ENR
	LDR r0, [r1]
	MOV R2, #1
	ORR r0, r0,r2, LSL #2
	STR r0, [r1]
	
	;Enable AFIO Clock
	LDR R1, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R0, [R1]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R0, R0, R2        		; Set bit 0 to enable afio
    STR R0, [R1]
	
	;
	LDR r0, =GPIOA_CRL
	mov r1, #0x33333333
	STR r1, [r0]
	
	LDR r0, =GPIOA_CRH
	mov r1, #0x33333333
	STR r1, [r0]
	
	BL LCD_INIT

	POP {R0-R12, PC}
	ENDFUNC
;#####################################################################################################################################################################






; HELPER DELAYS IN THE SYSTEM, YOU CAN USE THEM DIRECTLY


;##########################################################################################################################################
delay_1_second
	;this function just delays for 1 second
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop
	SUBS r8, #1
	CMP r8, #0
	BGE delay_loop
	POP {R8, PC}
;##########################################################################################################################################




;##########################################################################################################################################
delay_half_second
	;this function just delays for half a second
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop1
	SUBS r8, #2
	CMP r8, #0
	BGE delay_loop1

	POP {R8, PC}
;##########################################################################################################################################


;##########################################################################################################################################
delay_milli_second
	;this function just delays for a millisecond
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop2
	SUBS r8, #1000
	CMP r8, #0
	BGE delay_loop2

	POP {R8, PC}
;##########################################################################################################################################



;##########################################################################################################################################
delay_10_milli_second
	;this function just delays for 10 millisecondS
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop3
	SUBS r8, #100
	CMP r8, #0
	BGE delay_loop3

	POP {R8, PC}
;##########################################################################################################################################
delay_2_second
	;this function just delays for 10 millisecondS
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop5
	SUBS r8, #2
	CMP r8, #0
	BGE delay_loop5
	
	


	POP {R8, PC}


;==================GPIO_PORT_ENABLER=====================;
GPIO_ENABLE_PORT_A	FUNCTION
	PUSH{R0-R12, LR}
	ldr r0, =RCC_APB2ENR
    ldr r1, [r0]
	mov r2,#1
    orr r1, r1, r2, lsl #2  ; Enable GPIOA clock
    str r1, [r0]
	POP{R0-R12, PC}
	ENDFUNC

GPIO_ENABLE_PORT_B	FUNCTION
	PUSH{R0-R12, LR}
	ldr r0, =RCC_APB2ENR
    ldr r1, [r0]
	mov r2,#1
    orr r1, r1, r2, lsl #3  ; Enable GPIOA clock
    str r1, [r0]
	POP{R0-R12, PC}
	ENDFUNC
; enable function of port C
GPIO_ENABLE_PORT_C	FUNCTION
	PUSH{R0-R12, LR}
	ldr r0, =RCC_APB2ENR
    ldr r1, [r0]
	mov r2,#1
    orr r1, r1, r2, lsl #4  ; Enable GPIOA clock
    str r1, [r0]
	POP{R0-R12, PC}
	ENDFUNC
;====================================================;


;==================EXTI_ENABLER=====================;
;EXTI_B12_INIT	FUNCTION
	;PUSH{R0-R12, LR}
	;LDR R0, =RCC_APB2ENR        ; RCC_APB2ENR address
    ;LDR R1, [R0]                ; Read current value
    ;ORR R1, R1, #(1 << 0)       ; Enable AFIO clock
    ;STR R1, [R0]                ; Write back
	;
	;;Configure PB12 as Input (Floating/Default Pull-Down)
    ;LDR R0, =GPIOB_CRH
    ;LDR R1, [R0]
    ;BIC R1, R1, #(0xF << 16)   ; Clear bits 16-19 for PB14
    ;ORR R1, R1, #(0x4 << 16)   ; Set PB12 as Input
    ;STR R1, [R0]
	;
	;;Map B12 to exti12
	;LDR R0, =AFIO_EXTICR4
	;LDR R1, [R0]
	;BIC R1,R1, #(0XF << 0)
	;ORR R1, R1, #(0X1 <<0)
	;STR R1, [R0]
	;
	;; Enable EXTI Line 12 Interrupt
	;LDR R0, =EXTI_IMR           ; EXTI_IMR address
    ;LDR R1, [R0] 
	;ORR R1, R1, #(1 << 12)
	;STR R1, [R0]
	;
	;;Configure Rising Trigger
	;LDR R0, =EXTI_RTSR
	;LDR R1, [R0]
	;ORR R1, R1, #(1 <<12)
	;STR R1, [R0]
	;
	;;Disable falling edge
	;LDR R0, =EXTI_FTSR
	;LDR R1, [R0]
	;BIC R1, R1, #(1 << 12)
	;STR R1, [R0]
	;
	;; Enable EXTI12 interrupt in NVIC
	;LDR R0, =NVIC_ISER1
	;LDR R1, [R0]
	;ORR R1, R1, #(1 << 8)
	;STR R1, [R0]
	;
	;POP{R0-R12, PC}
	;ENDFUNC
;==================RTC_ENABLER=====================;
RTC_INIT 	FUNCTION
	PUSH{R0-R12, LR}
	;1) Set PWREN (28) and BKPEN (27) in RCC_APB1ENR
	ldr r0, =RCC_APB1ENR
	ldr r1, [r0]
	
	orr r1, r1, #(1 << 27) ;BKPEN 
	orr r1, r1, #(1 << 28) ;PWREN 
	str r1, [r0]
	
	;2) Set DBP bit 8 in PWR_CR
	ldr r0, =PWR_CR
	ldr r1, [r0]
	orr r1, r1, #(1 << 8)
	str r1, [r0]
	
	;reset bkp
	
	;3) Set LSEBYP bit 2 in RCC_BDCR
	ldr r0, =RCC_BDCR
	ldr r1, [r0]
	orr r1,r1,#(1 << 0)
	str r1, [r0]
	
	;4) Poll until LSERDY bit 1 in RCC_BDCR is set 1
Poll_LSE_Loop
	mov r2, r1
	and r2,r2, #(1<<1)
	
	cmp r2,#0
	BLEQ Poll_LSE_Loop
	
	;5)select RTC clk (LSE) source  
	ldr r0, =RCC_BDCR
	ldr r1, [r0]
	
	bic r1,r1,#0x0300 ;clear bit 8,9
	orr r1,r1, #(1 << 8) 
	str r1, [r0]
	
	;6) Enable RTC Clk 
	ldr r0, =RCC_BDCR
	ldr r1, [r0]
	
	orr r1, r1, #(1 << 15)
	str r1, [r0]
	
	;7) Poll bit 5 RTOFF in RTC_CRL
Poll_RTOFF_Loop
	ldr r0, =RTC_CRL
	ldr r1, [r0]
	
	and r1,r1 , #(1 << 5)
	cmp r1, #0
	BLEQ Poll_RTOFF_Loop

Poll_RSF_Loop
	ldr r0, =RTC_CRL
	ldr r1, [r0]
	
	and r1, r1, #(1 << 3)
	cmp r1, #0
	BLEQ Poll_RSF_Loop
	
	;8) Set the CNF bit 4 RTC_CRL
	ldr r1, [r0]
	orr r1,r1, #(1 << 4)
	str r1, [r0]
	
	;9) write 7FFFh in RTC_PRLL
	ldr r0, =RTC_PRLL
	mov r1, #0x7FFF
	str r1, [r0]
	
	; Set Counter reg to 7 pm
	ldr r0, =RTC_CNTL
	ldr r1, =INITIAL_TIME
	str r1, [r0]
	
	;10) Clear the CNF bit 4 RTC_CRL to exit configuration mode
	ldr r0, =RTC_CRL
	ldr r1, [r0]
	
	bic r1, r1, #(1 << 4)
	str r1, [r0]
	
	
	
	POP{R0-R12, PC}
	ENDFUNC


	

;ADC_INIT FUNCTION
	;PUSH{R0-R12, LR}
	;
	;;1) Enable the ADC clock
	;ldr r0, =RCC_APB2ENR
	;ldr r1, [r0]
	;
	;orr r1,r1, #(1 << 9)
	;str r1, [r0]
	;
	;;2) Set the GPIO pin connected to the ADC channel (e.g., PA1) to Analog input Mode
	;ldr r0, =GPIOA_CRL
	;ldr r1, [r0]
	;
	;bic r1, r1, #(0xf << 4)
	;str r1, [r0]
	;
	;;3) Set the ADC sampling time
	;ldr r0, =ADC1_SMPR2
	;ldr r1, [r0]
	;
	;orr r1, r1, #(7 << 3)
	;str r1, [r0]
	;
	;;4) Configure the ADC conversion sequence
	;ldr r0, =ADC_SQR3
	;mov r1, #1
	;
	;str r1, [r0]
	;
	;;5) Enable the End of Conversion (EOC) interrupt
	;LDR R0, =ADC1_CR1
	;LDR R1, [R0]
	;ORR R1, R1, #(1 << 5)      ; EOCIE: Enable End of Conversion interrupt
	;STR R1, [R0]
	;
	;;6) Enable the ADC
	;LDR R0, =ADC1_CR2
	;LDR R1, [R0]
	;ORR R1, R1, #1             ; ADON: Enable ADC
	;STR R1, [R0]
	;
	;;7) Start the ADC conversion 
	;ORR R1, R1, #(1 << 22)     ; SWSTART: Start Conversion
	;STR R1, [R0]
	;
	;;8) Enable the ADC interrupt
	;ldr r0, =NVIC_ISER0
	;MOV R1, #(1 << 18)         ; ADC1 IRQ = 18
	;STR R1, [R0]
	;
	;
	;POP{R0-R12, PC}
	;ENDFUNC


;ConvertTimeToSec FUNCTION
	;PUSH {R4-R12, LR}
	;;R4 = Hours R5 = min R6 = sec
	;;R7 = R4 * 3600 + r5 * 60 + r6
	;
	;mov r8, #3600
	;mul r4, r4, r8
	;
	;mov r9, #60
	;mul r5, r5, r9
	;
	;add r7, r4,r5
	;add r0, r7,r6
	;
	;
	;
	;POP {R4-R12, PC}
	;ENDFUNC
	
GetTimeFromRTC FUNCTION
    PUSH {R3-R12, LR}           ; Save non-volatile registers and link register
    
    ; Step 1: Read RTC counter value
    LDR R0, =RTC_CNTH           ; Load address of RTC_CNTH
    LDR R1, [R0]                ; Load upper 16 bits into R1

    LDR R0, =RTC_CNTL           ; Load address of RTC_CNTL
    LDR R2, [R0]                ; Load lower 16 bits into R2

    LSL R1, R1, #16             ; Shift upper 16 bits into position
    ORR R3, R1, R2              ; Combine upper and lower parts into R3 (Total Seconds)

    ; Step 2: Calculate hours
    MOV R4, #3600               ; Constant: seconds in an hour
    MOV R5, #0                  ; Initialize hours (R5) to 0

calc_hours
    CMP R3, R4                  ; Compare remaining seconds with 3600
    BLT calc_minutes            ; If less than 3600, move to minutes calculation
    SUB R3, R3, R4              ; Subtract 3600 from remaining seconds
    ADD R5, R5, #1              ; Increment hours
    B calc_hours                ; Repeat until R3 < 3600

calc_minutes
    ; Step 3: Calculate minutes
    MOV R4, #60                 ; Constant: seconds in a minute
    MOV R6, #0                  ; Initialize minutes (R6) to 0

calc_minutes_loop
    CMP R3, R4                  ; Compare remaining seconds with 60
    BLT store_results           ; If less than 60, move to results
    SUB R3, R3, R4              ; Subtract 60 from remaining seconds
    ADD R6, R6, #1              ; Increment minutes
    B calc_minutes_loop         ; Repeat until R3 < 60

store_results
    ; Step 4: Store results (Hours, Minutes, Seconds)
    MOV R0, R5                  ; R0 = Hours (return value)
    MOV R1, R6                  ; R1 = Minutes (return value)
    MOV R2, R3                  ; R2 = Remaining Seconds (return value)
	

    POP {R3-R12, PC}            ; Restore registers and return
    ENDFUNC


TIM2_INIT	FUNCTION
	PUSH{R0-R12, LR}
	
	;1) Enable timerx from ABP1ENR 
	LDR R0, =RCC_APB1ENR
	LDR R1, [R0]
	ORR R1,R1, #1
	STR R1, [R0]
	
	
	;2) Configure prescaler PSC
    ;  8 MHz system clock: PSC = 8000 - 1 => 1 ms tick
    LDR R0, =TIM2_PSC
    MOV R1, #7999                 ; Prescaler = 7999 (PSC value + 1)
    STR R1, [R0]
	
	;3) Configure auto reload register ARR

    ; To get 1-second interval: ARR = 1000 - 1 (1000 ms = 1 s)
    LDR R0, =TIM2_ARR
    LDR R1, =9000                            ; Auto-Reload Value
    STR R1, [R0]

	;4) Enable timer update interrupt
	LDR R0, =TIM2_DIER
    MOV R1, #1                   ; UIE: Update Interrupt Enable
    STR R1, [R0]
	
	
	;5) Enable timer interrupt iser0
	LDR R0, =NVIC_ISER0
    MOV R1, #(1 << 28)           ; TIM2 Interrupt (IRQ28)
    STR R1, [R0]
	
	
	;6) start the timer (timerx_cr1)
	LDR R0, =TIM2_CR1
    MOV R1, #1                   ; CEN: Counter Enable
    STR R1, [R0]
	
	
	POP{R0-R12, PC}
	ENDFUNC
	
	B skipped3
	LTORG
skipped3
	
DRAWSTOP2 FUNCTION 
	
	PUSH{R0-R12, LR}
    ldr r10, =BLACK
	;R6=MINUTES
	CMP R9,#9
	BLE.W LABEL2_STOP_1
	CMP R9,#19
	BLE.W LABEL2_STOP_2
    CMP R9,#29
	BLE.W LABEL2_STOP_3
	CMP R9,#39
	BLE.W LABEL2_STOP_4
	CMP R9,#49
	BLE.W LABEL2_STOP_5
	CMP R9,#59
	BLE.W LABEL2_STOP_6
	CMP R9,#69
	BLE.W LABEL2_STOP_7
	CMP R9,#79
	BLE.W LABEL2_STOP_8
	CMP R9,#89
	BLE.W LABEL2_STOP_9
	CMP R9,#99
	BLE.W LABEL2_STOP_10
	CMP R9,#109
	BLE.W LABEL2_STOP_11
	CMP R9,#119
	BLE.W LABEL2_STOP_12
	CMP R9,#129
	BLE.W LABEL2_STOP_13
	CMP R9,#139
	BLE.W LABEL2_STOP_14
	CMP R9,#149
	BLE.W LABEL2_STOP_15
	CMP R9,#159
	BLE.W LABEL2_STOP_16
	CMP R9,#169
	BLE.W LABEL2_STOP_17
	CMP R9,#179
	BLE.W LABEL2_STOP_18
	CMP R9,#189
	BLE.W LABEL2_STOP_19
	CMP R9,#199
	BLE.W LABEL2_STOP_20
	CMP R9,#209
	BLE.W LABEL2_STOP_21
	CMP R9,#219
	BLE.W LABEL2_STOP_22
	CMP R9,#229
	BLE.W LABEL2_STOP_23
	CMP R9,#239
	BLE.W LABEL2_STOP_24
	CMP R9,#249
	BLE.W LABEL2_STOP_25
	;CMP R9,#259
	;BLE LABEL2_STOP_26
	;CMP R9,#269
	;BLE LABEL2_STOP_27
	;CMP R9,#279
	;BLE LABEL2_STOP_28
	;CMP R9,#289
	;BLE LABEL2_STOP_29
	;CMP R9,#299
	;BLE LABEL2_STOP_30
	;CMP R9,#309
	;BLE LABEL2_STOP_31
	;CMP R9,#319
	;BLE LABEL2_STOP_32
	;CMP R9,#329
	;BLE LABEL2_STOP_33
	;CMP R9,#339
	;BLE LABEL2_STOP_34
	;CMP R9,#349
	;BLE LABEL2_STOP_35
	;CMP R9,#359
	;BLE LABEL2_STOP_36
	;CMP R9,#369
	;BLE LABEL2_STOP_37
	;CMP R9,#379
	;BLE LABEL2_STOP_38
	;CMP R9,#389
	;BLE LABEL2_STOP_39
	;CMP R9,#399
	;BLE LABEL2_STOP_40
	;CMP R9,#409
	;BLE LABEL2_STOP_41
	;CMP R9,#419
	;BLE LABEL2_STOP_42
	;CMP R9,#429
	;BLE LABEL2_STOP_43
	;CMP R9,#439
	;BLE LABEL2_STOP_44
	;CMP R9,#449
	;BLE LABEL2_STOP_45
	;CMP R9,#459
	;BLE LABEL2_STOP_46
	;CMP R9,#469
	;BLE LABEL2_STOP_47
	;CMP R9,#479
	;BLE LABEL2_STOP_48
	;CMP R9,#489
	;BLE LABEL2_STOP_49
	;CMP R9,#499
	;BLE LABEL2_STOP_50
	;CMP R9,#509
	;BLE LABEL2_STOP_51
	;CMP R9,#519
	;BLE LABEL2_STOP_52
	;CMP R9,#529
	;BLE LABEL2_STOP_53
	;CMP R9,#539
	;BLE LABEL2_STOP_54
	;CMP R9,#549
	;BLE LABEL2_STOP_55
	;CMP R9,#559
	;BLE LABEL2_STOP_56
	;CMP R9,#569
	;BLE LABEL2_STOP_57
	;CMP R9,#579
	;BLE LABEL2_STOP_58
	;CMP R9,#589
	;BLE LABEL2_STOP_59
	;CMP R9,#599
	;BLE LABEL2_STOP_60
	;CMP R9,#609
	;BLE LABEL2_STOP_61
	;CMP R9,#619
	;BLE LABEL2_STOP_62
	;CMP R9,#629
	;BLE LABEL2_STOP_63
	;CMP R9,#639
	;BLE LABEL2_STOP_64
	;CMP R9,#649
	;BLE LABEL2_STOP_65
	;CMP R9,#659
	;BLE LABEL2_STOP_66
	;CMP R9,#669
	;BLE LABEL2_STOP_67
	;CMP R9,#679
	;BLE LABEL2_STOP_68
	;CMP R9,#689
	;BLE LABEL2_STOP_69
	;CMP R9,#699
	;BLE LABEL2_STOP_70
	;CMP R9,#709
	;BLE LABEL2_STOP_71
	;CMP R9,#719
	;BLE LABEL2_STOP_72
	;CMP R9,#729
	;BLE LABEL2_STOP_73
	;CMP R9,#739
	;BLE LABEL2_STOP_74
	;CMP R9,#749
	;BLE LABEL2_STOP_75
	;CMP R9,#759
	;BLE LABEL2_STOP_76
	;CMP R9,#769
	;BLE LABEL2_STOP_77
	;CMP R9,#779
	;BLE LABEL2_STOP_78
	;CMP R9,#789
	;BLE LABEL2_STOP_79
	;CMP R9,#799
	;BLE LABEL2_STOP_80
	;CMP R9,#809
	;BLE LABEL2_STOP_81
	;CMP R9,#819
	;BLE LABEL2_STOP_82
	;CMP R9,#829
	;BLE LABEL2_STOP_83
	;CMP R9,#839
	;BLE LABEL2_STOP_84
	;CMP R9,#849
	;BLE LABEL2_STOP_85
	;CMP R9,#859
	;BLE LABEL2_STOP_86
	;CMP R9,#869
	;BLE LABEL2_STOP_87
	;CMP R9,#879
	;BLE LABEL2_STOP_88
	;CMP R9,#889
	;BLE LABEL2_STOP_89
	;CMP R9,#899
	;BLE LABEL2_STOP_90
	;CMP R9,#909
	;BLE LABEL2_STOP_91
	;CMP R9,#919
	;BLE LABEL2_STOP_92
	;CMP R9,#929
	;BLE LABEL2_STOP_93
	;CMP R9,#939
	;BLE LABEL2_STOP_94
	;CMP R9,#949
	;BLE LABEL2_STOP_95
	;CMP R9,#959
	;BLE LABEL2_STOP_96
	;CMP R9,#969
	;BLE LABEL2_STOP_97
	;CMP R9,#979
	;BLE LABEL2_STOP_98
	;CMP R9,#989
	;BLE LABEL2_STOP_99
	;CMP R9,#999
	;BLE LABEL2_STOP_100
	

LABEL2_STOP_1
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,R9
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_2
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#10
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_3
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#20
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP

LABEL2_STOP_4
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#3
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#30
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_5
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#4
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#40
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_6
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#5
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#50
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP

LABEL2_STOP_7
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#6
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#60
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_8
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#7
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#70
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_9
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#8
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#80
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_10
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#9
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#90
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_11
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#100
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_12
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#110
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_13
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#120
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_14
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#3
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#130
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_15
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#4
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#140
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_16
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#5
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#150
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_17
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#6
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#160
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_18
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#7
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#170
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_19
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#8
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#180
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_20
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#9
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#190
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP

LABEL2_STOP_21
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#200
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_22
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#1
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#210
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_23
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#220
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_24
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#3
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#230
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
LABEL2_STOP_25
	MOV R8,#12
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#0
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#13
	BL TIME_POSITION
	MOV R8,#2
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#14
	BL TIME_POSITION  ;;DA LOW AS8AR
	MOV R8,#4
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	MOV R8,#15
	BL TIME_POSITION  ;;DA LOW AS8AR
	SUBS R8,R9,#240
	LDR R10, =BLACK
	BL DRAWSEC_BCD
	B TARGET2_STOP
	
;LABEL2_STOP_26
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#250
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_27
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#260
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_28
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#270
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_29
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#280
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_30
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#290
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_31
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#300
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_32
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#1
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#310
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_33
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#320
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_34
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#330
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_35
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#340
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_36
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#350
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_37
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#360
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_38
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#370
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_39
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#380
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_40
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#390
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_41
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#400
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_42
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#1
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#410
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_43
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#420
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_44
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#430
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_45
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#440
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_46
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#450
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_47
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#460
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_48
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#470
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_49
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#480
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_50
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#490
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_51
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#500
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_52
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#1
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#510
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_53
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#520
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_54
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#530
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_55
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#540
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_56
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#550
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_57
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#560
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_58
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#570
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_59
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#580
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_60
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#590
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_61
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#600
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_62
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#1
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#610
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_63
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#620
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_64
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#630
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_65
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#640
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_66
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#650
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_67
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#660
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_68
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#670
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_69
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#680
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_70
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#690
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_71
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#700
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_72
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#1
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#710
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_73
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#720
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_74
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#730
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_75
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#740
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_76
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#750
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_77
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#760
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_78
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#770
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_79
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#780
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;LABEL2_STOP_80
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#790
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_81
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#800
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_82
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#1
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#810
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_83
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#820
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_84
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#830
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_85
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#840
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_86
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#850
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_87
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#860
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_88
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#870
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_89
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#880
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_90
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#890
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_91
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#900
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_92
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#1
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#910
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_93
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#2
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#920
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_94
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#3
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#930
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_95
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#4
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#940
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_96
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#5
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#950
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_97
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#6
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#960
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_98
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#7
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#970
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_99
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#8
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#980
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
;	
;LABEL2_STOP_100
;	MOV R8,#12
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#0
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#13
;	BL TIME_POSITION
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#14
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	MOV R8,#9
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	MOV R8,#15
;	BL TIME_POSITION  ;;DA LOW AS8AR
;	SUBS R8,R9,#990
;	LDR R10, =BLACK
;	BL DRAW_BCD
;	B TARGET2_STOP
	
TARGET2_STOP
    POP{R0-R12, PC}
	ENDFUNC

	END
		
	;LTORG