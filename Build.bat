@echo off
setlocal
cd /d "%~dp0"

rem Rust installed with rustup normally lives here, even if PATH is outdated.
if exist "%USERPROFILE%\.cargo\bin\cargo.exe" set "PATH=%USERPROFILE%\.cargo\bin;%PATH%"
where cargo >nul 2>&1
if errorlevel 1 (
    echo Cargo was not found. Install Rust from https://rustup.rs/ and try again.
    pause
    exit /b 1
)

echo Building gitcraft in release mode...
call cargo build --release --locked
if errorlevel 1 (
    echo.
    echo Build failed. See the errors above.
    pause
    exit /b 1
)

echo.
echo Build successful: %~dp0target\release\gitcraft.exe
pause
exit /b 0
