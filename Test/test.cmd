@echo off
gcc ssptest.c "..\ssp.c" "..\structures.c" -o ssptest.exe
ssptest.exe