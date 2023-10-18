#Program Name: Makefile.s
#Author: Johnnie Massart
#Date: 10/17/2023
#Purpose: make files
ALL: kph CToF InchesToFt
LIB=libConversions.o
CC=gcc

kph: kph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

CToF: CToF.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

InchesToFt: InchesToFt.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
