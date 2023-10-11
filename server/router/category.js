const express = require('express')
const router = express.Router()
const authToken = require('../utils/checkTokenExpiration');

const categoryController = require('../controller/category')
// 新增分类
router.post('/add-category', authToken, categoryController.addCategory)
// 获取分类列表
router.get('/category-list', categoryController.getCategoryList)
// 删除分类
router.post('/delete-category', authToken, categoryController.deleteCategory)
// 修改分类
router.post('/update-category', authToken, categoryController.updateCategory)
module.exports = router