	AREA mydata, DATA, READONLY

INTERVAL EQU 0x186004		;just a number to perform the delay. this number takes roughly 1 second to decrement until it reaches 0



;--------------- Base Addresses -----------;
RCC_BASE 	EQU 0X40021000
GPIOA_BASE  EQU 0X40010800
GPIOB_BASE  EQU 0X40010C00
GPIOC_BASE  EQU 0X40011000

;--------------- Port Enabler -----------;
RCC_APB2ENR EQU RCC_BASE + 0X18

;--------------- Pin Config -----------;
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




    AREA mycode, CODE, READONLY
    EXPORT __main
    
        
__main FUNCTION
    
	;Enable Port A clock
    bl GPIO_ENABLE_PORT_A
    
    ; Configure GPIOA Pin 0 as output, max speed 50 MHz, push-pull
    ldr r0, =GPIOA_CRL
    ldr r1, [r0]
    bic r1, r1, #0x0000000F ; Clear bits 0–3 for pin 0
    orr r1, r1, #0x00000003 ; Set bits 0–3 (Mode = 0b11, CNF = 0b00)
    str r1, [r0]
    
	;blink led
SuperLoop ;while(true) 
    ; Set GPIOA Pin 0 output high
    ldr r0, =GPIOA_ODR
    ldr r1, [r0]
    orr r1, r1, #0x01  ; Set bit 0
    str r1, [r0]
	
	bl delay_half_second
	
	; Set GPIOA Pin 0 output low
    ldr r0, =GPIOA_ODR
    ldr r1, [r0]
    bic r1, r1, #0x01  ; Clear bit 0
    str r1, [r0]
	
	bl delay_half_second
	
	b SuperLoop





















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


    END    