pushd .\src
if /i [%1] == [clean] (
  call %VS_DIR%\VC\Tools\MSVC\14.22.27905\bin\Hostx64\x64\nmake -f Make_mvc.mak clean
) else (
  call %VS_DIR%\VC\Tools\MSVC\14.22.27905\bin\Hostx64\x64\nmake -f Make_mvc.mak
)
popd
