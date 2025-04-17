const mysql = require('mysql')
require('dotenv').config();
var connection = mysql.createConnection({
    host: "localhost",
    user: process.env.DB_HOST,
    password: process.env.DB_PASSWORD,
    database: 'attendance_system'
});