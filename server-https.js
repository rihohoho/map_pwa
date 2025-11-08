// HTTPS server for GitHub Pages compatibility (optional)
const express = require('express');
const https = require('https');
const fs = require('fs');
const multer = require('multer');
const { join } = require('path');

const app = express();
const upload = multer();
const OUTPUT_DIR = './uploads';

// Note: You need SSL certificates for HTTPS
// For development, you can create self-signed certificates:
// openssl req -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

// CORS headers - Allow requests from GitHub Pages
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'https://rihohoho.github.io');
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  
  if (req.method === 'OPTIONS') {
    res.sendStatus(200);
  } else {
    next();
  }
});

app.post('/upload', upload.single('file'), (req, res) => {
  if (!req.file) {
    return res.status(400).json({ ok: false, message: 'file field is required' });
  }
  
  const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
  const filename = `path_grid_segments-${timestamp}.csv`;
  const filepath = join(OUTPUT_DIR, filename);
  
  try {
    fs.writeFileSync(filepath, req.file.buffer);
    console.log(`✅ HTTPS CSV saved: ${filename}`);
    res.json({ ok: true, filename, timestamp: new Date().toISOString() });
  } catch (error) {
    console.error('❌ Error saving CSV:', error);
    res.status(500).json({ ok: false, message: 'Failed to save file' });
  }
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok', protocol: 'https', timestamp: new Date().toISOString() });
});

// Only run if certificates exist
if (fs.existsSync('key.pem') && fs.existsSync('cert.pem')) {
  const options = {
    key: fs.readFileSync('key.pem'),
    cert: fs.readFileSync('cert.pem')
  };
  
  https.createServer(options, app).listen(3443, () => {
    console.log('🔒 HTTPS CSV server running on https://localhost:3443');
    console.log('📁 Upload directory:', OUTPUT_DIR);
    console.log('🌐 GitHub Pages compatible');
  });
} else {
  console.log('❌ SSL certificates not found (key.pem, cert.pem)');
  console.log('💡 Generate with: openssl req -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365');
}