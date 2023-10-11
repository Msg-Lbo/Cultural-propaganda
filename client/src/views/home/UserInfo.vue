<template>
  <div id="user-info">
    <n-scrollbar style="max-height: 70vh">
      <div class="headimg">
        <div class="upload">
          <n-upload
            action="http://127.0.0.1:9090/api/user/upload-avatar"
            @before-upload="beforeUpload"
            :show-file-list="false"
            @finish="handleFinish"
          >
            <img :src="avatar_url" alt="" srcset="" />
          </n-upload>
        </div>
      </div>
      <div class="user-form">
        <n-form
          ref="formRef"
          :model="userModel"
          style="width: 50%"
          :rules="userRules"
          label-placement="left"
          label-width="auto"
          require-mark-placement="left"
        >
          <n-form-item path="id" label="UID">
            <n-input v-model:value="userModel.id" disabled />
          </n-form-item>
          <n-form-item path="password" label="密码">
            <n-button @click="openUpdate">修改密码</n-button>
          </n-form-item>
          <n-form-item path="account" label="账号">
            <n-input v-model:value="userModel.account" disabled />
          </n-form-item>
          <n-form-item path="nickname" label="昵称">
            <n-input v-model:value="userModel.nickname" />
          </n-form-item>
          <n-form-item path="email" label="邮箱">
            <n-input v-model:value="userModel.email" />
          </n-form-item>
          <n-form-item path="sex" label="性别">
            <n-radio-group v-model:value="userModel.sex" name="radiogroup">
              <n-space>
                <n-radio v-for="song in songs" :key="song.value" :value="song.value">
                  {{ song.label }}
                </n-radio>
              </n-space>
            </n-radio-group>
          </n-form-item>
          <n-form-item ref="identity" label="身份">
            <n-input v-model:value="userModel.identity" disabled />
          </n-form-item>
          <div style="display: flex; justify-content: flex-end">
            <n-button round type="primary" @click="saveClick"> 保存 </n-button>
          </div>
        </n-form>
      </div>
    </n-scrollbar>
  </div>
  <update-pwd ref="updatePassword" />
</template>

<script setup lang="ts">
import { FormRules, UploadFileInfo, useMessage } from "naive-ui";
import { bindAvatarApi, updateUserInfoApi } from "@/apis/user";
import { useUserStore } from "@/store/userinfo";
import updatePwd from "./components/UpdatePassword.vue";
import { ref } from "vue";
const userStore = useUserStore();
const message = useMessage();
const avatar_url = ref(userStore.image_url);
// 用户信息
const userModel = ref({
  id: userStore.id.toString(),
  account: userStore.account,
  nickname: userStore.nickname,
  email: userStore.email,
  sex: userStore.sex,
  identity: userStore.identity,
});
// 规则
const userRules: FormRules = {
  nickname: [
    {
      required: true,
      message: "请输入昵称",
      trigger: "blur",
    },
    {
      pattern: /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,10}$/,
      message: "昵称只能是2-10位中文、英文、数字或下划线",
      trigger: "blur",
    },
  ],
  email: [
    {
      required: true,
      message: "请输入邮箱",
      trigger: "blur",
    },
    {
      type: "email",
      message: "请输入正确的邮箱地址",
      trigger: ["input", "blur"],
    },
  ],
  sex: [
    {
      required: true,
    },
  ],
};

const songs = [
  {
    value: "男",
    label: "男",
  },
  {
    value: "女",
    label: "女",
  },
];

// 头像上传成功回调
const handleFinish = async ({ event }: { event?: ProgressEvent }) => {
  const res = JSON.parse((event?.target as XMLHttpRequest).response);
  if (res.code === 200) {
    avatar_url.value = res.data.image_url;
    userStore.$patch({
      image_url: res.data.image_url,
    });
    // 绑定用户头像
    const bindRes = await bindAvatarApi(userStore.account, res.data.only_id, res.data.image_url);
    if (bindRes.code === 200) {
      message.success(bindRes.msg);
    }
  }
};

// 图片上传之前
const beforeUpload = async (data: { file: UploadFileInfo; fileList: UploadFileInfo[] }) => {
  if (data.file.file?.type !== "image/png" && data.file.file?.type !== "image/jpeg") {
    message.error("只能上传png或jpeg格式的图片文件，请重新上传");
    return false;
  }
  return true;
};

// 保存用户信息
const saveClick = async () => {
  const res = await updateUserInfoApi(userModel.value);
  if (res.code === 200) {
    message.success(res.msg);
    userStore.nickname = userModel.value.nickname;
    userStore.email = userModel.value.email;
    userStore.sex = userModel.value.sex;
  }
};

const updatePassword = ref();
const openUpdate = () => {
  updatePassword.value.open();
};
</script>

<style lang="scss" scoped>
#user-info {
  padding: 0 8px;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.user-form {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
}

.headimg {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;

  .upload {
    display: flex;
    align-items: center;
    border-radius: 50%;

    img {
      position: relative;
      width: 100px;
      height: 100px;
      border: 1px dashed #ccc;
      border-radius: 50%;

      &:hover::after {
        position: absolute;
        content: "更换头像";
        text-align: center;
        top: -1px;
        // left: -1px;
        line-height: 100px;
        color: #fff;
        font-size: 15px;
        transform: translate(-100%);
        width: 100px;
        height: 100px;
        background-color: #00000050;
      }
    }
  }
}

::v-deep(.n-form-item.n-form-item--top-labelled) {
  grid-template-rows: none;
}
</style>
