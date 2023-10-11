<template>
    <n-modal v-model:show="state.forgetModel" preset="card" style="width: 400px" title="忘记密码">
        <div>
            <n-form :model="forgetForm" :rules="forgetRules">
                <n-form-item-row label="输入您的注册账号" path="account">
                    <n-input v-model:value="forgetForm.account" />
                </n-form-item-row>
                <n-form-item-row label="输入您的注册邮箱" path="email">
                    <n-input type="email" v-model:value="forgetForm.email" />
                </n-form-item-row>
                <n-form-item-row label="输入新密码" path="newPassword">
                    <n-input type="newPassword" v-model:value="forgetForm.newPassword" />
                </n-form-item-row>
            </n-form>
        </div>
        <template #action>
            <div class="changeButton">
                <n-button color="#7bed9f" block strong @click="changePassword">修改</n-button>
            </div>
        </template>
    </n-modal>
</template>

<script setup lang='ts'>
import { ref } from 'vue'
import {
    FormRules, useMessage
} from 'naive-ui'
import { forgetPasswordApi } from '@/apis/user';
interface ForgetForm {
    account: string
    email: string
    newPassword: string
}
const message = useMessage()
const forgetForm = ref<ForgetForm>({
    account: '',
    email: '',
    newPassword: ''
})
const forgetRules: FormRules = {
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
    newPassword: [
        { required: true, message: '请输入新密码', trigger: 'blur' },
    ],
}
const state = ref({
    forgetModel: false
})
const open = () => {
    state.value.forgetModel = true
}
// 修改密码
const changePassword = async () => {
    const { account, email, newPassword } = forgetForm.value
    if (!account || !email || !newPassword) {
        return message.error('请填写完整信息')
    }
    const res = await forgetPasswordApi(forgetForm.value)
    if (res.code === 200) {
        message.success('修改成功')
        state.value.forgetModel = false
    }
}
defineExpose({
    open
})
</script>

<style lang='scss' scoped></style>