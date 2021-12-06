@echo off

:: ----------------------------------------------------------------------------
:: Batch file to run SdkTransfrom.exe
:: Set paths to llvm\tools\clang(%CLANG%), sdk(%SDK_ROOT%)
@REM Usage:
:: runTransform [osx] --out:<dir> - run debug version of SdkTransform.exe for iOS(default)/OSX platform,
:: save pas files in the folder dir.
:: ----------------------------------------------------------------------------
 
setlocal

:: IOS is platform "by default"
set PLATFORM=IOS
if [%1] == [osx] (
  set PLATFORM=OSX
  shift /1
)

set DBG_MODE=
if [%1] == [debug] (
  set DBG_MODE=Y
  shift /1
)

set CLANG=c:\clang3.5\llvm\tools\clang

if [%PLATFORM%]==[IOS] goto IOS_OPTS
if [%PLATFORM%]==[OSX] goto OSX_OPTS

::-------------------------------------------------------------
::  IOS options
::-------------------------------------------------------------
:IOS_OPTS

set SDK_ROOT=c:\SDKs\iPhoneOS8.3.sdk

set INCLUDE=%SDK_ROOT%\usr\include
set FRAMEWORK=%SDK_ROOT%\System\Library\Frameworks

set CC_OPTS=%CC_OPTS% -D TARGET_OS_IPHONE
set CC_OPTS=%CC_OPTS% -isysroot "%SDK_ROOT%"
set CC_OPTS=%CC_OPTS% -isystem "%INCLUDE%"
set CC_OPTS=%CC_OPTS% -isystem "%CLANG%"\lib\Headers\
set CC_OPTS=%CC_OPTS% -F "%FRAMEWORK%"
set CC_OPTS=%CC_OPTS% -triple thumbv7-apple-ios
goto COMPILE  

::-------------------------------------------------------------
::  osx options
::-------------------------------------------------------------
:OSX_OPTS
set SDK_ROOT=c:\SDKs\MacOSX10.10.3.sdk

set INCLUDE=%SDK_ROOT%\usr\include
set FRAMEWORK=%SDK_ROOT%\System\Library\Frameworks

set CC_OPTS=%CC_OPTS% --macsdk
set CC_OPTS=%CC_OPTS% -D TARGET_OS_MAC
set CC_OPTS=%CC_OPTS% -isysroot "%SDK_ROOT%"
set CC_OPTS=%CC_OPTS% -isystem "%INCLUDE%"
set CC_OPTS=%CC_OPTS% -isystem "%CLANG%"\lib\Headers\
set CC_OPTS=%CC_OPTS% -F "%FRAMEWORK%"
set CC_OPTS=%CC_OPTS% -triple x86_64-apple-macosx-clang++
goto COMPILE

:COMPILE
set OPTS=-cc1 -g -w %CC_OPTS% -fdiagnostics-show-option -fexceptions -fobjc-exceptions -x objective-c -std=gnu99 -nobuiltininc -nostdinc++ -nostdsysteminc -fblocks
echo Platform = %PLATFORM%
SdkTransform.exe %OPTS% --fmt %1 %2 %3 %4 %5 %6 %7 %8 %9
