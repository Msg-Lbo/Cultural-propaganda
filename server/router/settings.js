const express = require('express')
const router = express.Router()
const settingsController = require('../controller/settings')
const authToken = require('../utils/checkTokenExpiration');

router.post('/home-setting', authToken, settingsController.homeSetting)
router.get('/get-home-setting', settingsController.getHomeSetting)
module.exports = router