<template>
  <div id="top-menu">
    <div class="logo">
      <router-link to="/home" style="text-align: center; text-decoration: none; color: var(--n-item-text-color)">
        <div class="logo-titm" style="display: flex; align-items: center">
          <img src="../../../../public/logo.svg" alt="" style="width: 30px; height: 30px" />
          一个简单的文化宣传平台
        </div>
      </router-link>
    </div>
    <div class="menu-list">
      <n-menu v-model:value="activeKey" mode="horizontal" :options="menuOptions" @update-value="handleUpdateValue" />
    </div>
    <div class="search-button">
      <div class="search-box" @click="toSearch">
        <n-icon size="30">
          <search-icon />
        </n-icon>
        搜索
      </div>
    </div>
    <div class="user-box">
      <div class="headimg">
        <n-dropdown trigger="click" :options="userOptions" @select="handleSelect">
          <n-avatar round :size="42" :src="userStore.image_url" />
        </n-dropdown>
      </div>
    </div>
  </div>
  <search-model ref="search" />
</template>

<script setup lang="ts">
import router from "@/router";
import searchModel from "./search.vue";
import { MenuOption, NIcon } from "naive-ui";
import {
  HomeOutlined as homeIcon,
  CategoryOutlined as categoryIcon,
  CreateOutlined as createIcon,
  SearchOutlined as searchIcon,
  BeenhereOutlined as beenhereIcon,
  ManageAccountsOutlined as manageAccountsIcon,
  AccountCircleOutlined as accountCircleIcon,
  LogInOutlined as loginIcon,
  LogOutOutlined as logoutIcon,
} from "@vicons/material";
import { Component, ref, h } from "vue";
import { useUserStore } from "@/store/userinfo";
const userStore = useUserStore();
const activeKey = ref<string | null>(null);
function renderIcon(icon: Component) {
  return () => h(NIcon, null, { default: () => h(icon) });
}
const menuOptions: MenuOption[] = [
  {
    label: "首页",
    key: "home",
    icon: renderIcon(homeIcon),
  },
  {
    label: "分类",
    key: "category",
    icon: renderIcon(categoryIcon),
  },
  {
    label: "活动",
    key: "campaign",
    icon: renderIcon(categoryIcon),
  },
  {
    label: "创作中心",
    key: "Authoring",
    icon: renderIcon(createIcon),
    disabled: userStore.id == "",
  },
  {
    label: "关于",
    key: "about",
    icon: renderIcon(beenhereIcon),
  },
];
const userOptions: MenuOption[] = [
  {
    label: "控制台",
    key: "manager",
    icon: renderIcon(manageAccountsIcon),
    show: userStore.identity == "管理员",
  },
  {
    label: "登陆",
    key: "login",
    icon: renderIcon(loginIcon),
    show: userStore.id == "",
  },
  {
    label: "个人信息",
    key: "user",
    icon: renderIcon(accountCircleIcon),
    show: userStore.id !== "",
  },
  {
    label: "退出登录",
    key: "logout",
    icon: renderIcon(logoutIcon),
    show: userStore.id !== "",
  },
];
// 退出登陆
const logout = () => {
  userStore.logout();
};

// 事件
const handleSelect = (key: string) => {
  if (key === "logout") {
    logout();
  }
  if (key === "login") {
    router.push("/login");
  }
  if (key === "manager") {
    router.push("/admin");
  }
  if (key === "user") {
    router.push("/userinfo");
  }
};

const handleUpdateValue = (value: string) => {
  activeKey.value = value;
  router.push(value);
};
const search = ref();
const toSearch = () => {
  search.value.open();
};
</script>

<style lang="scss" scoped>
#top-menu {
  display: grid;
  background-color: transparent;
  grid-template-columns: 2fr 4fr 76px 42px;
  gap: 8px;
  align-items: center;
  padding: 4px 20px;
  margin: 0 8px 8px 8px;
  box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;

  .search-button {
    .search-box {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 42px;
      border-radius: 5px;
      background-color: #fff;
      cursor: pointer;
      transition: all 0.3s ease-in-out;

      &:hover {
        background-color: rgba(0, 0, 0, 0.1);
      }
    }
  }

  .logo {
    font-size: 24px;
    font-weight: bold;
  }

  .menu-list {
    display: flex;
    justify-content: flex-end;
  }

  .search {
    display: flex;
    justify-content: center;
  }

  .headimg {
    width: 42px;
    height: 42px;
    cursor: pointer;
  }
}

::v-deep(.n-menu-item) {
  position: relative;
  border-bottom: 1px;

  .n-menu-item-content {
    padding: 0 8px;
  }

  & {
    transition: all 0.3s ease-in-out;
    border-radius: 5px;
  }

  &:hover {
    cursor: pointer;
    background-color: rgba(0, 0, 0, 0.1);
  }
}

// 宽度小于 768px 时
@media screen and (max-width: 768px) {
  #top-menu {
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 1fr 1fr 1fr;
    grid-template-areas:
      "logo logo logo"
      "menu menu menu";
    padding: 4px 8px;
    margin: 0 8px 8px 8px;

    .logo {
      grid-area: logo;
      font-size: 20px;
      font-weight: bold;
      text-align: center;
    }

    .menu-list {
      grid-area: menu;
      display: flex;
      justify-content: flex-start;
    }
    .search-button {
      display: none;
    }
  }
}
</style>
