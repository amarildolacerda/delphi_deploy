@echo off
call %5\rsvars.bat
@echo off
SET ProjectPath=%1
SET Config=%2
SET Platform=%3
SET Targets=%4

msbuild "%ProjectPath%" /nologo /v:n /clp:NoItemAndPropertyList /t:%Targets% /p:Config=%Config% /p:Platform=%Platform% 


