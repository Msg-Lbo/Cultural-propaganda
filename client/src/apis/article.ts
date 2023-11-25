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
export const getArticleListApi = async (status: number, page: number, pageSize: number, category_id ?: number | string) => {
    return await $http({
        url: '/article/article-list',
        method: 'get',
        params: {
            status: status,
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

// 审核文章
export const checkArticleApi = async (id: number, is_check: number) => {
    return await $http({
        url: '/article/check_article',
        method: 'POST',
        data: { id, is_check }
    })
}

// 点赞或取消点赞文章
export const likeArticleApi = async (id: number) => {
    return await $http({
        url: '/article/like-article',
        method: 'POST',
        data: { id }
    })
}

// 收藏或取消收藏文章
export const collectArticleApi = async (id: number) => {
    return await $http({
        url: '/article/collect-article',
        method: 'POST',
        data: { id }
    })
}

// 获取用户收藏的文章
export const getUserCollectArticleApi = async (page: number, pageSize: number) => {
    return await $http({
        url: '/article/get-collect',
        method: 'get',
        params: {
            page,
            pageSize
        }
    })
}