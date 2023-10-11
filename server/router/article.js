const express = require('express')
const router = express.Router()
const { uploadCover, uploadImage } = require('../utils/uploadimg')
const articleController = require('../controller/article')
const authToken = require('../utils/checkTokenExpiration');


router.post('/add-article', authToken, articleController.addArticle)
router.get('/article-list', articleController.getArticleList)
router.get('/user-article-list', articleController.getUserArticleList)
router.get('/search-article', articleController.searchArticle)
router.post('/update-istop', authToken, articleController.updateIsTop)
router.post('/upload-cover', uploadCover)
router.get('/article-detail', articleController.getArticleDetail)
router.post('/update-article', authToken, articleController.updateArticle)
router.post('/delete-article', authToken, articleController.deleteArticle)
router.post('/upload-image', authToken, uploadImage)
router.get('/get-home-list', articleController.getHomeArticleList)
router.get('/get-hot', articleController.getHotArticle)
module.exports = router