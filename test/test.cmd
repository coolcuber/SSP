@echo off
gcc ssptest.c "..\src\ssp.c" "..\src\structures.c" -o ssptest.exe
ssptest.exe
del ssptest.exe