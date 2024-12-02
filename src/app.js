// Creation and configuration of the Express APP
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

// Middleware global: configurar límite de tamaño y CORS
app.use(express.json({ limit: '10mb' })); // Configurar límite de JSON
app.use(express.urlencoded({ limit: '10mb', extended: true })); // Configurar límite para URL-encoded
app.use(cors());

// Route configuration
app.use('/api/auth', require('./controllers/AuthController'));
app.use('/api/admins', require('./controllers/AdminController'));
app.use('/api/teachers', require('./controllers/TeacherController'));
app.use('/api/students', require('./controllers/StudentController'));
app.use('/api/knowledge-branches', require('./controllers/KnowledgeBranchController'));

// Error handler
app.use((err, req, res, next) => {
    if (err.status === 413) { // Payload Too Large
        return res.status(413).json({ message: 'La carga es demasiado grande. Por favor, intenta con un archivo más pequeño.' });
    }
    console.error(err.stack);
    res.status(err.status || 500).json({ error: err.message });
});

module.exports = app;