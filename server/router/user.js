const express = require('express')
const router = express.Router()
const { uploadAvatar } = require('../utils/uploadimg')
const userController = require('../controller/user')
const authToken = require('../utils/checkTokenExpiration');

router.post('/register', userController.register)
router.post('/login', userController.login)
router.post('/logout', userController.logout)
router.post('/forget', userController.forgetPassword)
router.post('/reset', userController.resetPassword)
router.get('/get-all-users', authToken, userController.getAllUsers)
router.post('/update-status', authToken, userController.updateUser)
router.post('/delete-user', authToken, userController.deleteUser)
router.post('/upload-avatar', uploadAvatar)
router.post('/bind-account', userController.bindAccount)
router.post('/get-user-info', userController.getUserInfo)
router.post('/update-user-info', userController.updateUserInfo)
router.post('/is-admin', userController.isAdmin)
module.exports = router 