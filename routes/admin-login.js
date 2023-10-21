var express = require('express');
var router = express.Router();
const adminLogin = require('../controller/admin-login'); // Import the controller
/* GET admin-login page. */
router.get('/',adminLogin.getAdminLogin);
router.post('/',adminLogin.postAdminLogin);

module.exports = router;
