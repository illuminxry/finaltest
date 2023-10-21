const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'tesstt',
    user: 'root',
    password: ''
};

exports.getLoginPage = (req, res) => {
    res.render('teacher-login');
};

exports.postTeacherLogin = (req, res) => {
    const connection = mysql.createConnection(conn);

    const { userid, userpassword } = req.body;

    // Use placeholders in the SQL query
    const sql = 'SELECT userid, userpassword FROM teacherlogin WHERE userid = ? AND userpassword = ?';

    console.log(userid);
    console.log(userpassword);
    connection.query(sql, [userid, userpassword], (err, results) => {
        if (err) {
            console.error('Cannot Log In:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (results.length > 0) {
                // Login successful
                res.redirect('/teacher-dashboard');
            } else {
                // Login failed
                res.send('Login failed');
            }
        }
        connection.end();
    });
};