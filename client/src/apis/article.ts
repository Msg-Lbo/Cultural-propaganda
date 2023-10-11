import { $http } from '.'

// 新增文章
export const addArticleApi = async (data: { article_title: string, content: string, category_id: string, cover: string, author: string }) => {
    return await $http({
        url: '/article/add-article',
        method: 'POST',
        data: data
    })
}
// 分页获取文章
export const getArticleListApi = async (page: number, pageSize: number, category_id?: number | string) => {
    return await $http({
        url: '/article/article-list',
        method: 'get',
        params: {
            page: page,
            pageSize: pageSize,
            category_id: category_id
        }
    })
}
// 分页获取指定用户文章
export const getUserArticleListApi = async (page: number, pageSize: number, account: string) => {
    return await $http({
        url: '/article/user-article-list',
        method: 'get',
        params: {
            page: page,
            pageSize: pageSize,
            account: account
        }
    })
}
// 搜索文章
export const searchArticleApi = async (keyword: string) => {
    return await $http({
        url: '/article/search-article',
        method: 'get',
        params: {
            keyword: keyword
        }
    })
}
// 获取文章详情
export const getArticleDetailApi = async (id: number | string) => {
    return await $http({
        url: '/article/article-detail',
        method: 'get',
        params: {
            id: id
        }
    })
}
// 更新文章
export const updateArticleApi = async (data: { id: number, article_title: string, content: string, category_id: string, cover: string, author: string }) => {
    return await $http({
        url: '/article/update-article',
        method: 'POST',
        data: data
    })
}
// 更新文章状态
export const updateArticleTopApi = async (id: number, is_top: number) => {
    return await $http({
        url: '/article/update-istop',
        method: 'POST',
        data: {
            id,
            is_top
        }
    })
}
// 删除文章
export const deleteArticleApi = async (id: number) => {
    return await $http({
        url: '/article/delete-article',
        method: 'POST',
        data: { id }
    })
}
// 上传文章内容图片
export const uploadArticleImageApi = async (data: FormData) => {
    return await $http({
        url: '/article/upload-image',
        method: 'POST',
        data: data
    })
}

// 获取首页文章列表
export const getHomeArticleListApi = async () => {
    return await $http({
        url: '/article/get-home-list',
        method: 'get'
    })
}

// 获取热门文章列表
export const getHotArticleListApi = async () => {
    return await $http({
        url: '/article/get-hot',
        method: 'get'
    })
}