<template>
  <div id="albumList">
    <n-popover placement="bottom" trigger="click">
      <template #trigger>
        <n-button type="success" size="small" @click="showAddPopover = true">创建专辑</n-button>
      </template>
      <n-input size="small" v-model:value="name" placeholder="请输入专辑名" />
      <div class="add-button" style="text-align: right; margin-top: 5px;">
         <n-button @click="createAlbum" size="small">提交</n-button>
      </div>
    </n-popover>
    <div class="album-list">
      <div class="album-item">
        <n-collapse arrow-placement="right">
          <n-collapse-item v-for="item in albumList" :key="item.id" :title="item.albumName" :name="item.id">
            <div class="article-list">
              <div class="article-item" v-for="article in item.articleList" :key="article.id" @click="toArticle(article.id)">
                {{ article.article_title }}
              </div>
            </div>
          </n-collapse-item>
        </n-collapse>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { getAlbumListApi, createAlbumApi } from "@/apis/album";
import router from "@/router";
import { ref } from "vue";
const albumList = ref<any>([]);
const showAddPopover = ref<boolean>(false);
const name = ref<string>("");
// 获取专辑列表
const getAlbumList = async () => {
  const res = await getAlbumListApi();
  if (res.code === 200) {
    albumList.value = res.data;
  }
};
getAlbumList();

// 新增专辑
const createAlbum = async () => {
  const res = await createAlbumApi(name.value);
  if (res.code === 200) {
    getAlbumList();
  }
};

const toArticle = (id: number) => {
  // 路由传参
  router.push({
    path: "/detail",
    query: {
      id: id,
    },
  });
};
</script>

<style lang="scss" scoped>
.album-list {
  height: 72vh;
  .album-item {
    padding: 10px;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #eee;
    &:last-child {
      border-bottom: none;
    }
    .article-list {
      width: 100%;
      .article-item {
        padding: 10px;
        box-sizing: border-box;
        border-bottom: 1px solid #eee;
        cursor: pointer;
        transition: all 0.1s ease-in-out;

        &:hover {
          background-color: #eee;
        }

        &:last-child {
          border-bottom: none;
        }
      }
    }
  }
}
</style>
