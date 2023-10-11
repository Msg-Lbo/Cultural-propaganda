<template>
  <div id="campaigns">
    <n-card style="margin-bottom: 16px">
      <n-h1 style="text-align: center">活动</n-h1>
      <n-scrollbar style="max-height: 85vh">
        <div class="article-list-container">
          <n-card
            class="article-content"
            v-for="item2 in CampaignList"
            :title="item2.title"
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
                  <n-icon><fire-outlined /></n-icon>{{ item2.join_num }}
                </span>
              </div>
            </div>
          </n-card>
        </div>
      </n-scrollbar>
      <div class="pagination-content">
        <n-pagination v-model:page="page" :page-count="total" :on-update:page="handlePage" />
      </div>
    </n-card>
  </div>
</template>

<script setup lang="ts">
import {
  LocalFireDepartmentOutlined as fireOutlined,
} from "@vicons/material";
import { getCampaignListApi } from "@/apis/campaign";
import { ref } from "vue";
import router from "@/router";

const page = ref(1);
const pageSize = ref(8);
const total = ref(0);

// 获取指定分类文章
const CampaignList = ref<any>([]);
const getCampaignList = async () => {
  const res = await getCampaignListApi(page.value, pageSize.value);
  if (res.code === 200) {
    CampaignList.value = res.data.campaignsList;
    total.value = res.data.total;
  }
};
getCampaignList()
// 分页切换
const handlePage = (e: number) => {
  page.value = e;
  getCampaignList();
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
#campaigns {
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

// 宽度小于 768px 时
@media screen and (max-width: 768px) {
  ::v-deep(.n-h1) {
    display: none;
  }

  #campaigns {
    .article-list-container {
      grid-template-columns: 1fr;
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
}
</style>
