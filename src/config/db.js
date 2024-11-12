const mysql = require('mysql2');

const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "root",
    port: 3306,
    database: "hogwarts"
})

module.exports = pool.promise();