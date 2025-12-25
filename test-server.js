// Simple test script to verify the server is working
const http = require('http');

const testData = {
    firstName: 'Test',
    lastName: 'User',
    email: 'test@example.com',
    phone: '+1234567890',
    company: 'Test Company',
    jobTitle: 'Developer',
    industry: 'technology',
    interest: 'demo',
    message: 'This is a test message from the test script.'
};

const postData = JSON.stringify(testData);

const options = {
    hostname: 'localhost',
    port: 3000,
    path: '/api/contact',
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(postData)
    }
};

console.log('Testing contact form API...');

const req = http.request(options, (res) => {
    console.log(`Status: ${res.statusCode}`);
    console.log(`Headers:`, res.headers);

    res.setEncoding('utf8');
    let body = '';
    res.on('data', (chunk) => {
        body += chunk;
    });
    res.on('end', () => {
        console.log('Response:', body);
        try {
            const response = JSON.parse(body);
            if (response.success) {
                console.log('✅ Test passed! Contact form API is working.');
            } else {
                console.log('❌ Test failed! API returned error.');
            }
        } catch (e) {
            console.log('❌ Test failed! Invalid JSON response.');
        }
    });
});

req.on('error', (e) => {
    console.error(`❌ Test failed! Problem with request: ${e.message}`);
});

req.write(postData);
req.end();
