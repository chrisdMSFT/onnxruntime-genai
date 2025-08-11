echo.
echo.
set ARCH=x64
set SRC=C:\local\sources\WCR\__dependencies\win-onnxruntime-sdk

set FLAVOR=Release
set FLAVOR=Release

echo Download ORT Artifacts - %ARCH% from %SRC%

mkdir ort\include

copy ..\WCR\build_x64\include\wcr_headers\*.h ort\include
copy ..\WCR\__dependencies\win-onnxruntime-sdk\include\onnxruntime\core\providers\dml\*.h ort\include

@rem copy %SRC%\include\onnxruntime\core\session\*.h ort\include

mkdir ort\lib
copy %SRC%\lib\%ARCH%\%FLAVOR%\onnxruntime.* ort\lib
copy %SRC%\bin\%ARCH%\%FLAVOR%\onnxruntime.* ort\lib
