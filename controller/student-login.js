const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'tesstt',
    user: 'root',
    password: ''
};

exports.getLoginPage = (req, res) => {
    res.render('student-login');
};

exports.postStudentLogin = (req, res) => {
    const connection = mysql.createConnection(conn);

    const { studentID, studentpassword } = req.body;

    // Use placeholders in the SQL query
    const sql = 'SELECT studentID, studentpassword FROM studentlogin WHERE studentID = ? AND studentpassword = ?';

    console.log(studentID);
    console.log(studentpassword);
    connection.query(sql, [studentID, studentpassword], (err, results) => {
        if (err) {
            console.error('Cannot Log In:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (results.length > 0) {
                // Login successful
                res.redirect('/student/dashboard');
            } else {
                // Login failed
                res.send('Login failed');
            }
        }
        connection.end();
    });
};