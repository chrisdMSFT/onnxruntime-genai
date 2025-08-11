echo.
echo.

set ORT_VERSION=1.22.25-202505042111

call az artifacts universal download --organization "https://dev.azure.com/WSSI/" --project "ba6740df-1998-4493-842b-c1830f6544e2" --scope project --feed "WCR" --name "win-onnxruntime-sdk" --version %ORT_VERSION% --path __ORT_ROOT

set ARCH=ARM64X
set SRC=__ORT_ROOT

set FLAVOR=Debug
set FLAVOR=Release

echo Download ORT Artifacts - %ARCH% from %SRC%

mkdir ort\include
copy %SRC%\include\onnxruntime\core\session\*.h ort\include
copy %SRC%\include\onnxruntime\core\providers\dml\*.h ort\include

mkdir ort\lib
copy %SRC%\lib\%ARCH%\%FLAVOR%\onnxruntime.* ort\lib
copy %SRC%\bin\%ARCH%\%FLAVOR%\onnxruntime.* ort\lib
