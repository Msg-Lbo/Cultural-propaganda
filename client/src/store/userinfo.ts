import { defineStore } from 'pinia'
import { getUserInfoApi, logoutApi, isAdminApi } from '@/apis/user'
import { createDiscreteApi } from 'naive-ui'
import router from '@/router'
const { message } = createDiscreteApi(['message'])
export const useUserStore = defineStore('userinfo', {
    state: () => {
        return {
            id: '',
            account: '',
            image_url: '',
            nickname: '',
            email: '',
            sex: '',
            identity: '',
        }
    },
    actions: {
        async getUserInfo(id: string,) {
            const res = await getUserInfoApi(id)
            if (res.code === 200) {
                this.id = res.data.id.toString()
                this.account = res.data.account
                this.image_url = res.data.image_url
                this.nickname = res.data.nickname
                this.email = res.data.email
                this.sex = res.data.sex
                this.identity = res.data.identity
            }
        },
        async isAdmin() {
            const res = await isAdminApi(this.account)
            if (res.data.identity === "管理员") {
                return true
            }
            return false
        },
        async logout() {
            const res = await logoutApi()
            if (res.code === 200) {
                message.success(res.msg)
                this.id = ''
                this.account = ''
                this.image_url = ''
                this.nickname = ''
                this.email = ''
                this.sex = ''
                this.identity = ''
                router.push('/login')
            }
        }
    },
    persist: {
        key: 'userinfo',
        storage: localStorage
    }
})