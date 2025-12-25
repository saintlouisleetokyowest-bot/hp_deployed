#!/bin/bash
# Node.js Installation Script for Ubuntu/Debian

echo "🚀 Installing Node.js and npm..."
echo "================================="

# Check if running as root or with sudo
if [[ $EUID -eq 0 ]]; then
    echo "❌ Please do not run this script as root. Use sudo for individual commands if needed."
    exit 1
fi

# Update package list
echo "📦 Updating package list..."
sudo apt update

# Install Node.js and npm
echo "⬇️ Installing Node.js and npm..."
sudo apt install -y nodejs npm

# Verify installation
echo ""
echo "✅ Installation completed!"
echo "Node.js version: $(node --version)"
echo "NPM version: $(npm --version)"

# Test the server
echo ""
echo "🧪 Testing server startup..."
if [ -f "server.js" ]; then
    echo "Starting server..."
    timeout 5s node server.js &
    SERVER_PID=$!
    sleep 2

    # Check if server is running
    if kill -0 $SERVER_PID 2>/dev/null; then
        echo "✅ Server started successfully!"
        echo "🌐 Access your website at: http://localhost:3000"
        kill $SERVER_PID
    else
        echo "❌ Server failed to start"
        exit 1
    fi
else
    echo "❌ server.js not found in current directory"
    exit 1
fi

echo ""
echo "🎉 Setup complete! You can now run 'node server.js' to start your server."
