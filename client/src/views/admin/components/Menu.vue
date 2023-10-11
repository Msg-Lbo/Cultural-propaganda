<template>
    <div id="menu">
        <n-menu v-model:value="activeKey" :options="menuOptions" @update:value="handleUpdateValue" />
    </div>
</template>

<script setup lang='ts'>
import { ref } from 'vue'
import type { MenuOption } from 'naive-ui'
import router from '@/router';
const activeKey = ref<string | null>(null)
const menuOptions: MenuOption[] = [
    {
        label: '文章管理',
        key: 'article-manager',
        // icon: renderIcon(BookIcon),
    },
    {
        label: '活动管理',
        key: 'campaign-manager',
        // icon: renderIcon(BookIcon),
    },
    {
        label: '文章分区',
        key: 'category-manager',
        // icon: renderIcon(BookIcon),
    },
    {
        label: '用户管理',
        key: 'users-manager',
    },
    {
        label: '评论管理',
        key: 'reply-manager',
    },
    {
        label: '系统设置',
        key: 'settings-manager',
    },
    {
        label: '返回主页',
        key: '/home',
    }
]
const handleUpdateValue = (value: string) => {
    activeKey.value = value
    router.push(value)
    
}
</script>

<style lang='scss' scoped></style>