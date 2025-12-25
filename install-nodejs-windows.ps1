# Node.js Installation Script for Windows PowerShell

Write-Host "🚀 Installing Node.js for Windows..." -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Green

# Check if Node.js is already installed
try {
    $nodeVersion = node --version 2>$null
    Write-Host "✅ Node.js is already installed: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "⬇️ Node.js not found. Please install Node.js manually:" -ForegroundColor Yellow
    Write-Host "1. Visit: https://nodejs.org/" -ForegroundColor Cyan
    Write-Host "2. Download the LTS version for Windows" -ForegroundColor Cyan
    Write-Host "3. Run the installer" -ForegroundColor Cyan
    Write-Host "4. Restart your terminal and run this script again" -ForegroundColor Cyan
    exit 1
}

# Check npm
try {
    $npmVersion = npm --version 2>$null
    Write-Host "✅ NPM is available: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ NPM not found" -ForegroundColor Red
    exit 1
}

# Test the server
Write-Host ""
Write-Host "🧪 Testing server startup..." -ForegroundColor Yellow

if (Test-Path "server.js") {
    Write-Host "Starting server..." -ForegroundColor Cyan

    try {
        # Start server in background and wait a bit
        $job = Start-Job -ScriptBlock { node server.js } -Name "NodeServer"

        Start-Sleep -Seconds 3

        # Check if job is still running
        if ($job.State -eq "Running") {
            Write-Host "✅ Server started successfully!" -ForegroundColor Green
            Write-Host "🌐 Access your website at: http://localhost:3000" -ForegroundColor Cyan

            # Stop the test server
            Stop-Job -Job $job
            Remove-Job -Job $job
        } else {
            Write-Host "❌ Server failed to start" -ForegroundColor Red
            exit 1
        }
    } catch {
        Write-Host "❌ Error testing server: $($_.Exception.Message)" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "❌ server.js not found in current directory" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎉 Setup complete! You can now run 'node server.js' to start your server." -ForegroundColor Green
