@echo off
cmd /C "test\test"
gcc "src\ssp.c" "src\structures.c" "src\main.c" -o ssp.exe
echo Build complete