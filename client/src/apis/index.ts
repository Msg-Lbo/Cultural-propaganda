// import router from "@/router";
import router from "@/router";
import { useUserStore } from "@/store/userinfo";
import axios, { AxiosError, AxiosRequestConfig } from "axios";
import { createDiscreteApi } from "naive-ui";


const { message, loadingBar } = createDiscreteApi(['message', 'loadingBar'])
export const httpInstance = axios.create({
    timeout: 6000,
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
    },
    withCredentials: true
})

export type BkResponse = {
    data: any,
    code: number,
    msg: string
    succeed?: boolean,
    status: number
}

httpInstance.defaults.baseURL = import.meta.env.VITE_BASEURL as string

export const $http = async (config: AxiosRequestConfig) => {
    loadingBar.start()
    const userStore = useUserStore()
    try {
        const axiosResponse = await httpInstance<BkResponse>(config)
        const bkResponse = axiosResponse.data
        if (!bkResponse?.succeed) {
            let errTitle: string = 'Error'
            switch (bkResponse.code) {
                case 400:
                    errTitle = "Bad Request"
                    message.error(bkResponse.msg || "请求参数错误")
                    if (bkResponse.msg === '请先登录') {
                        router.push('/login')
                        userStore.id = '',
                            userStore.account = '',
                            userStore.image_url = '',
                            userStore.nickname = '',
                            userStore.email = '',
                            userStore.sex = '',
                            userStore.identity = ''
                    }
                    break
                case 401:
                    errTitle = "Unauthorized"
                    message.error(bkResponse.msg || "未授权或未登录")
                    break
                case 403:
                    errTitle = "Forbidden"
                    message.error(bkResponse.msg || "禁止访问")
                    break
                case 404:
                    errTitle = "Not Found"
                    message.error(bkResponse.msg || "资源不存在")
                    break
                case 500:
                    errTitle = "Internal Server Error"
                    message.error(bkResponse.msg || "服务器内部错误")
                    break
                default:
                    errTitle = "Unknow Error"
                    message.error(bkResponse.msg || "未知错误")
            }
            const err = new Error(bkResponse?.msg || "Unknow Error")
            err.name = errTitle
            // 抛出错误
            console.log(err.message);
            throw err
        }
        loadingBar.finish()
        return bkResponse
    } catch (err) {
        if (err instanceof AxiosError) {
            loadingBar.error()
            message.error(err.response?.data.message || "网络错误")
        }
        throw err
    } finally {
        // 以错误的形式结束顶部加载条
        loadingBar.error()
    }
}