const mysql = require("mysql");

const conn = {
    host: 'localhost',
    database: 'finalcapstone',
    user: 'root',
    password: ''
};

exports.getCreateSection = (req, res) => {
      res.render('admin-create-section');
}