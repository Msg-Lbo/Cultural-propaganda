<template>
    <div id="header">
        <div class="logo">
            通用后台管理模板
        </div>
        <div class="headimg">
            <img :src="userStore.image_url" alt="">
        </div>
    </div>
</template>

<script setup lang='ts'>
import { useUserStore } from '@/store/userinfo'
const userStore = useUserStore()
</script>

<style lang='scss' scoped>
#header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;

    .logo {
        font-size: 24px;
        font-weight: bold;
        line-height: 64px;
    }

    .headimg {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
        border: 1px solid #ccc;
        img {
            width: 100%;
            height: 100%;
        }
    }
}
</style>