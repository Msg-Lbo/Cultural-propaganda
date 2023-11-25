const express = require('express');
const router = express.Router();
const authToken = require('../utils/checkTokenExpiration');

// 集合路由
router.use('/user', require('./user'));
router.use('/article', require('./article'));
router.use('/category', require('./category'));
router.use('/setting', require('./settings'));
router.use('/comment', require('./comment'));
router.use('/about', require('./about'));
router.use('/campaign', require('./campaigns'));
router.use('/album', require('./album'));
router.get('/test', authToken, (req, res) => {
    res.json({
        code: 200,
        msg: '测试成功',
    })
})

module.exports = router;