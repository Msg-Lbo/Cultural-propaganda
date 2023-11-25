<template>
  <div></div>
</template>

<script setup lang="ts">
import { getAlbumListApi } from "@/apis/album";
import { ref } from "vue";
const albumList = ref<any>([]);


// 获取专辑列表
const getAlbumList = async () => {
  const res = await getAlbumListApi();
  if (res.code === 200) {
    albumList.value = res.data;
  }
};
getAlbumList();
</script>

<style lang="scss" scoped></style>
