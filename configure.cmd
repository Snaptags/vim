@echo off

:: Windows SDK Include directory. No quotation marks.
set SDK_INCLUDE_DIR=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1\Include

:: Visual Studio directory. Quotation marks, no trailing backslash.
set VS_DIR="c:\Program Files (x86)\Microsoft Visual Studio\2017\Professional"

:: Target architecture, AMD64 (64-bit) or I386 (32-bit)
set CPU=AMD64

:: Toolchain, x86_amd64 (cross-compile 64-bit) or x86 (32-bit) or amd64 (64-bit)
set TOOLCHAIN=amd64

:: TINY, SMALL, NORMAL, BIG or HUGE. NORMAL or above recommended
set FEATURES=HUGE

:: yes for gVim, no for vim
set GUI=yes

set OLE=yes
set IME=yes

:: IDE integrations we don't need
set NETBEANS=no
set CSCOPE=no

:: UTF-8 encoding
set MBYTE=yes

:: Enable Python scripting
set DYNAMIC_PYTHON=yes
set PYTHON=C:\Python27
set PYTHON_VER=27

::set DYNAMIC_PYTHON3=yes
::set PYTHON3=c:\Users\LaM\AppData\Local\Programs\Python\Python36-32\ 
::set PYTHON3_VER=36

:: Enable Perl scripting
set DYNAMIC_PERL=yes
set PERL=c:\Strawberry\perl
set PERL_VER=524

echo "Updating version numbers from git..."
call .\tools\UpdateVersionByGitTag.py -i .\src\version.h
echo "Configuring Visual Studio..."
call %VS_DIR%\VC\Auxiliary\Build\vcvarsall.bat %TOOLCHAIN%

