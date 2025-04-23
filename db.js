require('dotenv').config();
const name = "db";

var conn_info = {
    host: "localhost",
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: 'attendance_system'
}

module.exports = {name, conn_info}
