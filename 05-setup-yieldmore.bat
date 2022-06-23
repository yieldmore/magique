IF EXIST "yieldmore_www.zip" (
	echo "zip found"
) ELSE (
	powershell -Command "Invoke-WebRequest https://bitbucket.org/amadeus/yieldmore/get/master.zip -OutFile yieldmore.zip"
)

IF EXIST "localhost\yieldmore" (
	echo "localhost folder found"
	GOTO :before_pause
)

cd localhost

IF EXIST "yieldmore" (
	echo "yieldmore folder exists"
	GOTO :in_ym
) ELSE (
	md yieldmore
	echo "yieldmore folder created"
)

:in_ym
tar -zxvf "..\..\yieldmore_www.zip"
REM TODO: FIX BUG!
for /d %D IN ("yieldmore*") do ren "%D" "yieldmore"
echo "localhost yieldmore folder extracted"

:before_pause
pause
