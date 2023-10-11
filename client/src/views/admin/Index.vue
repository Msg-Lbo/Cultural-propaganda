<template>
    <div id="admin">
        <n-layout style="min-height: 100vh">
            <n-layout-header style="height: 64px;" bordered>
                <header-vue />
            </n-layout-header>
            <n-layout position="absolute" style="top: 64px; bottom: 64px" has-sider>
                <n-layout-sider :native-scrollbar="false" bordered>
                    <left-menu />
                </n-layout-sider>
                <n-layout content-style="padding: 8px;" :native-scrollbar="false">
                    <router-view></router-view>
                </n-layout>
            </n-layout>
            <n-layout-footer position="absolute" style="height: 64px; padding: 24px" bordered>
                城府路
            </n-layout-footer>
        </n-layout>

    </div>
</template>

<script setup lang='ts'>
import headerVue from './components/Header.vue'
import leftMenu from './components/Menu.vue'
</script>

<style lang='scss' scoped>
#admin {
    height: 100%;
    background-color: #ecf0f1;

    ::v-deep(.n-layout) {
        height: 100%;
        background-color: #ecf0f1;
    }
}
</style>