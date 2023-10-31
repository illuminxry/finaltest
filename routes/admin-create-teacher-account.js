var express = require('express');
var router = express.Router();
const adminCreateTeacherAccount = require('../controller/admin-create-teacher-account'); // Import the controller
/* GET admin-create-teacher-account page. */
router.get('/admin/create/teacher-account',adminCreateTeacherAccount.createTeacherAccount);
router.post('/admin/create/teacher-account/create',adminCreateTeacherAccount.postTeacherAccountCreation);

module.exports = router;
