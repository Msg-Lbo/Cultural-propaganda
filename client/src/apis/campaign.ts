import { $http } from '.';

// 发布活动
export const publishCampaignApi = async (date: { title: string, content: string, cover: string, author: string, start_time: number, end_time: number }) => {
    return await $http({
        url: '/campaign/publish-campaign',
        method: 'POST',
        data: date
    })
}

// 获取活动列表
export const getCampaignListApi = async (page: number, pageSize: number) => {
    return await $http({
        url: '/campaign/campaign-list',
        method: 'GET',
        params: { page, pageSize }
    })
}

// 获取活动详情
export const getCampaignDetailApi = async (id: any) => {
    return await $http({
        url: '/campaign/campaign-detail',
        method: 'GET',
        params: { id }
    })
}

// 获取用户参与的活动
export const getUserCampaignApi = async () => {
    return await $http({
        url: '/campaign/user-campaign',
        method: 'GET'
    })
}

// 参与活动
export const joinCampaignApi = async (campaign: any, user: string) => {
    return await $http({
        url: '/campaign/join-campaign',
        method: 'POST',
        data: { campaign, user }
    })
}

// 上传图片
export const uploadImgApi = async (data: FormData) => {
    return await $http({
        url: '/campaign/upload-image',
        method: 'POST',
        data: data
    })
}


// 获取活动参与的用户
export const getCampaignUserApi = async (id: string) => {
    return await $http({
        url: '/campaign/campaign-user',
        method: 'GET',
        params: { id }
    })
}

// 删除活动
export const deleteCampaignApi = async (id: number) => {
    return await $http({
        url: '/campaign/delete-campaign',
        method: 'POST',
        data: { id }
    })
}

// 更新活动
export const updateCampaignApi = async (data: { id: number, title: string, content: string, cover: string, author: string, start_time: number, end_time: number }) => {
    return await $http({
        url: '/campaign/update-campaign',
        method: 'POST',
        data: data
    })
}

// 同意参与活动
export const agreeJoinApi = async (campaign: number | string, user: string) => {
    return await $http({
        url: '/campaign/join-campaign-agree',
        method: 'POST',
        data: { campaign, user }
    })
}
// 拒绝参与活动
export const refuseJoinApi = async (campaign: number | string, user: string) => {
    return await $http({
        url: '/campaign/join-campaign-refuse',
        method: 'POST',
        data: { campaign, user }
    })
}
// 获取指定状态的参与活动列表
export const getCampaignJoinApi = async (status: number, page: number, pageSize: number) => {
    return await $http({
        url: '/campaign/campaigns-status-user',
        method: 'GET',
        params: { status, page, pageSize }
    })
}