const express = require('express');
const router = express.Router();
const teacherLoginController = require('../controller/teacher-login'); // Import the controller

/* GET home page. */
router.get('/', teacherLoginController.getLoginPage); // Use the controller for the route
router.post('/',teacherLoginController.postTeacherLogin);
module.exports = router;
