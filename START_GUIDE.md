# 🚀 Quick Start Guide

## Node.js Installation Required ⚠️

First, you need to install Node.js. Here's how:

### For Ubuntu/Debian (apt):
```bash
# Update package list
sudo apt update

# Install Node.js and npm
sudo apt install -y nodejs npm

# Verify installation
node --version
npm --version
```

### For macOS (brew):
```bash
# Install Homebrew if not installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Node.js
brew install node

# Verify installation
node --version
npm --version
```

### For other systems:
Download from: https://nodejs.org/

## Quick Fix

### ✅ Simplest Method (After Node.js Installation)
```bash
# Just run this command in any terminal
node server.js
```

### Alternative Methods

**For Windows users:**
```bash
# Double-click this file in Windows Explorer
start-simple.bat
```

**For Linux/WSL users:**
```bash
# Make executable and run
chmod +x start-simple.sh
./start-simple.sh
```

**Using npm (after installation):**
```bash
npm start
```

## Verify It's Working
Once server starts, open browser to:
- http://localhost:3000 (main page)
- http://localhost:3000/contact.html (contact form)

You should see the AI Lab website with working contact form!

## What Was Fixed
- Added path validation in server.js
- Created simple start scripts that avoid npm path issues
- Direct node command bypasses UNC path problems
