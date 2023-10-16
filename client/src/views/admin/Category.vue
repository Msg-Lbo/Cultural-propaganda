<template>
  <div>
    <bread-crumb :item="item"></bread-crumb>
    <div class="category-list">
      <n-card size="small">
        <div class="title">
          <div style="flex: 2">
            分区名
            <n-popover placement="bottom" trigger="click" :show="showAddPopover">
              <template #trigger>
                <n-button type="success" size="small" @click="showAddPopover = true">新增分类</n-button>
              </template>
              <span style="font-weight: 800">分类名</span>
              <n-input size="small" v-model:value="categoryName" placeholder="请输入分类名" />
              <div class="add-button">
                <n-space>
                  <n-button @click="showAddPopover = false" type="tertiary" size="small">取消</n-button>
                  <n-button @click="handleAdd" size="small">提交</n-button>
                </n-space>
              </div>
            </n-popover>
          </div>
          <div style="flex: 1; text-align: center; line-height: 28px">包含文章数</div>
          <div style="flex: 1; text-align: center; line-height: 28px">操作</div>
        </div>
      </n-card>
      <n-scrollbar style="max-height: 75vh">
        <n-card size="small" v-for="(item, index) in categoryForm" :key="item.id" :ref="`card-${index}`">
          <div class="title">
            <div style="flex: 2">{{ item.category_name }}</div>
            <div style="flex: 1; text-align: center">{{ item.article_count }}</div>
            <div style="flex: 1; text-align: center">
              <n-space justify="center">
                <n-popover placement="bottom" trigger="click" :show="showEditPopover[index]" :ref="`popover-${index}`">
                  <template #trigger>
                    <n-button type="warning" size="small" @click="showEdit(item.id)">修改</n-button>
                  </template>
                  <span style="font-weight: 800">分类名</span>
                  <n-input size="small" v-model:value="item.category_name" placeholder="请输入分类名" />
                  <div class="add-button">
                    <n-space>
                      <n-button type="tertiary" size="small" @click="handleCancel(index)">取消</n-button>
                      <n-button type="success" size="small"
                        @click="handleEdit(index, item.id, item.category_name)">提交</n-button>
                    </n-space>
                  </div>
                </n-popover>
                <n-popconfirm @positive-click="handleDelete(item.id)">
                  <template #trigger>
                    <n-button type="error" size="small" @click="">删除</n-button>
                  </template>
                  删除后会导致该分类下的文章归为未分类，确定删除吗？
                </n-popconfirm>
              </n-space>
            </div>
          </div>
        </n-card>
      </n-scrollbar>
    </div>
  </div>
</template>

<script setup lang="ts">
import { addCategoryApi, deleteCategoryApi, getCategoryListApi, updateCategoryApi } from "@/apis/category";
import breadCrumb from "@/components/bread_crumb.vue";
import { useMessage } from "naive-ui";
import { onMounted, ref } from "vue";
interface CategoryForm {
  id: number;
  category_name: string;
  article_count: number;
}
onMounted(() => {
  getCategoryList();
});
const message = useMessage();
const showAddPopover = ref(false);
const item = ref({
  first: "分区管理",
});
const categoryForm = ref<CategoryForm[]>([]);
const categoryName = ref("");
// 添加分类
const handleAdd = async () => {
  const res = await addCategoryApi(categoryName.value);
  if (res.code === 200) {
    message.success(res.msg);
    getCategoryList();
    showAddPopover.value = false;
  }
};
// 删除分类
const handleDelete = async (id: number) => {
  const res = await deleteCategoryApi(id);
  if (res.code === 200) {
    message.success(res.msg);
    getCategoryList();
  }
};
const showEditPopover = ref(Array(categoryForm.value.length).fill(false));
const showEdit = (id: number) => {
  const eId = categoryForm.value.findIndex((item) => item.id === id);
  if (eId >= -1) {
    showEditPopover.value[eId] = true;
  }
  // 其他的popover关闭
  showEditPopover.value.forEach((_item, index) => {
    console.log(index, eId);
    if (index !== eId) {
      showEditPopover.value[index] = false;
    }
  });
};
// 取消
const handleCancel = (id: number) => {
  showEditPopover.value[id] = false;
};
// 编辑分类
const handleEdit = async (eId: number, id: number, name: string) => {
  const res = await updateCategoryApi(id, name);
  if (res.code === 200) {
    message.success(res.msg);
    showEditPopover.value[eId] = false;
    getCategoryList();
  }
};
// 获取分类列表
const getCategoryList = async () => {
  const res = await getCategoryListApi();
  if (res.code === 200) {
    categoryForm.value = res.data;
  }
};
</script>

<style lang="scss" scoped>
.category-list {
  .title {
    display: flex;
    justify-content: space-between;
    padding: 0 20px;
  }
}

.add-button {
  display: flex;
  justify-content: flex-end;
  margin-top: 8px;
}
</style>
