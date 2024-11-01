const mysql = require('mysql2');

// Crear la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',      // Cambia al usuario de tu base de datos
  password: '1234', // Cambia a la contraseña de tu base de datos
  database: 'teacherapp_db'
});

// Conectar a la base de datos
connection.connect((err) => {
  if (err) {
    console.error('Error al conectar con MySQL:', err);
  } else {
    console.log('Conectado a MySQL');
  }
});

module.exports = connection;