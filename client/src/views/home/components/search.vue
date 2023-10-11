<template>
  <div id="search-model">
    <n-modal
      v-model:show="state.searchModel"
      :mask-closable="false"
      class="custom-card"
      preset="card"
      style="width: 70%; height: 700px"
      title="文章搜索"
      size="huge"
      :bordered="false"
    >
      <template #header-extra> 关闭搜索点这里👉 </template>
      <div class="search">
        <n-input-group>
          <n-input round :style="{ width: '100%' }" v-model:value="keyWord">
            <template #suffix>
              <n-icon :component="searchIcon" />
            </template>
          </n-input>
          <n-button round type="primary" ghost @click="searchArticle"> 搜索 </n-button>
        </n-input-group>
      </div>
      <div class="tips" v-if="articleList.length <= 1">关键词是根据文章标题来搜索的哦</div>
      <n-scrollbar style="max-height: 500px">
        <div class="article-list">
          <div class="card-item" v-for="item in articleList" :key="item.id">
            <n-card size="small" hoverable @click="toArticle(item.id)">
              <div class="article-content">
                <div class="article-cover">
                  <img style="height: 100px; width: 200px" :src="item.cover" />
                </div>
                <div class="text-content">
                  <div class="article-title">
                    <n-ellipsis style="max-width: 450px" :tooltip="false">
                      <span>{{ item.article_title }}</span>
                    </n-ellipsis>
                  </div>
                  <div class="article-des">
                    <n-ellipsis style="max-width: 450px" :line-clamp="2" :tooltip="false">
                      <span>{{ item.des }}</span>
                    </n-ellipsis>
                  </div>
                  <div class="article-footer">
                    <div class="icons">
                      <span class="icon">
                        <n-icon><people-outlined /></n-icon>{{ item.nickname }}
                      </span>
                      <span class="icon">
                        <n-icon><message-icon /></n-icon>{{ item.comment_count }}
                      </span>
                      <span class="icon">
                        <n-icon><emoji-outlined /></n-icon>{{ item.like }}
                      </span>
                      <span class="icon">
                        <n-icon><fire-outlined /></n-icon>{{ item.num_read }}
                      </span>
                    </div>
                    <div class="time">2021-09-11</div>
                  </div>
                </div>
              </div>
            </n-card>
          </div>
        </div>
      </n-scrollbar>
    </n-modal>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import {
  SearchOutlined as searchIcon,
  MessageOutlined as messageIcon,
  LocalFireDepartmentOutlined as fireOutlined,
  EmojiEmotionsOutlined as emojiOutlined,
  EmojiPeopleOutlined as peopleOutlined,
} from "@vicons/material";
import router from "@/router";
import { searchArticleApi } from "@/apis/article";
import { useMessage } from "naive-ui";
const state = ref({
  searchModel: false,
});
const keyWord = ref("");
const articleList = ref<any>([]);
const message = useMessage();
// 模糊搜索文章
const searchArticle = async () => {
  const res = await searchArticleApi(keyWord.value);
  if (res.code === 200) {
    message.success(res.msg);
    articleList.value = res.data;
  }
};

const toArticle = (id: number) => {
  state.value.searchModel = false;
  // 路由传参
  router.push({
    path: "/detail",
    query: {
      id: id,
    },
  });
};
const open = () => {
  state.value.searchModel = true;
};
defineExpose({
  open,
});
</script>

<style lang="scss" scoped>
.search {
  display: flex;
  justify-content: center;

  ::v-deep(.n-input-group) {
    width: 50%;
  }
}
.tips {
  display: flex;
  justify-content: center;
  margin-top: 10px;
  color: #999;
  font-size: 14px;
}
.article-list {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 8px;
  justify-content: center;
  margin-top: 8px;
  .card-item {
    cursor: pointer;

    ::v-deep(.n-card) {
      .article-content {
        display: flex;
        align-items: center;
        padding: 5px;

        .article-title {
          margin-left: 8px;
          font-size: 16px;
          font-weight: 700;
        }

        .article-des {
          margin-left: 8px;
          font-size: 14px;
          font-weight: 400;
        }

        .article-footer {
          display: flex;
          align-items: center;
          margin-left: 8px;

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

        .article-cover {
          img {
            border-radius: 5px;
          }
        }
      }

      .n-card__content {
        padding: 0;
      }
    }

    .text-content {
    }
  }
}
</style>
