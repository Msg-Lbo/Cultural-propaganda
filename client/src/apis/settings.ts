import { $http } from '.'
// 保存首页设置
export const saveHomeSettingApi = async (data: { carousel: [], recommend: [], information: [], campaigns: [] }) => {
    return await $http({
        url: '/setting/home-setting',
        method: 'POST',
        data: data
    })
}
// 获取首页设置
export const getHomeSettingApi = async () => {
    return await $http({
        url: '/setting/get-home-setting',
        method: 'GET'
    })
}