<template>
  <div id="hot-article">
    <div class="title">热门文章</div>
    <div class="content">
      <div class="card-list">
        <div class="card-item" v-for="item in hotArticle" :key="item.id">
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
                      <n-icon><message-outlined /></n-icon>{{ item.comment_count }}
                    </span>
                    <span class="icon">
                      <n-icon><fire-outlined /></n-icon>{{ item.num_read }}
                    </span>
                  </div>
                  <div class="time">
                    {{ item.create_time }}
                  </div>
                </div>
              </div>
            </div>
          </n-card>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import router from "@/router";
import {
  MessageOutlined,
  LocalFireDepartmentOutlined as fireOutlined,
  EmojiPeopleOutlined as peopleOutlined,
} from "@vicons/material";
import { onMounted, ref } from "vue";

// 获取热门文章列表
const hotArticle = ref<any>([]);
const props = defineProps({
  hotArticleList: Array,
});
onMounted(() => {
  hotArticle.value = props.hotArticleList;
});
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
#hot-article {
  .title {
    display: flex;
    align-items: center;
    height: 40px;
    background-color: #fff;
    border-bottom: 1px solid #e6e6e6;
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 8px;
  }

  .content {
    margin-bottom: 32px;

    .card-list {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 8px;

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
  }
}
</style>
