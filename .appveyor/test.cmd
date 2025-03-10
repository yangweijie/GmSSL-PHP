@echo off

setlocal enableextensions enabledelayedexpansion
	set SDK_RUNNER=%PHP_BUILD_CACHE_SDK_DIR%\phpsdk-%PHP_BUILD_CRT%-%ARCHITECTURE%.bat
	if not exist "!SDK_RUNNER!" (
		echo "!SDK_RUNNER!" doesn't exist
		exit /b 3
	)

	cmd /c !SDK_RUNNER! -t %APPVEYOR_BUILD_FOLDER%\.appveyor\test_task.cmd

	if %errorlevel% neq 0 exit /b 3
endlocal

exit /b 0