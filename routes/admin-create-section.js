var express = require('express');
var router = express.Router();
const adminCreateSection = require('../controller/admin-create-section'); // Import the controller
/* GET admin-dashboard page. */
router.get('/admin/create-section', adminCreateSection.getCreateSection);
// router.post('/admin/create-subject', adminCreateSubject.postSubjectCreatePage);


module.exports = router;
