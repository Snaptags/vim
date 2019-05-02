pushd .\src
if /i [%1] == [clean] (
  call %VS_DIR%\VC\Tools\MSVC\14.20.27508\bin\Hostx86\x86\nmake -f Make_mvc.mak clean
) else (
  call %VS_DIR%\VC\Tools\MSVC\14.20.27508\bin\Hostx86\x86\nmake -f Make_mvc.mak
)
popd
