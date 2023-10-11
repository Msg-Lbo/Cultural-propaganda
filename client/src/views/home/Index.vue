<template>
  <div id="home">
    <n-layout>
      <n-layout-header>
        <top-menu></top-menu>
      </n-layout-header>
      <n-layout-content>
        <n-scrollbar style="max-height: 100%">
          <router-view></router-view>
        </n-scrollbar>
      </n-layout-content>
    </n-layout>
  </div>
</template>

<script setup lang="ts">
import topMenu from "./components/topMenu.vue";
</script>

<style lang="scss" scoped>
#home {
  max-width: 1366px;
  min-width: 960px;
  margin: 0 auto;
  // background-image: url('./assets/images/bg.svg');
  // background-repeat: no-repeat;
  // background-size: cover;
  // background-position: center;
}
</style>
