<template>
    <div id="login">
        <n-card title="绵阳市文化创意平台!">
            <n-tabs class="card-tabs" v-model:value="secletTab" size="small" animated>
                <n-tab-pane name="signin" tab="登录">
                    <n-form :model="loginForm" :rules="loginRules">
                        <n-form-item-row label="用户名" path="account">
                            <n-input v-model:value="loginForm.account" />
                        </n-form-item-row>
                        <n-form-item-row label="密码" path="password">
                            <n-input type="password" v-model:value="loginForm.password" />
                        </n-form-item-row>
                    </n-form>
                    <div class="forget">
                        <n-button text @click="openFroget()">忘记密码？</n-button>
                    </div>
                    <n-button color="#7bed9f" block strong @click="handleLogin">
                        登录
                    </n-button>
                </n-tab-pane>
                <n-tab-pane name="signup" tab="注册">
                    <n-form :model="registerForm" :rules="registerRules">
                        <n-grid :cols="24" :x-gap="24">
                            <n-form-item-gi :span="12" label="用户名" path="account">
                                <n-input v-model:value="registerForm.account" placeholder="Input" />
                            </n-form-item-gi>
                            <n-form-item-gi :span="12" label="邮箱" path="email">
                                <n-input v-model:value="registerForm.email" placeholder="Input" />
                            </n-form-item-gi>
                            <n-form-item-gi :span="12" label="密码" path="password">
                                <n-input v-model:value="registerForm.password" placeholder="Input" />
                            </n-form-item-gi>
                            <n-form-item-gi :span="12" label="确认密码" path="confirmPassword">
                                <n-input v-model:value="registerForm.confirmPassword" :disabled="!registerForm.password"
                                    placeholder="Input" />
                            </n-form-item-gi>
                        </n-grid>
                    </n-form>
                    <n-button color="#70a1ff" block strong @click="handleRegister">
                        注册
                    </n-button>
                </n-tab-pane>
            </n-tabs>
        </n-card>
    </div>
    <forget ref="forgetPassword" />
</template>

<script setup lang='ts'>
import { FormItemRule, FormRules, useMessage } from 'naive-ui'
import { ref } from 'vue'
import forget from './components/forget.vue'
import { loginApi, registerApi } from '@/apis/user';
import router from '@/router';
import { useUserStore } from '@/store/userinfo';
const message = useMessage()
const store = useUserStore()
const secletTab = ref('signin')
interface LoginForm {
    account: string
    password: string
}
interface RegisterForm {
    account: string
    email: string
    password: string
    confirmPassword: string
}
const loginForm = ref<LoginForm>({
    account: 'msglbo',
    password: '141444'
})
const registerForm = ref<RegisterForm>({
    account: '',
    email: '',
    password: '',
    confirmPassword: ''
})
const validatePasswordStartWith = (
    _rule: FormItemRule,
    value: string
): boolean => {
    return (
        !!registerForm.value.password &&
        registerForm.value.password.startsWith(value) &&
        registerForm.value.password.length >= value.length
    )
}
const validatePasswordSame = (_rule: FormItemRule, value: string): boolean => {
    return value === registerForm.value.password
}
const loginRules: FormRules = {
    account: [
        { required: true, message: '请输入账号', trigger: 'blur' }
    ],
    password: [
        { required: true, message: '请输入密码', trigger: 'blur' }
    ]
}
const registerRules: FormRules = {
    account: [
        { required: true, message: '请输入账号', trigger: 'blur' }
    ],
    email: [
        { required: true, message: '请输入邮箱', trigger: 'blur' },
        {
            type: 'email',
            message: '请输入正确的邮箱地址',
            trigger: ['input', 'blur']
        }
    ],
    password: [
        { required: true, message: '请输入密码', trigger: 'blur' }
    ],
    confirmPassword: [
        {
            required: true,
            message: '请确认密码',
            trigger: 'blur'
        },
        {
            validator: validatePasswordStartWith,
            message: '两次密码输入不一致',
            trigger: 'input'
        },
        {
            validator: validatePasswordSame,
            message: '两次密码输入不一致',
            trigger: ['blur', 'password-input']
        }
    ]
}
const forgetPassword = ref()
const openFroget = () => {
    forgetPassword.value.open()
}
// 登陆
const handleLogin = async () => {
    // 信息是否为空
    if (!loginForm.value.account || !loginForm.value.password) {
        return message.error('必填项不可为空')
    }
    const res = await loginApi(loginForm.value)
    if (res.code === 200) {
        // 延时1秒
        store.getUserInfo(res.data.id)
        setTimeout(() => {
            router.push('/')
            message.success(res.msg)
        }, 500)
    }
}
// 注册
const handleRegister = async () => {
    // 信息是否为空
    if (!registerForm.value.account || !registerForm.value.password || !registerForm.value.confirmPassword) {
        return message.error('必填项不可为空')

    }
    const res = await registerApi(registerForm.value)
    if (res.code === 200) {
        message.success(res.msg)
        secletTab.value = 'signin'
    }
}
</script>

<style lang='scss' scoped>
#login {
    height: 100vh;
    background-image: url('@/assets/images/k3.png');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    display: flex;
    justify-content: center;
    align-items: center;

    ::v-deep(.n-card) {
        width: 640px;
        background-color: rgba(255, 255, 255, 0.8);
        backdrop-filter: blur(10px);
        border-radius: 15px;
    }

    .forget {
        text-align: right;
        margin-bottom: 20px;
    }
}
</style>