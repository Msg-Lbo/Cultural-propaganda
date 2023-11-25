<template>
  <div id="article-list">
    <n-table :bordered="true" :single-line="true" size="small" striped>
      <thead>
        <tr>
          <th>标题</th>
          <th>分类</th>
          <th>评论</th>
          <th>状态</th>
          <th style="width: 200px; text-align: center">操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in articleList" :key="item.id">
          <td>{{ item.article_title }}</td>
          <td>{{ item.category_name }}</td>
          <td>{{ item.comment_count }}</td>
          <td>
            <n-tag type="warning" size="small" v-if="item.is_check == 0">待审核</n-tag>
            <n-tag type="success" size="small" v-if="item.is_check == 1">通过</n-tag>
            <n-tag type="error" size="small" v-if="item.is_check == 2">驳回</n-tag>
          </td>
          <td style="display: flex; align-items: center; justify-content: center">
            <n-button quaternary type="warning" @click="isCheck(item.id, 2)">驳回</n-button>
            <n-button quaternary type="success" @click="isCheck(item.id, 1)">通过</n-button>
          </td>
        </tr>
      </tbody>
    </n-table>
    <div class="pagination">
      <n-pagination :page-count="count" :on-update:page="changePage" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { getArticleListApi, checkArticleApi } from "@/apis/article";
import { useMessage } from "naive-ui";
let page = 1;
let pageSize = 12;
const count = ref(0);
const message = useMessage();
interface ArticleList {
  id: number;
  article_title: string;
  cover: string;
  content: string;
  category_id: number;
  category_name: string;
  comment_count: number;
  author: string;
  create_time: string;
  update_time: string;
  is_check: number;
  is_top: number;
}
const articleList = ref<ArticleList[]>([]);
// 获取文章列表
const getArticleList = async () => {
  const res = await getArticleListApi(-1, page, pageSize, -1);
  articleList.value = res.data.list;
  count.value = res.data.total;
};
// 初始化获取文章列表
getArticleList();
// 分页触发事件
const changePage = (val: number) => {
  page = val;
  getArticleList();
};
// 审核文章
const isCheck = async (id: number, is_check: number) => {
  const res = await checkArticleApi(id, is_check);
  if (res.code === 200) {
    message.success(res.msg);
    getArticleList();
  }
};
</script>

<style lang="scss" scoped>
#article-list {
  height: 72vh;
  position: relative;

  .pagination {
    position: absolute;
    bottom: 0;
  }
}
</style>
