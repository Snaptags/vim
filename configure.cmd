@echo off

:: Visual Studio directory. Quotation marks, no trailing backslash.
set VS_DIR="c:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools"

:: Target architecture, AMD64 (64-bit) or I386 (32-bit)
set CPU=AMD64

:: Toolchain, x86_amd64 (cross-compile 64-bit) or x86 (32-bit) or amd64 (64-bit)
set TOOLCHAIN=amd64

:: TINY, SMALL, NORMAL, BIG or HUGE. NORMAL or above recommended
set FEATURES=HUGE

:: yes for gVim, no for vim
set GUI=yes

:: Enable Terminal support
set TERMINAL=yes

set OLE=yes
set IME=yes

:: IDE integrations we don't need
set NETBEANS=no
set CSCOPE=no

:: UTF-8 encoding
set MBYTE=yes

:: Enable Python scripting
::set DYNAMIC_PYTHON=yes
::set PYTHON=C:\Python27
::set PYTHON_VER=27

set DYNAMIC_PYTHON3=yes
set PYTHON3=c:\Python38
set PYTHON3_VER=38

:: Enable Perl scripting
:: set DYNAMIC_PERL=yes
:: set PERL=c:\Strawberry\524\perl
:: set PERL_VER=524

echo "Updating version numbers from git..."
call c:\Python38\python.exe .\tools\UpdateVersionByGitTag.py -i .\src\version.h
echo "Configuring Visual Studio..."
call %VS_DIR%\VC\Auxiliary\Build\vcvarsall.bat %TOOLCHAIN%
