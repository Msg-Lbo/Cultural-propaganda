<template>
    <div id="bread-crumb">
        <n-icon size="18">
            <location-icon />
        </n-icon>
        <n-breadcrumb>
            <n-breadcrumb-item>
                {{ props.item.first }}
            </n-breadcrumb-item>
            <n-breadcrumb-item v-if="props.item.second">
                {{ props.item.second }}
            </n-breadcrumb-item>
        </n-breadcrumb>
    </div>
</template>

<script setup lang='ts'>
import {
    AddLocationOutlined as locationIcon
} from '@vicons/material'
const props = defineProps(['item'])
</script>

<style lang='scss' scoped>
#bread-crumb {
    display: flex;
    align-items: center;
}
</style>