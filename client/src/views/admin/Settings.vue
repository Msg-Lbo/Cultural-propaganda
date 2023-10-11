<template>
  <div id="settings">
    <bread-crumb :item="item"></bread-crumb>
    <div class="settings-tabs">
      <n-card style="margin-bottom: 16px">
        <n-tabs type="line" animated>
          <n-tab-pane name="user-info" tab="个人信息">
            <user-info />
          </n-tab-pane>
          <n-tab-pane name="home-manger" tab="首页设置">
            <home-set />
          </n-tab-pane>
        </n-tabs>
      </n-card>
    </div>
    <update-pwd ref="updatePassword" />
  </div>
</template>

<script setup lang='ts'>
import updatePwd from './components/UpdatePassword.vue'
import breadCrumb from '@/components/bread_crumb.vue'
import userInfo from './components/UserInfo.vue'
import homeSet from './components/HomeSet.vue'
import { ref } from 'vue';
const item = ref({
  first: '系统设置'
})

</script>

<style lang='scss' scoped></style>