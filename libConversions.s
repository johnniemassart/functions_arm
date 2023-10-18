#Program Name: libConversions.s
#Author: Johnnie Massart
#Date: 10/17/2023
#Purpose: implement, store functions to be used in programs
.global m2k
.global kph
.global c2f
.global i2f

.text
m2k:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#m2k
	MOV r1, #161
	MUL r0, r8, r1
	MOV r1, #100
	BL __aeabi_idiv

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#end m2k function

.text
kph:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#kph
	BL m2k
	MOV r1, r4
	BL __aeabi_idiv

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#end kph function

.text
c2f:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#1. multiply by 9
	MOV r1, #9
	MUL r0, r0, r1

	#2. divide 5
	MOV r1, #5
	BL __aeabi_idiv

	#3. add 32
	MOV r1, #32
	ADD r0, r0, r1

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#end c2f function

.text
i2f:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#1. feet conversion
	MOV r1, #12
	BL __aeabi_idiv
	MOV r4, r0

	#2. inches conversion
	#load total inches
	#LDR r5, r9
	#LDR r5, [r5, #0]
	#feet conversion
	MUL r6, r1, r4

	#remaining inches
	SUB r2, r9, r6
	#total feet
	#MOV r1, r4

	#pop the stack
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr
.data

#end i2f function
