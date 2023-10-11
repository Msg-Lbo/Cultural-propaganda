<template>
    <div id="home-set">
        <n-scrollbar style="max-height: 70vh">
            <n-form ref="formRef" :model="homuSetForm" label-placement="left" label-width="auto"
                require-mark-placement="left">
                <n-form-item path="carousel" label="首页轮播图">
                    <n-select v-model:value="homuSetForm.carousel" style="max-width: 80%" multiple filterable
                        placeholder="搜索文章" :options="optionsRef" :loading="loadingRef" clearable remote
                        :clear-filter-after-select="false" @search="text" />
                </n-form-item>
                <n-form-item path="recommend" label="推荐文章">
                    <n-select v-model:value="homuSetForm.recommend" style="max-width: 80%" multiple filterable
                        placeholder="搜索文章" :options="optionsRef" :loading="loadingRef" clearable remote
                        :clear-filter-after-select="false" @search="text" />
                </n-form-item>
                <n-form-item path="accoinformationunt" label="热门资讯">
                    <n-select v-model:value="homuSetForm.information" style="max-width: 80%" multiple filterable
                        placeholder="搜索文章" :options="optionsRef" :loading="loadingRef" clearable remote
                        :clear-filter-after-select="false" @search="handleSearch" />
                </n-form-item>
                <n-form-item path="campaigns" label="活动">
                    <n-select v-model:value="homuSetForm.campaigns" style="max-width: 80%" multiple filterable
                        placeholder="搜索文章" :options="optionsRef" :loading="loadingRef" clearable remote
                        :clear-filter-after-select="false" @search="handleSearch" />
                </n-form-item>
                <n-form-item path="campaigns" label="提示">
                    <span>当一篇文章设置好之后,其他三项请勿设置该文章,否则或会导致其中一项无法显示该文章</span>
                </n-form-item>
                <div style="display: flex; justify-content: flex-end">
                    <n-button round type="primary" @click="onSave">
                        验证
                    </n-button>
                </div>
            </n-form>
        </n-scrollbar>

    </div>
</template>

<script setup lang='ts'>
import { searchArticleApi } from '@/apis/article';
import { saveHomeSettingApi, getHomeSettingApi } from '@/apis/settings';
import { SelectOption, useMessage } from 'naive-ui';
import { debounceRef } from '@/utils/debounceRef'
import { ref } from 'vue';
const message = useMessage()
const loadingRef = ref(false)
interface HomeSetForm {
    carousel: [],
    recommend: [],
    information: [],
    campaigns: []
}
const homuSetForm = ref<HomeSetForm>({
    carousel: [],
    recommend: [],
    information: [],
    campaigns: []
})
const optionsRef = ref<SelectOption[]>([])
const options = ref([])
// 搜索文章
const handleSearch = async (query: string) => {
    if (!query.length) {
        optionsRef.value = []
        return
    }
    loadingRef.value = true
    const res = await searchArticleApi(query)
    if (res.code === 200) {
        const data = res.data.map((item: { article_title: any; id: any; }) => {
            return {
                label: item.article_title,
                value: item.id
            }
        })
        options.value = data
    }
    optionsRef.value = options.value.filter((item: any) => {
        return ~item.label.indexOf(query)
    })
    loadingRef.value = false
}
const text = debounceRef(handleSearch, 2000)

// 保存设置
const onSave = async () => {
    const res = await saveHomeSettingApi(homuSetForm.value)
    if (res.code === 200) {
        message.success(res.msg)
    }
}
// 获取设置
const getHomeSettings = async () => {
    const res = await getHomeSettingApi()
    if (res.code === 200) {
        homuSetForm.value = res.data
    }
}
getHomeSettings()
</script>

<style lang='scss' scoped></style>