<template>
  <div id="article-list">
    <n-table :bordered="true" :single-line="true" size="small" striped>
      <thead>
        <tr>
          <th>标题</th>
          <th>参与人数</th>
          <th>开始时间</th>
          <th>结束时间</th>
          <th style="width: 200px; text-align: center">操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in campaignList" :key="item.id">
          <td>{{ item.title }}</td>
          <td>{{ item.join_num || 0 }}</td>
          <td>
            <n-time :time="item.start_time"></n-time>
          </td>
          <td>
            <n-time :time="item.end_time"></n-time>
          </td>
          <td style="display: flex; align-items: center; justify-content: center">
            <n-button quaternary type="warning" @click="toArticle(item.id)">查看</n-button>
            <n-button quaternary type="warning" @click="editCampaign(item.id)">编辑</n-button>
            <n-popconfirm>
              <template #trigger>
                <n-button quaternary type="error">删除</n-button>
              </template>
              删除后无法恢复,确定删除吗?
              <template #action>
                <n-button type="error" size="small" @click="handleDelete(item.id)">确定</n-button>
              </template>
            </n-popconfirm>
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
import { getCampaignListApi, deleteCampaignApi } from "@/apis/campaign";
import { useMessage } from "naive-ui";
import router from "@/router";
let page = 1;
let pageSize = 12;
const count = ref(0);
const message = useMessage();
interface CampaignList {
  id: number;
  title: string;
  join_num: number;
  cover: string;
  content: string;
  author: string;
  start_time: string;
  end_time: string;
}
const campaignList = ref<CampaignList[]>([]);
// 获取活动列表
const getCampaignList = async () => {
  const res = await getCampaignListApi(page, pageSize);
  campaignList.value = res.data.campaignsList;
  count.value = res.data.total;
};
// 初始化获取文章列表
getCampaignList();
// 编辑文章,传入ID
const editCampaign = (id: number) => {
  selectTabs(id);
};
// 分页触发事件
const changePage = (val: number) => {
  page = val;
  getCampaignList();
};
// 使用defineEmits定义事件, 使用emits触发事件,向父组件传递数据
const emits = defineEmits(["selectTabs"]);
// 接受ID,触发事件,向父组件发送数据
const selectTabs = (id: number) => {
  emits("selectTabs", {
    tab: "add",
    id: id,
  });
};
// 删除文章
const handleDelete = async (id: number) => {
  const res = await deleteCampaignApi(id);
  if (res.code === 200) {
    message.success(res.msg);
    getCampaignList();
  }
};
const toArticle = (id: number) => {
  // 路由传参
  router.push({
    path: "/campaign-detail",
    query: {
      id: id,
    },
  });
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
