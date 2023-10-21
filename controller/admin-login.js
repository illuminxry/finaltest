const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'tesstt',
    user: 'root',
    password: ''
};

exports.getAdminLogin = (req, res) => {
    res.render('admin-login');
};

exports.postAdminLogin = (req, res) => {
    const connection = mysql.createConnection(conn);

    const { userid, userpw } = req.body;

    // Use placeholders in the SQL query
    const sql = 'SELECT userid, userpw FROM adminlogin WHERE userid = ? AND userpw = ?';

    connection.query(sql, [userid, userpw], (err, results) => {
        if (err) {
            console.error('Cannot Log In:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (results.length > 0) {
                // Login successful
                res.redirect('/admin/dashboard');
            } else {
                // Login failed
                res.send('Login failed');
            }
        }
        connection.end();
    });
};

