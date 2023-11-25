import { $http } from '.'

// 创建专辑
export const createAlbumApi = async (name: string) => {
    return await $http({
        url: '/album/add-album',
        method: 'POST',
        data: name
    })
}

// 获取专辑列表
export const getAlbumListApi = async () => {
    return await $http({
        url: '/album/album-list',
        method: 'GET',
    })
}