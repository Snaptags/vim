pushd .\src
if /i [%1] == [clean] (
  call %VS_DIR%\VC\Tools\MSVC\14.10.25017\bin\HostX64\x64\nmake -f Make_mvc.mak clean

) else (
  pushd .\libvterm
  call %VS_DIR%\VC\Tools\MSVC\14.10.25017\bin\HostX64\x64\nmake -f Makefile.msc
  pushd ..\
  call %VS_DIR%\VC\Tools\MSVC\14.10.25017\bin\HostX64\x64\nmake -f Make_mvc.mak
)
popd
