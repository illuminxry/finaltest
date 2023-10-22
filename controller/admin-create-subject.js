const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getSubjectCreatePage = (req, res) => {
    const sectionSql = 'SELECT sectionname FROM sections';
    const teacherSql = 'SELECT id, firstname, middlename, lastname FROM teacherdetails';

    const connection = mysql.createConnection(conn);

    // Create an object to store the results
    const data = {};

    connection.connect((err) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            res.status(500).send('Internal Server Error');
            return;
        }

        // Execute both SQL queries in parallel using Promise.all
        Promise.all([
            new Promise((resolve, reject) => {
                connection.query(sectionSql, (err, sectionResults) => {
                    if (err) {
                        reject(err);
                    } else {
                        data.sections = sectionResults;
                        resolve();
                    }
                });
            }),
            new Promise((resolve, reject) => {
                connection.query(teacherSql, (err, teacherResults) => {
                    if (err) {
                        reject(err);
                    } else {
                        data.teachers = teacherResults;
                        resolve();
                    }
                });
            }),
        ])
            .then(() => {
                connection.end(); // Close the database connection

                // Pass the data to your EJS template and render it
                res.render('admin-create-subject', { data });
            })
            .catch((err) => {
                console.error('Error:', err);
                res.status(500).send('Internal Server Error');
            });
    });
};

exports.postSubjectCreatePage = (req, res) => {
    const { subjectid, subjectname, sectionname, teacherid } = req.body;

    console.log(subjectid);
    console.log(subjectname);
    console.log(sectionname);
    console.log(teacherid);

    const sql = `INSERT INTO subjects (subjectid, subjectname, sectionname, teacherid) VALUES (?, ?, ?, ?)`;
    const values = [subjectid, subjectname, sectionname, teacherid];

    const connection = mysql.createConnection(conn);

    connection.connect((err) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            res.status(500).send('Internal Server Error');
            return;
        }

        connection.query(sql, values, (err, result) => {
            connection.end();

            if (err) {
                console.error('Error executing SQL query:', err);
                res.status(500).send('Internal Server Error');
                return;
            }

            console.log('Subject Added');
            console.log('subjectID: ' + subjectid);
            console.log('subjectName: ' + subjectname);
            console.log('Section: ' + sectionname); // Corrected variable name
            console.log('Teacher: ' + teacherid); // Corrected variable name

            // Redirect to the root URL ('/')
            res.redirect('/admin/create-subject');
        });
    });
}
