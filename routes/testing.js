var express = require('express');
var router = express.Router();
var db = require('../db');
var mysql = require('mysql2');

//router  = express.Router();
//var connection = mysql.createConnection(db.conn_info);

//connection.connect();

/* GET home page. */
router.get('/', function(req, res, next) {
    connection.query('SELECT * FROM students', (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error querying students table.');
        }
        res.json(results);
    });
});

module.exports = router;
