IF EXIST "amadeus.zip" (
	echo "zip found"
) ELSE (
	powershell -Command "Invoke-WebRequest https://bitbucket.org/amadeusweb/amadeus/get/master.zip -OutFile amadeus.zip"
)

IF EXIST "localhost\amadeus" (
	echo "localhost folder found"
) ELSE (
	cd localhost
	tar -zxvf "..\amadeus.zip"
	for /d %D IN ("yieldmore-amadeus*") do ren "%D" "amadeus"
	echo "localhost folder extracted"
)
pause
