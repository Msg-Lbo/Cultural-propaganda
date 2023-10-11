<template>
  <div id="recommend">
    <div class="title">
      <span>推荐</span>
    </div>
    <div class="content">
      <div class="card-list">
        <div class="card-item" v-for="item in recommend" :key="item.id">
          <n-card size="small" hoverable @click="toArticle(item.id)">
            <template #cover>
              <img style="height: 150px" :src="item.cover" />
            </template>
            {{ item.article_title }}
            <template #footer>
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
            </template>
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
const recommend = ref<any>([]);

const props = defineProps({
  recommendList: Array,
});
onMounted(() => {
  recommend.value = props.recommendList;
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
#recommend {
  .title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
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
      grid-template-columns: repeat(4, 1fr);
      gap: 8px;

      .card-item {
        cursor: pointer;

        ::v-deep(.n-card) {
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
            }
          }
        }
      }
    }
  }
}
</style>
