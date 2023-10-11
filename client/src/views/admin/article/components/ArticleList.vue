<template>
    <div id="article-list">
        <n-table :bordered="true" :single-line="true" size="small" striped>
            <thead>
                <tr>
                    <th>标题</th>
                    <th>分类</th>
                    <th>评论</th>
                    <th>状态</th>
                    <th style="width: 200px; text-align: center;">操作</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in articleList" :key="item.id">
                    <td>{{ item.article_title }}</td>
                    <td>{{ item.category_name }}</td>
                    <td>{{ item.comment_count }}</td>
                    <td>
                        <n-tag type="success" size="small" v-if="item.is_top == 1">置顶</n-tag>
                    </td>
                    <td style="display: flex; align-items: center; justify-content: center;">
                        <n-button quaternary type="warning" @click="toArticle(item.id)">查看</n-button>
                        <n-button quaternary type="warning" v-if="item.is_top == 1" @click="isTop(item.id, 0)">取消置顶</n-button>
                        <n-button quaternary type="success" v-else @click="isTop(item.id, 1)">置顶</n-button>
                        <n-button quaternary type="warning" @click="editArticle(item.id)">编辑</n-button>
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
</template>

<script setup lang='ts'>
import { ref } from 'vue';
import { deleteArticleApi, getArticleListApi, updateArticleTopApi } from '@/apis/article'
import { useMessage } from 'naive-ui';
import router from '@/router';
let page = 1
let pageSize = 12
const count = ref(0)
const message = useMessage()
interface ArticleList {
    id: number,
    article_title: string,
    cover: string,
    content: string,
    category_id: number,
    category_name: string,
    comment_count: number,
    author: string,
    create_time: string,
    update_time: string,
    is_top: number,
}
const articleList = ref<ArticleList[]>([])
// 获取文章列表
const getArticleList = async () => {
    const res = await getArticleListApi(page, pageSize)
    articleList.value = res.data.list
    count.value = res.data.total
}
// 初始化获取文章列表
getArticleList()
// 编辑文章,传入ID
const editArticle = (id: number) => {
    selectTabs(id)
}
// 分页触发事件
const changePage = (val: number) => {
    page = val
    getArticleList()
}
// 使用defineEmits定义事件, 使用emits触发事件,向父组件传递数据
const emits = defineEmits(['selectTabs'])
// 接受ID,触发事件,向父组件发送数据
const selectTabs = (id: number) => {
    emits('selectTabs', {
        'tab': 'add',
        'id': id
    })
}
// 删除文章
const handleDelete = async (id: number) => {
    const res = await deleteArticleApi(id)
    if (res.code === 200) {
        message.success(res.msg)
        getArticleList()
    }
}
// 置顶文章
const isTop = async (id: number, is_top: number) => {
    const res = await updateArticleTopApi(id, is_top)
    if (res.code === 200) {
        message.success(res.msg)
        getArticleList()
    }
}
const toArticle = (id: number) => {
    // 路由传参
    router.push({
        path: '/detail',
        query: {
            id: id
        }
    })
}
</script>

<style lang='scss' scoped>
#article-list {
    height: 72vh;
    position: relative;

    .pagination {
        position: absolute;
        bottom: 0;
    }
}
</style>