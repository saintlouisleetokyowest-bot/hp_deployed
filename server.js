const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const nodemailer = require('nodemailer');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 3000;

// Ensure we're in the correct directory
const correctDir = path.resolve(__dirname);
console.log('Server starting in directory:', correctDir);
console.log('Server.js exists:', fs.existsSync(path.join(__dirname, 'server.js')));
console.log('Package.json exists:', fs.existsSync(path.join(__dirname, 'package.json')));

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Serve static files from the current directory
app.use(express.static(path.join(__dirname)));

// Serve static files with correct MIME types
app.use(express.static(path.join(__dirname), {
    setHeaders: (res, path) => {
        if (path.endsWith('.js')) {
            res.setHeader('Content-Type', 'application/javascript');
        }
    }
}));

// Contact form submission endpoint
app.post('/api/contact', async (req, res) => {
    try {
        const { firstName, lastName, email, phone, company, jobTitle, industry, interest, message } = req.body;

        console.log('New contact form submission:', {
            name: `${firstName} ${lastName}`,
            email,
            phone,
            company,
            jobTitle,
            industry,
            interest,
            message
        });

        // Here you would typically send an email or save to database
        // For now, we'll just log it and send a success response

        // Example email sending (requires nodemailer and email service configuration)
        /*
        const transporter = nodemailer.createTransporter({
            service: 'gmail',
            auth: {
                user: process.env.EMAIL_USER,
                pass: process.env.EMAIL_PASS
            }
        });

        const mailOptions = {
            from: process.env.EMAIL_USER,
            to: 'hello@ailab.com',
            subject: 'New Contact Form Submission',
            html: `
                <h2>New Contact Form Submission</h2>
                <p><strong>Name:</strong> ${firstName} ${lastName}</p>
                <p><strong>Email:</strong> ${email}</p>
                <p><strong>Phone:</strong> ${phone || 'Not provided'}</p>
                <p><strong>Company:</strong> ${company || 'Not provided'}</p>
                <p><strong>Job Title:</strong> ${jobTitle || 'Not provided'}</p>
                <p><strong>Industry:</strong> ${industry || 'Not provided'}</p>
                <p><strong>Interest:</strong> ${interest || 'Not provided'}</p>
                <p><strong>Message:</strong></p>
                <p>${message}</p>
            `
        };

        await transporter.sendMail(mailOptions);
        */

        // For now, just send success response
        res.json({
            success: true,
            message: 'Message sent successfully'
        });

    } catch (error) {
        console.error('Error processing contact form:', error);
        res.status(500).json({
            success: false,
            message: 'Failed to send message'
        });
    }
});

// Health check endpoint
app.get('/api/health', (req, res) => {
    res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
    console.log(`Access the website at: http://localhost:${PORT}`);
});
