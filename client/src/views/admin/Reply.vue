<template>
  <div>
    <bread-crumb :item="item" />
    <div class="comment-list">
      <n-table :bordered="true" :single-line="true" size="small" striped>
        <thead>
          <tr>
            <th>发布人</th>
            <th>内容</th>
            <th>时间</th>
            <th>所属文章</th>
            <th style="width: 200px; text-align: center;">操作</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in commentList" :key="item.id">
            <td>{{ item.nickname }}</td>
            <td>{{ item.content }}</td>
            <td>
              <n-time :time="item.create_time"></n-time>
            </td>
            <td>{{ item.article_title }}</td>
            <td style="display: flex; align-items: center; justify-content: center;">
              <n-popconfirm>
                <template #trigger>
                  <n-button quaternary type="error">删除</n-button>
                </template>
                删除后无法恢复,确定删除吗?
                <template #action>
                  <n-button type="error" size="small" @click="handleDelete(item.id)">确定</n-button>
                </template>
              </n-popconfirm>
            </td>
          </tr>
        </tbody>
      </n-table>
      <div class="pagination">
        <n-pagination :page-count="count" :on-update:page="changePage" />
      </div>
    </div>
  </div>
</template>

<script setup lang='ts'>
import { deleteCommentApi, getAllCommentApi } from '@/apis/comment';
import breadCrumb from '@/components/bread_crumb.vue'
import { useMessage } from 'naive-ui';
import { ref } from 'vue';

const item = ref({
  first: '评论管理'
})
const message = useMessage()
const page = ref(1)
const pageSize = ref(12)
const count = ref(0)
const commentList = ref<any>([])
// 分页切换触发事件
const changePage = (val: number) => {
  page.value = val
  getCommentList()
}
// 获取所有评论
const getCommentList = async () => {
  const res = await getAllCommentApi(page.value, pageSize.value)
  if (res.code === 200) {
    commentList.value = res.data.list
    count.value = res.data.count
  }
}
// 删除评论
const handleDelete = async (id: number) => {
  const res = await deleteCommentApi(id)
  if (res.code === 200) {
    message.success(res.msg)
    getCommentList()
  }
}
getCommentList()
</script>

<style lang='scss' scoped></style>