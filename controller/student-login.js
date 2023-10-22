const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getLoginPage = (req, res) => {
    res.render('student-login');
};

exports.postStudentLogin = (req, res) => {
    const { studentID, studentpassword } = req.body;

    const sql = `SELECT s.firstname, s.middlename, s.lastname FROM students AS s INNER JOIN studentlogins AS sl ON s.studentID = sl.studentID WHERE sl.studentID = ? AND sl.studentpassword = ?`;

    const values = [studentID, studentpassword];
    const connection = mysql.createConnection(conn);
    connection.query(sql, values, (err, results) => {
        if (err) {
            console.error('Cannot Log In:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (results.length > 0) {
                // Login successful
                // Render the student dashboard EJS template with user data
                res.render('student-dashboard', {
                    firstname: results[0].firstname,
                    middlename: results[0].middlename,
                    lastname: results[0].lastname
                });
            } else {
                // Login failed
                res.send('Login failed');
            }
        }
    });
};


