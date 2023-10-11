<template>
  <div id="article-list">
    <div class="filter-buttons">
      <n-space>
        <n-button size="small" type="info" @click="getCampaignList(0)">待审核</n-button>
        <n-button size="small" type="success" @click="getCampaignList(1)">已通过</n-button>
        <n-button size="small" type="error" @click="getCampaignList(2)">已拒绝</n-button>
      </n-space>
    </div>
    <n-table :bordered="true" :single-line="true" size="small" striped>
      <thead>
        <tr>
          <th>活动标题</th>
          <th>报名人</th>
          <th>当前状态</th>
          <th style="width: 200px; text-align: center">操作</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in campaignList" :key="item.id">
          <td>{{ item.campaign }}</td>
          <td>{{ item.user }}</td>
          <td>
            <n-tag v-if="item.status == 1" size="small" type="success">已同意</n-tag>
            <n-tag v-if="item.status == 2" size="small" type="error">已拒绝</n-tag>
            <n-tag v-if="item.status == 0" size="small" type="info">待审核</n-tag>
          </td>
          <td style="display: flex; align-items: center; justify-content: center">
            <n-button v-if="item.status !== 1" quaternary type="warning" @click="agreeJoin(item.campaignId)">同意</n-button>
            <n-button v-if="item.status !== 2" quaternary type="warning" @click="refuseJoin(item.campaignId)">拒绝</n-button>
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
import { getCampaignJoinApi, agreeJoinApi, refuseJoinApi } from "@/apis/campaign";
import { useMessage } from "naive-ui";
import { useUserStore } from "@/store/userinfo";
let page = 1;
let pageSize = 12;
const count = ref(0);
const status = ref(0);
const message = useMessage();
const userStore = useUserStore();
interface CampaignList {
  id: number;
  user: string;
  campaign: string;
  status: number;
  campaignId: number;
}
const campaignList = ref<CampaignList[]>([]);
// 获取待审核活动列表
const getCampaignList = async (statusRef: number) => {
  status.value = statusRef;
  const res = await getCampaignJoinApi(status.value, page, pageSize);
  campaignList.value = res.data;
  count.value = res.data.total;
};
// 初始化获取文章列表
getCampaignList(status.value);
// 分页触发事件
const changePage = (val: number) => {
  page = val;
  getCampaignList(status.value);
};

// 同意参加活动
const agreeJoin = async (campaignId: number | string) => {
  const res = await agreeJoinApi(campaignId, userStore.account);
  if (res.code === 200) {
    message.success(res.msg);
    getCampaignList(status.value);
  } else {
    message.error(res.msg);
  }
};

// 拒绝参加活动
const refuseJoin = async (campaignId: number | string) => {
  const res = await refuseJoinApi(campaignId, userStore.account);
  if (res.code === 200) {
    message.success(res.msg);
    getCampaignList(status.value);
  } else {
    message.error(res.msg);
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
