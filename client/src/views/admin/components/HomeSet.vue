<template>
  <div id="home-set">
    <n-scrollbar style="max-height: 70vh">
      <n-form
        ref="formRef"
        :model="submitFormRef"
        label-placement="left"
        label-width="auto"
        require-mark-placement="left"
      >
        <n-form-item path="search" label="搜索文章">
          <n-input v-model:value="keywords" @update:value="handleSearch"></n-input>
        </n-form-item>
        <n-form-item path="carousel" label="首页轮播图">
          <div style="width: 100%">
            <n-space vertical>
              <n-card size="small">
                <n-space item-style="display: flex;" align="center">
                  <template v-for="item in submitFormRef.carousel" :key="item.id">
                    <n-tag
                      type="success"
                      closable
                      v-if="item.article_title"
                      :key="item.id"
                      @close="removeId(submitFormRef.carousel, item.id)"
                    >
                      {{ item.article_title }}
                    </n-tag>
                  </template>
                </n-space>
              </n-card>
              <n-card size="small" v-if="articleList">
                <n-checkbox-group v-model:value="submitFormRef.carousel" @update:value="handleUpdateValue">
                  <n-space item-style="display: flex;" align="center">
                    <temolate v-for="item in articleList" :key="item.id">
                      <n-tag type="info" v-if="!articleList.includes(item)">
                        <n-checkbox :value="item.id" :label="item.article_title" />
                      </n-tag>
                    </temolate>
                  </n-space>
                </n-checkbox-group>
              </n-card>
            </n-space>
          </div>
        </n-form-item>
        <n-form-item path="recommend" label="推荐文章">
          <div style="width: 100%">
            <n-space vertical>
              <n-card size="small">
                <n-checkbox-group>
                  <n-space item-style="display: flex;" align="center">
                    <template v-for="item in submitFormRef.recommend" :key="item.id">
                      <n-tag
                        type="success"
                        closable
                        v-if="item.article_title"
                        @close="removeId(submitFormRef.recommend, item.id)"
                      >
                        {{ item.article_title }}
                      </n-tag>
                    </template>
                  </n-space>
                </n-checkbox-group>
              </n-card>
              <n-card size="small" v-if="articleList">
                <n-checkbox-group v-model:value="submitFormRef.recommend" @update:value="handleUpdateValue">
                  <n-space item-style="display: flex;" align="center">
                    <n-tag type="info" v-for="item in articleList">
                      <n-checkbox :value="item.id" :label="item.article_title" />
                    </n-tag>
                  </n-space>
                </n-checkbox-group>
              </n-card>
            </n-space>
          </div>
        </n-form-item>
        <n-form-item path="accoinformationunt" label="热门资讯">
          <div style="width: 100%">
            <n-space vertical>
              <n-card size="small">
                <n-checkbox-group>
                  <n-space item-style="display: flex;" align="center">
                    <template v-for="item in submitFormRef.information">
                      <n-tag
                        type="success"
                        closable
                        v-if="item.article_title"
                        :key="item.id"
                        @close="removeId(submitFormRef.information, item.id)"
                      >
                        {{ item.article_title }}
                      </n-tag>
                    </template>
                  </n-space>
                </n-checkbox-group>
              </n-card>
              <n-card size="small" v-if="articleList">
                <n-checkbox-group v-model:value="submitFormRef.information" @update:value="handleUpdateValue">
                  <n-space item-style="display: flex;" align="center">
                    <n-tag type="info" v-for="item in articleList">
                      <n-checkbox :value="item.id" :label="item.article_title" />
                    </n-tag>
                  </n-space>
                </n-checkbox-group>
              </n-card>
            </n-space>
          </div>
        </n-form-item>
        <n-form-item path="campaigns" label="活动">
          <div style="width: 100%">
            <n-space vertical>
              <n-card size="small">
                <n-checkbox-group>
                  <n-space item-style="display: flex;" align="center">
                    <template v-for="item in submitFormRef.campaigns">
                      <n-tag
                        type="success"
                        closable
                        v-if="item.article_title"
                        :key="item.id"
                        @close="removeId(submitFormRef.campaigns, item.id)"
                      >
                        {{ item.article_title }}
                      </n-tag>
                    </template>
                  </n-space>
                </n-checkbox-group>
              </n-card>
              <n-card size="small" v-if="articleList">
                <n-checkbox-group v-model:value="submitFormRef.campaigns" @update:value="handleUpdateValue">
                  <n-space item-style="display: flex;" align="center">
                    <n-tag type="info" v-for="item in articleList">
                      <n-checkbox :value="item.id" :label="item.article_title" />
                    </n-tag>
                  </n-space>
                </n-checkbox-group>
              </n-card>
            </n-space>
          </div>
        </n-form-item>
        <div style="display: flex; justify-content: flex-end">
          <n-button round type="primary" @click="onSave"> 验证 </n-button>
        </div>
      </n-form>
    </n-scrollbar>
  </div>
</template>

<script setup lang="ts">
import { searchArticleApi } from "@/apis/article";
import { saveHomeSettingApi, getHomeSettingApi } from "@/apis/settings";
import { useMessage } from "naive-ui";
import { ref } from "vue";

const message = useMessage();
const articleList = ref<(string | number)[] | any>();
const keywords = ref("");

const submitFormRef = ref<any>({
  carousel: [],
  recommend: [],
  information: [],
  campaigns: [],
});

const handleUpdateValue = (value: (string | number)[]) => {
  // message.info(JSON.stringify(value));
};
// 搜索文章
const handleSearch = async (query: string) => {
  if (query === "" || query === undefined || query === null) {
    articleList.value = null;
    return;
  }
  const res = await searchArticleApi(query);
  if (res.code === 200) {
    articleList.value = res.data.map((item: { id: number; article_title: string }) => {
      return {
        id: item.id,
        article_title: item.article_title,
      };
    });
  }
};
// 剔除数组中指定id的元素
const removeId = (arr: any[], id: number) => {
  const index = arr.findIndex((item) => item.id === id);
  arr.splice(index, 1);
};

// 提取数组中的id
const extractId = (arr: any[]) => {
  return arr.map((item) => {
    // 如果没有id，则返回原值
    return item.id !== undefined ? item.id : item;
  });
};

// 保存设置
const onSave = async () => {
  submitFormRef.value.carousel = extractId(submitFormRef.value.carousel);
  submitFormRef.value.recommend = extractId(submitFormRef.value.recommend);
  submitFormRef.value.information = extractId(submitFormRef.value.information);
  submitFormRef.value.campaigns = extractId(submitFormRef.value.campaigns);
  const res = await saveHomeSettingApi(submitFormRef.value);
  if (res.code === 200) {
    getHomeSettings();
    message.success(res.msg);
    articleList.value = null;
    keywords.value = "";
  }
};

// 获取设置
const getHomeSettings = async () => {
  const res = await getHomeSettingApi();
  if (res.code === 200) {
    submitFormRef.value = res.data;
    console.log(submitFormRef.value.carousel);
  }
};
getHomeSettings();
</script>

<style lang="scss" scoped></style>
