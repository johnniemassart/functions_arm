#Program Name: CToF.s
#Author: Johnnie Massart
#Date: 10/17/2023
#Purpose: Convert celsius to fahrenheit
.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#ask prompt
	LDR r0, =prompt
	BL printf

	#scan input
	LDR r0, =formatCelsius
	LDR r1, =celsius
	BL scanf

	#store input value
	LDR r0, =celsius
	LDR r0, [r0]

	#call c2f function
	BL c2f
	MOV r1, r0

	#ouput conversion
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter the temperature in Celcius: "
	celsius: .word 0
	formatCelsius: .asciz "%d"
	output: .asciz "The temperature in Fahrenheit: %d\n"
