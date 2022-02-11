IF EXIST "localhost" (
	echo "folder exists"
) ELSE (
	md localhost
	echo "folder created"
)
pause
