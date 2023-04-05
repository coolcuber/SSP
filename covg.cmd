@echo off
cd Coverage
gcc --coverage "..\main.c" "..\ssp.c" "..\structures.c" -c
gcc --coverage main.o ssp.o structures.o -o sspcoverage.exe
sspcoverage.exe "..\input.txt"
gcov main.o ssp.o structures.o -m
cmd /C "npp main.c.gcov ssp.c.gcov structures.c.gcov"
cd ..\