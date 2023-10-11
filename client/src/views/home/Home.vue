<template>
  <div id="home">
    <n-scrollbar style="max-height: calc(100vh - 58px)">
      <div class="header">
        <carousel v-if="carouselList.length > 0" :carouselList="carouselList"></carousel>
      </div>
      <div class="body">
        <recommend v-if="carouselList.length > 0" :recommendList="recommendList"></recommend>
        <information
          v-if="informationList.length > 0"
          :informationList="informationList"
          :campaignsList="campaignsList"
        ></information>
        <hot-article v-if="hotArticleList.length > 0" :hotArticleList="hotArticleList"></hot-article>
      </div>
      <div class="footer">
        <footer-vue></footer-vue>
      </div>
    </n-scrollbar>
  </div>
</template>

<script setup lang="ts">
import Carousel from "./components/Carousel.vue";
import Recommend from "./components/Recommend.vue";
import Information from "./components/Information.vue";
import HotArticle from "./components/HotArticle.vue";
import footerVue from "./components/footer.vue";

import { getHomeArticleListApi, getHotArticleListApi } from "@/apis/article";
import { onMounted, ref } from "vue";
onMounted(() => {
  getArticleList();
  getHotArticleList();
});

// 获取文章列表
const carouselList = ref([]);
const recommendList = ref([]);
const informationList = ref([]);
const campaignsList = ref([]);
const hotArticleList = ref([]);
const getArticleList = async () => {
  const res = await getHomeArticleListApi();
  if (res.code === 200) {
    carouselList.value = res.data.carousel;
    recommendList.value = res.data.recommend;
    informationList.value = res.data.information;
    campaignsList.value = res.data.campaigns;
  }
};
const getHotArticleList = async () => {
  const res = await getHotArticleListApi();
  if (res.code === 200) {
    hotArticleList.value = res.data;
  }
};
</script>

<style lang="scss" scoped>
#home {
  .header {
    padding: 0 8px;
  }

  .body {
    padding: 0 8px;
  }

  .footer {
    padding: 0 8px;
  }
}

// 宽度小于768px
@media screen and (max-width: 768px) {
  #home {
    width: 100vw;
    .header {
      padding: 0 4px;
    }

    .body {
      padding: 0 4px;
    }

    .footer {
      padding: 0 4px;
    }
  }
}
</style>
