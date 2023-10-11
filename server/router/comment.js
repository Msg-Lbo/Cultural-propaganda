const express = require('express')
const router = express.Router()
const authToken = require('../utils/checkTokenExpiration');

const commentController = require('../controller/comment')

// 新增评论
router.post('/add-comment', authToken, commentController.addComment)
// 获取评论列表
router.get('/comment-list', commentController.getCommentList)
// 删除评论
router.post('/delete-comment', authToken, commentController.deleteComment)
// 获取全部评论
router.get('/all-comment', commentController.getAllCommentList)

module.exports = router