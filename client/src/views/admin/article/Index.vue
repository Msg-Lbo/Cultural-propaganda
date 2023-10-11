<template>
    <div>
        <bread-crumb :item="item"></bread-crumb>
        <n-card style="margin-bottom: 16px">
            <n-tabs type="line" :value="selectTabs" animated @update:value="handleChange">
                <n-tab-pane name="list" tab="文章列表">
                    <article-list @selectTabs="handleSelectTabs" />
                </n-tab-pane>
                <n-tab-pane name="add" :tab="isEdit" >
                    <add-article :editId="editId" />
                </n-tab-pane>
            </n-tabs>
        </n-card>
    </div>
</template>

<script setup lang='ts'>
import breadCrumb from '@/components/bread_crumb.vue'
import AddArticle from './components/AddArticle.vue'
import ArticleList from './components/ArticleList.vue'
import { ref } from 'vue';
const item = ref({
    first: '文章管理',
    second: '文章列表'
})
const selectTabs = ref()
const isEdit = ref('添加文章')
const handleChange = (tab: string) => {
    if (tab === 'list') {
        item.value.second = '文章列表'
        selectTabs.value= 'list'
        isEdit.value = '添加文章'
    }
    if (tab === 'add') {
        item.value.second = '添加文章'
        selectTabs.value= 'add'
        editId.value = undefined
    }
    if (tab === 'edit') {
        item.value.second = '编辑文章'
        isEdit.value= '编辑文章'
    }
}

const editId = ref()

const handleSelectTabs = (data: any) => {
    console.log(data);
    selectTabs.value = data.tab
    handleChange('edit')
    editId.value = data.id
}
</script>

<style lang='scss' scoped></style>