<template>
  <div id="detail">
    <n-scrollbar style="max-height: calc(100vh - 58px)">
      <div class="pre-view">
        <div class="article-title">
          <h1>{{ title }}</h1>
          <div class="article-info">
            <span>作者：{{ author }}</span>
            <span>发布时间：{{ time }}</span>
          </div>
          <div class="campaigns" v-if="is_campaigns">
            <n-tag size="small" type="success">活动</n-tag>
            <span>下方可点击按钮可参与该活动</span>
          </div>
          <div class="action" v-if="is_campaigns">
            <n-button type="info" @click="handleConfirm">活动报名</n-button>
          </div>
        </div>
        <MdPreview :editorId="pid" :modelValue="text" />
      </div>
    </n-scrollbar>
    <!-- 评论区 -->
    <div class="comment">
      <div class="comment-title">
        <h2>评论区</h2>
      </div>
      <n-scrollbar style="max-height: calc(100vh - 220px)">
        <div class="comment-list">
          <div class="comment-item" v-for="item in commentList" :key="item.id">
            <n-card size="small">
              <div class="comment-header">
                <div class="user-avatar">
                  <img :src="item.image_url" alt="" />
                </div>
                <div class="info">
                  <div class="user-nickname">
                    {{ item.nickname }}
                  </div>
                  <div class="comment-time">
                    <n-time :time="item.create_time" />
                  </div>
                </div>
              </div>
              <div class="comment-content">
                <p>{{ item.content }}</p>
              </div>
            </n-card>
          </div>
        </div>
      </n-scrollbar>
      <div class="text">
        <n-input
          :placeholder="userStore.account ? '请输入评论' : '请登录'"
          :disabled="!userStore.account"
          type="textarea"
          size="small"
          :autosize="{
            minRows: 3,
            maxRows: 5,
          }"
          v-model:value="comment"
        />
        <div class="button" style="display: flex; justify-content: flex-end; margin-top: 8px">
          <n-button type="success" size="small" :disabled="!userStore.account" @click="addComment">发送</n-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { MdPreview } from "md-editor-v3";
import "md-editor-v3/lib/preview.css";
import { useRoute } from "vue-router";
import { getArticleDetailApi } from "@/apis/article";
import { useUserStore } from "@/store/userinfo";
import { addCommentApi, getCommentListApi } from "@/apis/comment";
import { useDialog, useMessage } from "naive-ui";

const pid = "preview-only";
const text = ref("# Hello Editor");
const route = useRoute(); // 获取路由对象
const id = ref(route.query.id); // 获取路由参数
const title = ref("");
const author = ref("");
const time = ref("");
const comment = ref("");
const user = ref();
const is_campaigns = ref(false);
const message = useMessage();
const dialog = useDialog();
const userStore = useUserStore();
const getArticleDetail = async () => {
  if (!id.value) return;
  const res = await getArticleDetailApi(id.value.toString());
  text.value = res.data.content;
  title.value = res.data.article_title;
  author.value = res.data.nickname;
  time.value = res.data.create_time;
  console.log(res.data.is_campaigns);
  user.value = res.data.user
  is_campaigns.value = res.data.is_campaigns == 1 ? true : false;
};
getArticleDetail();
// 新增评论
const addComment = async () => {
  const res = await addCommentApi(comment.value, id.value!.toString(), userStore.account.toString());
  if (res.code === 200) {
    message.success(res.msg);
    getCommentList();
  }
};
const commentList = ref<any>([]);
// 获取评论列表
const getCommentList = async () => {
  const res = await getCommentListApi(id.value!.toString());
  if (res.code === 200) {
    commentList.value = res.data;
  }
};
getCommentList();

const handleConfirm = () => {
  dialog.info({
    title: "注意",
    content: `活动报名成功后，请按照指定规则进行操作，否则将会被取消报名资格,
    报名之前请知悉该活动相关规定`,
    positiveText: "确定",
    negativeText: "不确定",
    onPositiveClick: () => {
      message.success("确定");
    },
    onNegativeClick: () => {
      message.error("不确定");
    },
  });
};
</script>

<style lang="scss" scoped>
#detail {
  margin: 0 8px;
  background-color: #eee;
  display: grid;
  grid-template-columns: 1fr 400px;

  .pre-view {
    flex: 1;
  }

  .article-title {
    padding: 20px;
    background-color: #fff;
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

  .comment {
    padding: 8px;
    display: flex;
    flex-direction: column;

    .comment-list {
      .comment-item {
        margin-bottom: 8px;

        .comment-header {
          display: flex;
          align-items: start;

          .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
            border: 1px solid #ccc;
            margin-right: 8px;

            img {
              width: 100%;
              height: 100%;
            }
          }

          .user-nickname {
            font-size: 14px;
            font-weight: bold;
          }

          .comment-time {
            font-size: 12px;
            color: #999;
          }
        }

        .comment-content {
          padding-top: 8px;
          background-color: #fff;
        }
      }
    }
  }
}

// 宽度小于768px
@media screen and (max-width: 768px) {
  #detail {
    grid-template-columns: 1fr;
    width: 100vw;
  }
}
</style>
