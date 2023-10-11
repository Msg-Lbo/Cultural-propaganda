<template>
    <div class="writing-center">
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
import AddArticle from './components/AddArticle.vue'
import ArticleList from './components/ArticleList.vue'
import { ref } from 'vue';
const selectTabs = ref()
const isEdit = ref('添加文章')
const handleChange = (tab: string) => {
    if (tab === 'list') {
        selectTabs.value= 'list'
        isEdit.value = '添加文章'
    }
    if (tab === 'add') {
        selectTabs.value= 'add'
        editId.value = undefined
    }
    if (tab === 'edit') {
        selectTabs.value= 'add'
        isEdit.value= '编辑文章'
    }
}

const editId = ref()

const handleSelectTabs = (data: any) => {
    selectTabs.value = data.tab
    handleChange('edit')
    editId.value = data.id
}
</script>

<style lang='scss' scoped>
.writing-center{
    padding: 0 8px;
}
</style>