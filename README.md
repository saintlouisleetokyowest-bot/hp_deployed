# AI Lab Contact Form

This is a contact form application for AI Lab with multilingual support (English, Japanese, Chinese).

## Features

- Multilingual contact form (EN/JA/ZH-CN)
- Responsive design matching the main website
- Form validation and submission
- Backend API for handling form submissions
- Email notification support (configurable)

## Setup

### 1. Install Node.js (Required)
**For Ubuntu/Debian/Linux:**
```bash
# Run the installation script
chmod +x install-nodejs.sh
./install-nodejs.sh

# Or install manually
sudo apt update && sudo apt install -y nodejs npm
```

**For Windows:**
```powershell
# Run the PowerShell script (as Administrator)
.\install-nodejs-windows.ps1

# Or download from: https://nodejs.org/
```

**For macOS:**
```bash
# Using Homebrew
brew install node

# Or download from: https://nodejs.org/
```

### 2. Install Dependencies:
```bash
npm install
```

### 3. Configure email settings (optional):
Create a `.env` file with your email service credentials:
```
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your-app-password
```

### 4. Start the server:

**Simplest method (recommended)**
```bash
# Direct node command (avoids npm path issues)
node server.js
```

**Alternative methods:**

**For WSL/Windows mixed environment**
```bash
# Use the simple batch file
start-simple.bat
```

**For WSL/Linux environment**
```bash
# Make script executable first
chmod +x start-simple.sh
# Then run
./start-simple.sh
```

**Using npm (if direct node doesn't work)**
```bash
npm start
```

**Troubleshooting:**
If you encounter UNC path errors:
1. Open WSL terminal directly: `wsl` or `bash`
2. Navigate to project: `cd /home/louislee/homepage/deployed`
3. Run: `node server.js` (not npm start)

For development with auto-restart:
```bash
npm run dev
```

4. Open your browser and visit `http://localhost:3000`

You can also access individual pages directly:
- Main page: `http://localhost:3000/index.html`
- Contact page: `http://localhost:3000/contact.html`
- Privacy page: `http://localhost:3000/privacy.html`

## API Endpoints

- `POST /api/contact` - Submit contact form
- `GET /api/health` - Health check

## File Structure

- `index.html` - Main landing page
- `contact.html` - Contact form page
- `privacy.html` - Privacy policy page
- `server.js` - Backend server
- `package.json` - Dependencies

## Form Fields

The contact form collects:
- First Name & Last Name (required)
- Email Address (required)
- Phone Number (optional)
- Company (optional)
- Job Title (optional)
- Industry (optional)
- Interest Area (optional)
- Message (required)

## Languages

The application supports three languages:
- English (en)
- Japanese (ja)
- Chinese Simplified (zh-CN)

Language switching is available in the navigation bar.
