@echo off

echo.
echo.
echo Build
cmake --preset windows_x64_directml_relwithdebinfo -DUSE_WINML=ON
cmake --build --preset windows_x64_directml_relwithdebinfo --parallel

echo.
echo.
echo Test
build\directml\win-x64\RelWithDebInfo\unit_tests.exe
