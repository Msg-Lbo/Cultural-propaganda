<template>
  <n-scrollbar style="max-height: 72vh">
    <div id="article">
      <div class="article-content">
        <div class="header">
          <div class="title-content">
            <n-form ref="formRef" :label-width="80" :model="campaignForm" require-mark-placement="left">
              <n-form-item label="活动标题" path="title">
                <n-input v-model:value="campaignForm.title" placeholder="输入标题" />
              </n-form-item>
              <n-form-item label="开始时间" path="start_time">
                <n-date-picker style="width: 100%" v-model:value="campaignForm.start_time" type="datetime" clearable />
              </n-form-item>
              <n-form-item label="结束时间" path="end_time">
                <n-date-picker style="width: 100%" v-model:value="campaignForm.end_time" type="datetime" clearable />
              </n-form-item>
            </n-form>
          </div>
          <div class="cover-content">
            <div class="label">活动封面:</div>
            <img
              v-if="campaignForm.cover"
              :src="campaignForm.cover"
              alt=""
              style="width: 240px; height: 180px; border: 1px dashed #eee"
            />
            <div v-else style="width: 240px; height: 180px; border: 1px dashed; text-align: center; line-height: 180px">
              暂无封面
            </div>
            <div class="upload-content">
              <n-upload
                with-credentials
                action="http://127.0.0.1:9090/api/campaign/upload-cover"
                :default-upload="true"
                @before-upload="beforeUpload"
                @finish="handleFinish"
                :show-file-list="false"
              >
                <n-button>选择文件</n-button>
              </n-upload>
            </div>
          </div>
        </div>

        <md-editor
          v-model="campaignForm.content"
          @onUploadImg="onUploadImg"
          @onSave="props.editId ? onUpdate() : onSave()"
          style="height: 670px"
        />
      </div>
    </div>
  </n-scrollbar>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { MdEditor } from "md-editor-v3";
import "md-editor-v3/lib/style.css";
import { UploadFileInfo, useMessage } from "naive-ui";
import { publishCampaignApi, uploadImgApi, updateCampaignApi, getCampaignDetailApi } from "@/apis/campaign";
import { useUserStore } from "@/store/userinfo";

const message = useMessage();
const userStore = useUserStore();
const campaignForm = ref({
  id: 0,
  title: "",
  start_time: Date.now(),
  cover: "",
  content: "",
  end_time: Date.now(),
  author: userStore.account,
});
// 父组件传递过来的id
const props = defineProps({
  editId: {
    type: Number,
    default: 0,
  },
});
// 或者文章详情
const geCampaignDetail = async () => {
  const res = await getCampaignDetailApi(props.editId);
  if (res.code === 200) {
    campaignForm.value = res.data;
    console.log(campaignForm.value);
  }
};
// 如果有id，就获取文章详情
if (props.editId) {
  geCampaignDetail();
}

// 封面上传成功回调
const handleFinish = async ({ event }: { event?: ProgressEvent }) => {
  const res = await JSON.parse((event?.target as XMLHttpRequest).response);
  if (res.code === 200) {
    message.success(res.msg);
    campaignForm.value.cover = res.data.image_url; // 获取上传成功后的URL
    return;
  }
  message.error(res.msg);
};
// 提交文章
const onSave = async () => {
  // 如果表单为空
  if (
    !campaignForm.value.title ||
    !campaignForm.value.start_time ||
    !campaignForm.value.end_time ||
    !campaignForm.value.cover ||
    !campaignForm.value.content
  ) {
    message.error("请填写完整的文章信息");
    return;
  }
  const res = await publishCampaignApi(campaignForm.value);
  if (res.code === 200) {
    message.success(res.msg);
  }
};
// 更新文章
const onUpdate = async () => {
  // 如果表单为空
  if (
    !campaignForm.value.title ||
    !campaignForm.value.start_time ||
    !campaignForm.value.end_time ||
    !campaignForm.value.cover ||
    !campaignForm.value.content
  ) {
    message.error("请填写完整的文章信息");
    return;
  }
  const res = await updateCampaignApi(campaignForm.value);
  if (res.code === 200) {
    message.success(res.msg);
  }
};
// 封面上传之前
const beforeUpload = async (data: { file: UploadFileInfo; fileList: UploadFileInfo[] }) => {
  if (data.file.file?.type !== "image/png" && data.file.file?.type !== "image/jpeg") {
    message.error("只能上传png或jpeg格式的图片文件，请重新上传");
    return false;
  }
  return true;
};

// 文章内容图片上传
const onUploadImg = async (files: any[], callback: any) => {
  const res = await Promise.all(
    files.map((file) => {
      return new Promise(async (rev, _rej) => {
        const form = new FormData();
        form.append("file", file);
        const res = await uploadImgApi(form);
        if (res.code === 200) {
          rev(res);
          console.log(res);
        }
      });
    })
  );
  callback(res.map((item: any) => item.data.image_url));
};
</script>

<style lang="scss" scoped>
.header {
  background-color: #fff;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 8px;
  align-items: center;
  border: 1px solid #eee;
  margin-bottom: 8px;
  padding: 20px;
}

.cover-content {
  display: flex;
  align-items: center;

  ::v-deep(.n-button) {
    margin-left: 8px;
  }
}
</style>
