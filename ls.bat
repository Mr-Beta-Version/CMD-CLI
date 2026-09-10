@echo off
for /f "delims=" %%F in ('dir /b') do <nul set /p "=%%F  "
echo.
