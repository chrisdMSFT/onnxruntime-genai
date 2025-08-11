@echo off

echo.
echo.
echo Build
cmake --preset windows_arm64_directml_relwithdebinfo
cmake --build --preset windows_arm64_directml_relwithdebinfo --parallel

echo.
echo.
echo Test
build\directml\win-arm64\RelWithDebInfo\unit_tests.exe
