@echo off
gcc "test\ssptest.c" "src\ssp.c" "src\structures.c" -o "test\ssptest.exe"
"test\ssptest.exe"
del "test\ssptest.exe"