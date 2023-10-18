#Program Name: InchesToFt.s
#Author Johnnie Massart
#Date: 10/17/2023
#Purpose: Convert inches to feet, inches
.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#user prompt
	LDR r0, =prompt
	BL printf

	#scan user input
	LDR r0, =formatInches
	LDR r1, =inches
	BL scanf

	#store user response, r0 and r9
	LDR r0, =inches
	LDR r0, [r0, #0]
	LDR r9, =inches
	LDR r9, [r9, #0]

	#call i2f function
	BL i2f
	MOV r1, r0

	#output conversion
	LDR r0, =output
	BL printf	

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter inches: "
	formatInches: .asciz "%d"
	inches: .word 0
	output: .asciz "Feet: %d, Inches: %d\n"
