const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'tesstt',
    user: 'root',
    password: ''
};

exports.getDashboard = (req, res) => {
    res.render('admin-dashboard');
};