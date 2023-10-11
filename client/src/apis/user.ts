import { $http } from '.'

// 登录
export const loginApi = async (data: { account: string, password: string }) => {
    return await $http({
        url: '/user/login',
        method: 'POST',
        data
    })
}

// 注册
export const registerApi = async (data: { account: string, password: string, email: string }) => {
    return await $http({
        url: '/user/register',
        method: 'POST',
        data
    })
}

// 忘记密码
export const forgetPasswordApi = async (data: { account: string, email: string, newPassword: string }) => {
    return await $http({
        url: '/user/forget',
        method: 'POST',
        data
    })
}


// 修改密码
export const changePasswordApi = async (data: { account: string, oldPassword: string, newPassword: string }) => {
    return await $http({
        url: '/user/reset',
        method: 'POST',
        data
    })
}

// 获取全部用户
export const getAllUsersApi = async (page: number, page_size: number) => {
    return await $http({
        url: '/user/get-all-users',
        method: 'GET',
        params: {
            page: page,
            pageSize: page_size
        }
    })
}
// 更新用户状态
export const updateUserStatusApi = async (account: string, status: number) => {
    return await $http({
        url: '/user/update-status',
        method: 'POST',
        data: {
            account,
            status
        }
    })
}
// 删除用户
export const deleteUserApi = async (account: string) => {
    return await $http({
        url: '/user/delete-user',
        method: 'POST',
        data: { account }
    })
}
// 登出
export const logoutApi = async () => {
    return await $http({
        url: '/user/logout',
        method: 'POST'
    })
}

// 绑定头像和账号
export const bindAvatarApi = async (account: string, only_id: string, url: string) => {
    return await $http({
        url: '/user/bind-account',
        method: 'POST',
        data: {
            account,
            only_id,
            url
        }
    })
}

// 获取用户信息
export const getUserInfoApi = async (id: string) => {
    return await $http({
        url: '/user/get-user-info',
        method: 'POST',
        data: { id }
    })
}

// 更新用户信息
export const updateUserInfoApi = async (data: { id: string, nickname: string, sex: string, email: string }) => {
    return await $http({
        url: '/user/update-user-info',
        method: 'POST',
        data
    })
}

// 获取用户列表
export const getUserListApi = async (params: { page: number, pageSize: number }) => {
    return await $http({
        url: '/user/list',
        method: 'GET',
        params
    })
}

// 头像上传
export const uploadAvatarApi = async (data: FormData) => {
    return await $http({
        url: '/user/upload-avatar',
        method: 'POST',
        data
    })
}

// 是否管理员
export const isAdminApi = async (account: string) => {
    return await $http({
        url: '/user/is-admin',
        method: 'post',
        data: { account }
    })
}