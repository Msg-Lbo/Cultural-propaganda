<template>
    <div>
        <bread-crumb :item="item"></bread-crumb>
        <n-card style="margin-bottom: 16px">
            <n-tabs type="line" :value="selectTabs" animated @update:value="handleChange">
                <n-tab-pane name="list" tab="活动列表">
                    <list-view @selectTabs="handleSelectTabs" />
                </n-tab-pane>
                <n-tab-pane name="add" :tab="isEdit" >
                    <add-view :editId="editId" />
                </n-tab-pane>
                <n-tab-pane name="status" tab="审核列表" >
                    <status-view :editId="editId" />
                </n-tab-pane>
            </n-tabs>
        </n-card>
    </div>
</template>

<script setup lang='ts'>
import breadCrumb from '@/components/bread_crumb.vue'
import AddView from './components/Add.vue'
import ListView from './components/List.vue'
import StatusView from './components/Status.vue'
import { ref } from 'vue';
const item = ref({
    first: '活动管理',
    second: '活动列表'
})
const selectTabs = ref()
const isEdit = ref('添加活动')
const handleChange = (tab: string) => {
    if (tab === 'list') {
        item.value.second = '活动列表'
        selectTabs.value= 'list'
        isEdit.value = '添加活动'
    }
    if (tab === 'add') {
        item.value.second = '添加活动'
        selectTabs.value= 'add'
        editId.value = undefined
    }
    if (tab === 'edit') {
        item.value.second = '编辑活动'
        isEdit.value= '编辑活动'
    }
    if (tab === 'status') {
        item.value.second = '审核列表'
        selectTabs.value= 'status'
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