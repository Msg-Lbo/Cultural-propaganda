<template>
  <div id="update-password">
    <n-modal v-model:show="state.forgetModel" preset="card" style="width: 400px" title="忘记密码">
      <div>
        <n-form :model="forgetForm" :rules="forgetRules">
          <n-form-item-row label="账号" path="account">
            <n-input v-model:value="forgetForm.account" />
          </n-form-item-row>
          <n-form-item-row label="输入旧密码" path="oldPassword">
            <n-input type="password" v-model:value="forgetForm.oldPassword" />
          </n-form-item-row>
          <n-form-item-row label="输入新密码" path="newPassword">
            <n-input type="newPassword" v-model:value="forgetForm.newPassword" />
          </n-form-item-row>
        </n-form>
      </div>
      <template #action>
        <div class="changeButton">
          <n-button color="#7bed9f" block strong @click="changePassword">修改</n-button>
        </div>
      </template>
    </n-modal>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { FormRules, useMessage } from "naive-ui";
import { changePasswordApi } from "@/apis/user";
import router from "@/router";
import { useUserStore } from "@/store/userinfo";
interface ForgetForm {
  account: string;
  oldPassword: string;
  newPassword: string;
}
const message = useMessage();
const userStore = useUserStore();
const forgetForm = ref<ForgetForm>({
  account: "",
  oldPassword: "",
  newPassword: "",
});
const forgetRules: FormRules = {
  account: [{ required: true, message: "请输入账号", trigger: "blur" }],
  oldPassword: [{ required: true, message: "请输入旧密码", trigger: "blur" }],
  newPassword: [{ required: true, message: "请输入新密码", trigger: "blur" }],
};
const state = ref({
  forgetModel: false,
});
const open = () => {
  state.value.forgetModel = true;
};
// 修改密码
const changePassword = async () => {
  const { account, oldPassword, newPassword } = forgetForm.value;
  if (!account || !oldPassword || !newPassword) {
    return message.error("请填写完整信息");
  }
  const res = await changePasswordApi(forgetForm.value);
  if (res.code === 200) {
    message.success("修改成功");
    state.value.forgetModel = false;
    router.push("/login");
    userStore.logout();
  }
};
defineExpose({
  open,
});
</script>

<style lang="scss" scoped></style>
