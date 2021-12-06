@echo off
 
setlocal

set TP=..
set INCLUDE=%TP%\externals\win32\include\

set CC_OPTS=-isystem %INCLUDE%
set CC_OPTS=%CC_OPTS% -isystem %INCLUDE%\crtl
set CC_OPTS=%CC_OPTS% -isystem %INCLUDE%\windows
set CC_OPTS=%CC_OPTS% -isystem %INCLUDE%\dinkumware64

set OPTS=-cc1 -w %CC_OPTS% -fborland-extensions -nobuiltininc -nostdsysteminc -triple x86_64-pc-win32-elf -x c++ -std=c++11 -fsyntax-only -fno-spell-checking

CppLibTransform.exe %OPTS% %1 %2 %3 %4 %5 %6 %7 %8 %9 
