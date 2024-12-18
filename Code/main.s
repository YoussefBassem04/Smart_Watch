	AREA mydata, DATA, READONLY

INTERVAL EQU 0x186004		;just a number to perform the delay. this number takes roughly 1 second to decrement until it reaches 0
INITIAL_TIME EQU 0X6270 ; 7 pm

BIT_MASK EQU 0x333333

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
	
	
;--------------- Port Enabler -----------;
RCC_APB2ENR EQU RCC_BASE + 0X18
RCC_APB1ENR EQU RCC_BASE + 0x1C
RCC_BDCR	EQU RCC_BASE + 0x20

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




    AREA mycode, CODE, READONLY
    EXPORT __main

	
        
__main FUNCTION
	bl GPIO_ENABLE_PORT_A
	bl GPIO_ENABLE_PORT_C
	;
	
	; A0-A5 OUTPUT
	ldr r0, =GPIOA_CRL
	ldr r1,=BIT_MASK
	str r1,[r0]
	
	bl EXTI_B12_INIT
	MOV R7,#7
	MOV R8,#0
	ADD R8,R7,#3
	bl RTC_INIT
              
	
	
superloop
	;bl GetTimeFromRTC
	;r0 = hours r1 = min ,r2 = sec
	; Step 1: Read RTC Counter Value
    LDR R0, =RTC_CNTH           ; Load upper 16 bits of counter
    LDR R1, [R0]
    LSL R1, R1, #16             ; Shift to upper position
	
    LDR R0, =RTC_CNTL           ; Load lower 16 bits of counter
    LDR R2, [R0]
    ORR R3, R1, R2              ; Combine to get full counter value (R3)
	
    ; Step 2: Display Lower 5 Bits on PA0–PA4
    AND R4, R3, #0x1F           ; Mask lower 5 bits of counter
    LDR R0, =GPIOA_ODR          ; Load GPIOA output data register
    LDR R1, [R0]
    BIC R1, R1, #0x1F           ; Clear PA0–PA4 (lower 5 bits)
    ORR R1, R1, R4              ; Set PA0–PA4 with the counter value
    STR R1, [R0]                ; Write back to GPIOA_ODR
	
	CMP R3,R7
	BNE LABEL
	
	
	
	ORR R1, R1, #(1 << 5)
	STR R1, [R0]
	
	
	
	
LABEL
	CMP R3,R8
	BNE superloop
	
	BIC R1, R1, #(1 << 5)
	STR R1, [R0]
	b superloop



;====================Delays====================;
delay_1_second
    ; Delay for 1 second
    PUSH {R8, LR}
    LDR r8, =INTERVAL
delay_loop
    SUBS r8, r8, #1
    CMP r8, #0
    BGE delay_loop
    POP {R8, PC}


delay_half_second
    ; Delay for half a second
    PUSH {R8, LR}
    LDR r8, =INTERVAL
    LSR r8, r8, #1  ; Divide interval by 2 for half-second
delay_loop1
    SUBS r8, r8, #1
    CMP r8, #0
    BGE delay_loop1
    POP {R8, PC}
	
	
delay_milli_second
	;this function just delays for a millisecond
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop2
	SUBS r8, #1000
	CMP r8, #0
	BGE delay_loop2
	POP {R8, PC}
	
	
delay_10_milli_second
	;this function just delays for 10 millisecondS
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop3
	SUBS r8, #100
	CMP r8, #0
	BGE delay_loop3

	POP {R8, PC}
;========================================;
    ENDFUNC
	



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
EXTI_B12_INIT	FUNCTION
	PUSH{R0-R12, LR}
	LDR R0, =RCC_APB2ENR        ; RCC_APB2ENR address
    LDR R1, [R0]                ; Read current value
    ORR R1, R1, #(1 << 0)       ; Enable AFIO clock
    STR R1, [R0]                ; Write back

	;Configure PB12 as Input (Floating/Default Pull-Down)
    LDR R0, =GPIOB_CRH
    LDR R1, [R0]
    BIC R1, R1, #(0xF << 16)   ; Clear bits 16-19 for PB14
    ORR R1, R1, #(0x4 << 16)   ; Set PB12 as Input
    STR R1, [R0]

	;Map B12 to exti12
	LDR R0, =AFIO_EXTICR4
	LDR R1, [R0]
	BIC R1,R1, #(0XF << 0)
	ORR R1, R1, #(0X1 <<0)
	STR R1, [R0]
	
	; Enable EXTI Line 12 Interrupt
	LDR R0, =EXTI_IMR           ; EXTI_IMR address
    LDR R1, [R0] 
	ORR R1, R1, #(1 << 12)
	STR R1, [R0]
	
	;Configure Rising Trigger
	LDR R0, =EXTI_RTSR
	LDR R1, [R0]
	ORR R1, R1, #(1 <<12)
	STR R1, [R0]
	
	;Disable falling edge
	LDR R0, =EXTI_FTSR
	LDR R1, [R0]
	BIC R1, R1, #(1 << 12)
	STR R1, [R0]
	
	; Enable EXTI12 interrupt in NVIC
	LDR R0, =NVIC_ISER1
	LDR R1, [R0]
	ORR R1, R1, #(1 << 8)
	STR R1, [R0]
	
	POP{R0-R12, PC}
	ENDFUNC
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
	
	;3) Set LSEON bit 0 in RCC_BDCR
	ldr r0, =RCC_BDCR
	ldr r1, [r0]
	orr r1,r1,#1
	str r1, [r0]
	
	;4) Poll until LSERDY bit 1 in RCC_BDCR is set 1
Poll_LSE_Loop
	mov r2, r1
	and r2,r2, #(1<<1)
	
	cmp r2,#0
	beq Poll_LSE_Loop
	
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
	beq Poll_RTOFF_Loop

Poll_RSF_Loop
	ldr r0, =RTC_CRL
	ldr r1, [r0]
	
	and r1, r1, #(1 << 3)
	cmp r1, #0
	beq Poll_RSF_Loop
	
	;8) Set the CNF bit 4 RTC_CRL
	ldr r1, [r0]
	orr r1,r1, #(1 << 4)
	str r1, [r0]
	
	;9) write 7FFFh in RTC_PRLL
	ldr r0, =RTC_PRLL
	mov r1, #0x7FFF
	str r1, [r0]
	
	; Set Counter reg to 7 pm
	;ldr, r0, =RTC_CNTL
	;ldr r1, =INITIAL_TIME
	;str r1, [r0]
	
	;10) Clear the CNF bit 4 RTC_CRL to exit configuration mode
	ldr r0, =RTC_CRL
	ldr r1, [r0]
	
	bic r1, r1, #(1 << 4)
	str r1, [r0]
	
	
	
	POP{R0-R12, PC}
	ENDFUNC
	

ADC_INIT FUNCTION
	PUSH{R0-R12, LR}
	
	;1) Enable the ADC clock
	ldr r0, =RCC_APB2ENR
	ldr r1, [r0]
	
	orr r1,r1, #(1 << 9)
	str r1, [r0]
	
	;2) Set the GPIO pin connected to the ADC channel (e.g., PA1) to Analog input Mode
	ldr r0, =GPIOA_CRL
	ldr r1, [r0]
	
	bic r1, r1, #(0xf << 4)
	str r1, [r0]
	
	;3) Set the ADC sampling time
	ldr r0, =ADC1_SMPR2
	ldr r1, [r0]
	
	orr r1, r1, #(7 << 3)
	str r1, [r0]
	
	;4) Configure the ADC conversion sequence
	ldr r0, =ADC_SQR3
	mov r1, #1
	
	str r1, [r0]
	
	;5) Enable the End of Conversion (EOC) interrupt
	LDR R0, =ADC1_CR1
	LDR R1, [R0]
	ORR R1, R1, #(1 << 5)      ; EOCIE: Enable End of Conversion interrupt
	STR R1, [R0]
	
	;6) Enable the ADC
	LDR R0, =ADC1_CR2
	LDR R1, [R0]
	ORR R1, R1, #1             ; ADON: Enable ADC
	STR R1, [R0]

	;7) Start the ADC conversion 
	ORR R1, R1, #(1 << 22)     ; SWSTART: Start Conversion
	STR R1, [R0]
	
	;8) Enable the ADC interrupt
	ldr r0, =NVIC_ISER0
	MOV R1, #(1 << 18)         ; ADC1 IRQ = 18
	STR R1, [R0]
	
	
	POP{R0-R12, PC}
	ENDFUNC


ConvertTimeToSec FUNCTION
	PUSH {R4-R12, LR}
	;R4 = Hours R5 = min R6 = sec
	;R7 = R4 * 3600 + r5 * 60 + r6
	
	mov r8, #3600
	mul r4, r4, r8
	
	mov r9, #60
	mul r5, r5, r9
	
	add r7, r4,r5
	add r0, r7,r6
	
	
	
	POP {R4-R12, PC}
	ENDFUNC
	
GetTimeFromRTC FUNCTION
    PUSH {R4-R12, LR}           ; Save non-volatile registers and link register

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

    POP {R4-R12, PC}            ; Restore registers and return
    ENDFUNC

	
	
	
	
	
	
	
	
	
	
	
	
    END    