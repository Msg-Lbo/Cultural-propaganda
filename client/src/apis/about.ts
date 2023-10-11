import { $http } from '.'

// 获取关于
export const getAboutApi = async () => {
    return await $http({
        url: '/about/get-about',
        method: 'get'
    })
}
// 更新关于
export const updateAboutApi = async (content: string) => {
    return await $http({
        url: '/about/save-about',
        method: 'POST',
        data: {
            content: content
        }
    })
}