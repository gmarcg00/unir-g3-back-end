const express = require('express');
const app = express();
const port = 3000;
const userRoutes = require('./routes'); // Importar las rutas
const db = require('./db'); // Asegurar la conexión a la base de datos

// Middleware para procesar datos JSON
app.use(express.json());

// Rutas base de la API
app.get('/', (req, res) => {
  res.send('API de Express con MySQL');
});



// Usar las rutas definidas
app.use('/api', userRoutes);

app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});