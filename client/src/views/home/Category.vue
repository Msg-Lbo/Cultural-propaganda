<template>
  <div id="category">
    <n-card style="margin-bottom: 16px">
      <n-tabs
        :default-value="12"
        :bar-width="50"
        justify-content="space-evenly"
        type="line"
        :on-update:value="handleChangeSelect"
      >
        <n-tab-pane v-for="item in categoryList" :name="item.id" :tab="item.category_name" :key="item.id">
          <n-scrollbar style="max-height: 90vh">
            <div class="article-list-container">
              <n-card
                class="article-content"
                v-for="item2 in ArticleList"
                :title="item2.article_title"
                :key="item2.id"
                hoverable
                @click="toArticle(item2.id)"
              >
                <template #cover>
                  <img :src="item2.cover" style="width: 320px; height: 180px" />
                </template>
                <n-ellipsis :line-clamp="2" :tooltip="false">
                  {{ item2.des }}
                </n-ellipsis>
                <div class="article-footer">
                  <div class="icons">
                    <span class="icon">
                      <n-icon><people-outlined /></n-icon>{{ item2.nickname }}
                    </span>
                    <span class="icon">
                      <n-icon><message-outlined /></n-icon>{{ item2.comment_count }}
                    </span>
                    <span class="icon">
                      <n-icon><fire-outlined /></n-icon>{{ item2.num_read }}
                    </span>
                  </div>
                </div>
              </n-card>
            </div>
          </n-scrollbar>
          <div class="pagination-content">
            <n-pagination v-model:page="page" :page-count="total" :on-update:page="handlePage" />
          </div>
        </n-tab-pane>
      </n-tabs>
    </n-card>
  </div>
</template>

<script setup lang="ts">
import {
  MessageOutlined,
  LocalFireDepartmentOutlined as fireOutlined,
  EmojiPeopleOutlined as peopleOutlined,
} from "@vicons/material";
import { getArticleListApi } from "@/apis/article";
import { getCategoryListApi } from "@/apis/category";
import { ref } from "vue";
import router from "@/router";

const page = ref(1);
const pageSize = ref(8);
const categoryList = ref<any>([]);
const total = ref(0);
const selectCategory = ref(12);
// 获取分类列表
const getAllCategory = async () => {
  const res = await getCategoryListApi();
  if (res.code === 200) {
    categoryList.value = res.data;
  }
};
getAllCategory();
// 切换分类
const handleChangeSelect = (e: number) => {
  page.value = 1;
  getArticleListInCategoryId(e);
};

// 获取指定分类文章
const ArticleList = ref<any>([]);
const getArticleListInCategoryId = async (id: number) => {
  selectCategory.value = id;
  const res = await getArticleListApi(1, page.value, pageSize.value, id);
  if (res.code === 200) {
    ArticleList.value = res.data.list;
    total.value = res.data.total;
  }
};
handleChangeSelect(12);
// 分页切换
const handlePage = (e: number) => {
  page.value = e;
  getArticleListInCategoryId(selectCategory.value);
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
#category {
  padding: 0 8px;

  .article-list-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    height: 75vh;
  }

  .n-card.article-content {
    max-width: 320px;
    height: 320px;
    cursor: pointer;

    .article-footer {
      display: flex;
      align-items: center;
      margin-top: 16px;

      .icons {
        display: flex;
        align-items: center;
        justify-content: flex-start;
        font-size: 12px;
        color: #999;

        .icon {
          margin-right: 8px;
          display: flex;
          align-items: center;
          line-height: 14px;
        }
      }

      .time {
        font-size: 12px;
        line-height: 12px;
        color: #999;
      }
    }
  }

  .pagination-content {
    margin-top: 16px;
  }
}
</style>
