@echo off
REM Simple server start script that avoids UNC path issues

echo AI Lab Contact Server - Simple Start
echo ===================================
echo.

REM Check if we're in the right directory
if not exist "server.js" (
    echo ERROR: server.js not found in current directory
    echo Please run this script from the project root directory
    pause
    exit /b 1
)

if not exist "package.json" (
    echo ERROR: package.json not found
    echo Please run this script from the project root directory
    pause
    exit /b 1
)

echo Current directory: %cd%
echo Node version: & node --version
echo NPM version: & npm --version
echo.

REM Check if node_modules exists
if not exist "node_modules" (
    echo Installing dependencies...
    npm install
    if errorlevel 1 (
        echo ERROR: Failed to install dependencies
        pause
        exit /b 1
    )
    echo.
)

echo Starting server...
echo You can access the website at: http://localhost:3000
echo Press Ctrl+C to stop the server
echo.

node server.js
