#!/bin/bash
# Simple server start script for WSL/Linux

echo "AI Lab Contact Server - Simple Start"
echo "===================================="
echo

# Check if we're in the right directory
if [ ! -f "server.js" ]; then
    echo "ERROR: server.js not found in current directory"
    echo "Please run this script from the project root directory"
    exit 1
fi

if [ ! -f "package.json" ]; then
    echo "ERROR: package.json not found"
    echo "Please run this script from the project root directory"
    exit 1
fi

echo "Current directory: $(pwd)"
echo "Node version: $(node --version)"
echo "NPM version: $(npm --version)"
echo

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install dependencies"
        exit 1
    fi
    echo
fi

echo "Starting server..."
echo "You can access the website at: http://localhost:3000"
echo "Press Ctrl+C to stop the server"
echo

node server.js
