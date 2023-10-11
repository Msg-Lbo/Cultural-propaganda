<template>
  <div id="detail">
    <n-scrollbar style="max-height: calc(100vh - 58px)">
      <div class="pre-view">
        <div class="article-title">
          <h1>{{ title }}</h1>
          <div class="article-info">
            <span>作者：{{ author }}</span>
            <span>开始时间:<n-time :time="start_time" /> </span>
            <span>结束时间:<n-time :time="end_time" /></span>
          </div>
          <div class="campaigns">
            <n-tag size="small" type="success">活动</n-tag>
            <span>下方可点击按钮可参与该活动</span>
          </div>
          <div class="action">
            <n-button type="info" @click="showModal = true">活动报名</n-button>
          </div>
        </div>
        <MdPreview :editorId="pid" :modelValue="text" />
      </div>
    </n-scrollbar>
    <n-modal
      v-model:show="showModal"
      class="custom-card"
      style="width: 500px"
      preset="card"
      title="注意事项"
      size="huge"
      :bordered="false"
    >
      <div>1.活动报名成功后，请按照指定规则进行操作</div>
      <div>2.报名成功后需要人工审核,审核通过后方可参与活动</div>
      <div>3.活动结束后，将会根据活动规则进行奖励发放</div>
      <div>4.请遵守活动规则，否则将会被取消报名资格</div>
      <div class="actions" style="display: flex; justify-content: center; margin-top: 20px">
        <n-button @click="joinCampaign" type="success">确定</n-button>
      </div>
    </n-modal>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { MdPreview } from "md-editor-v3";
import "md-editor-v3/lib/preview.css";
import { useRoute } from "vue-router";
import { getCampaignDetailApi, joinCampaignApi } from "@/apis/campaign";
import { useMessage } from "naive-ui";
import { useUserStore } from "@/store/userinfo";

const pid = "preview-only";
const text = ref("# Hello Editor");
const route = useRoute(); // 获取路由对象
const id = ref(route.query.id); // 获取路由参数
const title = ref("");
const author = ref("");
const start_time = ref(0);
const end_time = ref(0);
const message = useMessage();
const userStore = useUserStore();
const showModal = ref(false);
const getArticleDetail = async () => {
  if (!id.value) return;
  const res = await getCampaignDetailApi(id.value);
  text.value = res.data.content;
  title.value = res.data.title;
  author.value = res.data.author;
  start_time.value = res.data.start_time;
  end_time.value = res.data.end_time;
};
getArticleDetail();

// 参与活动
const joinCampaign = async () => {
  const res = await joinCampaignApi(id.value!, userStore.account);
  if (res.code === 200) {
    if (res.status === 0) {
      message.warning(res.msg);
      showModal.value = false;
    } else if (res.status === 2) {
      message.error(res.msg);
      showModal.value = false;
    } else if (res.status === 1) {
      message.success(res.msg);
      showModal.value = false;
    } else {
      message.success(res.msg);
      showModal.value = false;
    }
  } else {
    message.error(res.msg);
  }
};
</script>

<style lang="scss" scoped>
#detail {
  margin: 0 8px;

  height: calc(100vh - 58px);
  .pre-view {
    flex: 1;
  }

  .article-title {
    padding: 20px;
    // background-color: #eee;
    text-align: center;

    h1 {
      font-size: 24px;
      font-weight: bold;
    }

    .article-info {
      display: flex;
      justify-content: space-around;

      span {
        font-size: 12px;
        color: #999;
      }
    }
    .campaigns {
      display: flex;
      align-items: flex-start;
      flex-direction: column;
      // 换行
      flex-wrap: wrap;
      span {
        font-size: 12px;
        color: #999;
      }
    }
  }
  .custom-card {
    width: 500px;
    .actions {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }
  }
}
</style>
