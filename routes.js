const express = require('express');
const router = express.Router();
const db = require('./db');

// Obtener todos los autores
router.get('/users', (req, res) => {
  db.query('SELECT * FROM users', (err, results) => {
    if (err) {
      return res.status(500).json({ error: err });
    }
    res.json(results);
  });
});



// Crear un nuevo usuario
router.post('/users', (req, res) => {
  const { name, last_names, phone, email, username, passwd, roles_id } = req.body;
  db.query('INSERT INTO users (name, last_names, phone, email, username, passwd, roles_id) VALUES (?, ?, ?, ?, ?, ?, ?)', [name, last_names, phone, email, username, passwd, roles_id], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err });
    }
    res.json({ id: results.insertId, name, last_names, phone, email, username, passwd, roles_id });
  });
});


module.exports = router;
