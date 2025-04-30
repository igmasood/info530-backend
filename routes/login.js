var express = require('express');
var router = express.Router();
var db = require('../db');
var mysql = require('mysql2');

router  = express.Router();
var connection = mysql.createConnection(db.conn_info);

connection.connect();

// instructor login
router.post('/instructor', (req, res) => {
    const {id, password} = req.body;

    //need to change later for specific issues (incorrect pass, invalid employee ID, etc)
    const query = 'SELECT * FROM instructor WHERE employee_id = ? AND password = ?';

    connection.query(query, [id, password], (err, results) => {
        if (err) return res.status(500).json({ message: "Database error" });
        if (results.length == 0) return res.status(401).json({ message: "Invalid Credentials" });

        const user = results[0];
        res.json({
            message: 'Login successful',
            userID: user.employee_id,
            firstName: user.first_name,
            lastName: user.lastName,
            role: 'instructor'
        });
    });
});

module.exports = router;