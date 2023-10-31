const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};
exports.createTeacherAccount = (req, res) => {
    const connection = mysql.createConnection(conn);

    const sql = `SELECT department FROM departments`;

    connection.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching departments:', err);
            res.status(500).send('Internal Server Error');
        } else {
            const departments = results; // Assuming the results contain an array of department names
            // Render the 'admin-create-teacher-account' view and pass the 'departments' to it
            console.log(departments);
            res.render('admin-create-teacher-account', { departments });
        }
        connection.end();
    });
};


exports.postTeacherAccountCreation = (req, res) => {
    
}