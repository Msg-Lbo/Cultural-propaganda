<template>
  <div id="about" v-if="text">
    <n-scrollbar style="max-height: calc(100vh - 58px)">
      <md-editor
        v-if="userstore.identity === '管理员'"
        v-model="text"
        @onUploadImg="onUploadImg"
        @onSave="onSaveAbout()"
        style="height: 670px"
      />
      <MdPreview :modelValue="text" />
    </n-scrollbar>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { MdPreview, MdEditor } from "md-editor-v3";
import "md-editor-v3/lib/preview.css";
import "md-editor-v3/lib/style.css";
import { uploadArticleImageApi } from "@/apis/article";
import { useUserStore } from "@/store/userinfo";
import { updateAboutApi, getAboutApi } from "@/apis/about";
import { useMessage } from "naive-ui/es/message";

const userstore = useUserStore();
const text = ref();
const message = useMessage();
// 文章内容图片上传
const onUploadImg = async (files: any[], callback: any) => {
  const res = await Promise.all(
    files.map((file) => {
      return new Promise(async (rev, _rej) => {
        const form = new FormData();
        form.append("file", file);
        const res = await uploadArticleImageApi(form);
        if (res.code === 200) {
          rev(res);
          console.log(res);
        }
      });
    })
  );
  callback(res.map((item: any) => item.data.image_url));
};
const onSaveAbout = async () => {
  const res = await updateAboutApi(text.value);
  if (res.code === 200) {
    message.success(res.msg);
    getAbout();
  }
};
// 获取关于
const getAbout = async () => {
  const res = await getAboutApi();
  if (res.code === 200) {
    text.value = res.data[0].content;
  }
};
getAbout();
</script>

<style lang="scss" scoped>
#about {
  padding: 0 8px;
}
</style>
