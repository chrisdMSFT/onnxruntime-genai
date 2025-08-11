SET WCR_COMMIT=41710537648a3f88fd292e2371b0a50c7caf9674

pushd ..\wcr
git fetch --all
git show %WCR_COMMIT%:dependencies/Ort/CMakeLists.txt | findstr VERSION
popd
