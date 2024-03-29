const express = require('express')
const router = express.Router()
const albumController = require('../controller/album')
const authToken = require('../utils/checkTokenExpiration');

// 获取专辑列表
router.get('/album-list', albumController.getAlbumList)
// 创建专辑
router.post('/add-album', authToken, albumController.createAlbum)
// 获取专辑下的文章
router.get('/albumId-list', albumController.getAlbumIdList)
module.exports = router