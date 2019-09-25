pushd .\src
if /i [%1] == [clean] (
  call nmake -f Make_mvc.mak clean
) else (
  call nmake -f Make_mvc.mak
)
popd
