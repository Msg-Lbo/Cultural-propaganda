<template>
    <div id="user">
        <bread-crumb :item="item"></bread-crumb>
        <div class="user-contenr">
            <n-table :bordered="true" :single-line="true" size="small" striped>
                <thead>
                    <tr>
                        <th>账号</th>
                        <th>用户名</th>
                        <th>身份</th>
                        <th>邮箱</th>
                        <th>创建时间</th>
                        <th>状态</th>
                        <th style="width: 200px; text-align: center;">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in usersList" :key="item.account">
                        <td>{{ item.account }}</td>
                        <td>{{ item.nickname }}</td>
                        <td>{{ item.identity }}</td>
                        <td>{{ item.email }}</td>
                        <td>{{ item.create_time }}</td>
                        <td>
                            <n-tag v-if="item.status == true" type="success" size="small">正常</n-tag>
                            <n-tag v-else type="error" size="small">禁用</n-tag>

                        </td>
                        <td style="display: flex; align-items: center; justify-content: center;">
                            <n-button quaternary type="error" v-if="item.status == true"
                                @click="banUser(item.account, 1)">禁用</n-button>
                            <n-button quaternary type="success" v-else @click="banUser(item.account, 0)">启用</n-button>
                            <n-popconfirm>
                                <template #trigger>
                                    <n-button quaternary type="error">删除</n-button>
                                </template>
                                将会永久删除,确定?
                                <template #action>
                                    <n-button type="error" size="small" @click="handleDelete(item.account)">确定</n-button>
                                </template>
                            </n-popconfirm>
                        </td>
                    </tr>
                </tbody>
            </n-table>
        </div>
    </div>
</template>

<script setup lang='ts'>
import breadCrumb from '@/components/bread_crumb.vue'
import { ref } from 'vue';
import { getAllUsersApi, deleteUserApi, updateUserStatusApi } from '@/apis/user'
import { useMessage } from 'naive-ui';
interface UsersList {
    account: string,
    nickname: string,
    email: string,
    identity: string,
    create_time: string,
    status: boolean
}
const item = ref({
    first: '用户管理'
})
const message = useMessage()
let page = 1
let pageSize = 10
const count = ref(0)
const usersList = ref<UsersList[]>([])
const getAllUsers = async () => {
    const res = await getAllUsersApi(page, pageSize)
    if (res.code === 200) {
        usersList.value = res.data.data
        count.value = res.data.count
    }
}
getAllUsers()

// 删除用户
const handleDelete = async (account: string) => {
    const res = await deleteUserApi(account)
    if (res.code === 200) {
        message.success(res.msg)
        getAllUsers()
    }
}
// 禁用用户
const banUser = async (account: string, status: number) => {
    const res = await updateUserStatusApi(account, status)
    if (res.code === 200) {
        message.success(res.msg)
        getAllUsers()
    }
}
</script>

<style lang='scss' scoped></style>