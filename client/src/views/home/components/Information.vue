<template>
    <div id="container">
        <div class="hot">
            <span class="hot-title title">热门资讯</span>
            <div class="hot-content content">
                <div class="hot-item item" v-for="item in information" :key="item.id" @click="toArticle(item.id)">
                    <n-ellipsis style="max-width: 500px" :tooltip="false">
                        <span class="hot-item-title">{{ item.article_title }}</span>
                    </n-ellipsis>
                    <span class="hot-item-time">{{ item.create_time }}</span>
                </div>
            </div>
        </div>
        <div class="campaigns">
            <span class="campaigns-title title">最近信息</span>
            <div class="campaigns-content content">
                <div class="campaigns-item item" v-for="item in campaigns" :key="item.id" @click="toArticle(item.id)">
                    <n-ellipsis style="max-width: 500px" :tooltip="false">
                        <span class="campaigns-item-title">{{ item.article_title }} </span>
                    </n-ellipsis>
                    <span class="campaigns-item-time">{{ item.create_time }}</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang='ts'>
import router from '@/router';
import { onMounted, ref } from 'vue';

const information = ref<any>([])
const campaigns = ref<any>([])
const props = defineProps({
    informationList: Array,
    campaignsList: Array
})

onMounted(() => {
    information.value = props.informationList
    console.log(information.value);
    campaigns.value = props.campaignsList
})
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
#container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;

    .title {
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 40px;
        background-color: #fff;
        border-bottom: 1px solid #e6e6e6;
        font-size: 16px;
        font-weight: 700;
        margin-bottom: 8px;
    }

    .content {
        padding: 0 8px;
        margin-bottom: 32px;

        .item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 15px;
            position: relative;

            &::after {
                position: absolute;
                content: '';
                left: -8px;
                width: 5px;
                height: 5px;
                margin-right: 8px;
                background-color: #e67e22;
            }

            &:hover {
                cursor: pointer;
                background-color: rgba(0, 0, 0, 0.1);
            }
        }


    }
}
</style>