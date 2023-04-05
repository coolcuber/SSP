@echo off
cd test
cmd /C "test/test"
cd ..
gcc "src\ssp.c" "src\structures.c" "src\main.c" -o ssp.exe
echo Build complete