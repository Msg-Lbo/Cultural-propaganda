import { $http } from '.'

// 新增评论
export const addCommentApi = async (content: string, article_id: number | string, user_account: string) => {
    return await $http({
        url: '/comment/add-comment',
        method: 'POST',
        data: { content, article_id, user_account }
    })
}
// 获取评论列表
export const getCommentListApi = async (article_id: number | string) => {
    return await $http({
        url: '/comment/comment-list',
        method: 'GET',
        params: { article_id }
    })
}
// 删除评论
export const deleteCommentApi = async (id: number) => {
    return await $http({
        url: '/comment/delete-comment',
        method: 'POST',
        data: { id }
    })
}
// 获取所有评论
export const getAllCommentApi = async (page: number, pageSize: number) => {
    return await $http({
        url: '/comment/all-comment',
        method: 'GET',
        params: { page, pageSize }
    })
}