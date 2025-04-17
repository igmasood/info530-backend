var express = require('express');
var router = express.Router();
var db = require('../db')
/* GET home page. */
router.get('/', function(req, res, next) {
    db.query('SELECT * FROM students', (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error querying students table.');
        }
        res.json(results);
    });
});

module.exports = router;
