#Program Name: kph.s
#Author: Johnnie Massart
#Date: 10/17/2023
#Purpose: convert miles, hours to kph
.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#user miles prompt
	LDR r0, =prompt1
	BL printf

	#scan user miles input
	LDR r0, =formatHours
	LDR r1, =hours
	BL scanf

	#store user miles input
	LDR r0, =hours
	LDR r8, [r0]

	#user hours prompt
	LDR r0, =prompt2
	BL printf

	#scan user hours input
	LDR r0, =formatMiles
	LDR r1, =miles
	BL scanf

	#store user hours input
	LDR r0, =miles
	LDR r4, [r0]

	#call kph function
	BL kph
	MOV r1, r0

	#output conversion
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt1: .asciz "Enter hours: "
	prompt2: .asciz "Enter miles: "
	formatMiles: .asciz "%d"
	formatHours: .asciz "%d"
	miles: .word 0
	hours: .word 0
	output: .asciz "The conversion to kilometers per hour is: %d\n"
