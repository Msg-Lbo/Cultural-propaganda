<template>
  <div id="collect-list">
    <div class="collect-list">
      <div class="collect-item" v-for="item in articleList" :key="item.id">
        <div class="collect-item-img">
          <img :src="item.cover" alt="" />
        </div>
        <div class="collect-item-title">{{ item.article_title }}</div>
        <div class="collect-item-desc">{{ item.des }}</div>
        <div class="collect-item-author">{{ item.nickname }}</div>
        <div class="collect-item-time">{{ item.create_time }}</div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { getUserCollectArticleApi } from "@/apis/article";
const page = ref(1);
const pageSize = ref(8);
const total = ref(0);
const articleList = ref<any>([]);
// 获取收藏夹文章
const getCollectArticle = async () => {
  const res = await getUserCollectArticleApi(page.value, pageSize.value);
  if (res.code === 200) {
    articleList.value = res.data.list;
    total.value = res.data.total;
  }
};
getCollectArticle();
</script>

<style lang="scss" scoped>
.collect-list {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  justify-content: space-between;
  .collect-item {
    margin-bottom: 16px;
    border: 1px solid #eee;
    border-radius: 4px;
    padding: 8px;
    .collect-item-img {
      height: 100px;
      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }
    .collect-item-title {
      font-size: 16px;
      font-weight: bold;
      margin: 2px 0;
    }
    .collect-item-desc {
      font-size: 14px;
      color: #999;
      margin: 2px 0;
    }
    .collect-item-author {
      font-size: 14px;
      color: #999;
      margin: 2px 0;
    }
    .collect-item-time {
      font-size: 14px;
      color: #999;
      margin: 2px 0;
    }
  }
}
</style>
