const express = require('express')
const router = express.Router()
const { uploadCover, uploadImage } = require('../utils/uploadimg')
const campaignController = require('../controller/campaigns')
const jionCapaignStatueController = require('../controller/CampaignTemp')
const authToken = require('../utils/checkTokenExpiration');

router.post('/publish-campaign', authToken, campaignController.publishCampaign)
router.get('/campaign-list', campaignController.getCampaignsList)
router.get('/campaign-detail', campaignController.getCampaignsDetail)
router.post('/user-campaigns', campaignController.getUserCampaigns)
router.post('/upload-cover', uploadCover)
router.post('/upload-image', authToken, uploadImage)
router.post('/join-campaign', jionCapaignStatueController.joinCampaignOfStatus)
router.get('/campaign-users', campaignController.getCampaignsUsers)
router.post('/delete-campaign', authToken, campaignController.deleteCampaigns)
router.post('/update-campaign', authToken, campaignController.updateCampaigns)
router.post('/join-campaign-agree', authToken, jionCapaignStatueController.joinCampaignOfAgree)
router.post('/join-campaign-refuse', authToken, jionCapaignStatueController.joinCampaignOfRefuse)
router.get('/campaigns-status-user', authToken, jionCapaignStatueController.getCampaignsStatusUser)

module.exports = router

