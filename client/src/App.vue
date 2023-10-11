

<template>
  <div id="app">
    <n-config-provider :locale="zhCN" :date-locale="dateZhCN">
      <n-global-style />
      <n-dialog-provider>
        <n-message-provider>
          <router-view />
        </n-message-provider>
      </n-dialog-provider>
    </n-config-provider>
  </div>
</template>
<script lang="ts">
import { defineComponent } from 'vue'
import { zhCN, dateZhCN } from 'naive-ui'
export default defineComponent({
  name: 'App',
  components: {},
  setup() {
    return {
      zhCN,
      dateZhCN
    }
  },
})


</script>
<style lang="scss" scoped>
#app {
  height: 100%;
  background-image: url('./assets/images/bg.svg');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
</style>
