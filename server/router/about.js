const express = require('express')
const router = express.Router()
const authToken = require('../utils/checkTokenExpiration');
const aboutController = require('../controller/about')

// 保存关于信息
router.post('/save-about', authToken, aboutController.saveAbout)
// 获取关于信息
router.get('/get-about', aboutController.getAbout)

module.exports = router