<template>
  <div class="content-head">
    <n-carousel show-arrow autoplay>
      <div class="carousel-img" v-for="item in carousel" :key="item.id">
        <img :src="item.cover" @click="toArticle(item.id)">
      </div>
      <template #arrow="{ prev, next }">
        <div class="custom-arrow">
          <button type="button" class="custom-arrow--left" @click="prev">
            <n-icon>
              <ArrowBackIosOutlined />
            </n-icon>
          </button>
          <button type="button" class="custom-arrow--right" @click="next">
            <n-icon>
              <ArrowForwardIosOutlined />
            </n-icon>
          </button>
        </div>
      </template>
      <template #dots="{ total, currentIndex, to }">
        <ul class="custom-dots">
          <li v-for="index of total" :key="index" :class="{ ['is-active']: currentIndex === index - 1 }"
            @click="to(index - 1)" />
        </ul>
      </template>
    </n-carousel>
  </div>
</template>

<script setup lang='ts'>
import router from '@/router';
import { ArrowBackIosOutlined, ArrowForwardIosOutlined } from '@vicons/material'
import { onMounted, ref } from 'vue';
const carousel = ref<any>([])

// 获取父组件的传值
const props = defineProps({
  carouselList: Array
})
onMounted(() => {
  carousel.value = props.carouselList
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
.carousel-img {
  img {
    width: 100%;
    height: 320px;
    object-fit: cover;
  }

}

.custom-arrow {
  display: flex;
  position: absolute;
  bottom: 25px;
  right: 10px;
}

.custom-arrow button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 28px;
  height: 28px;
  margin-right: 12px;
  color: #fff;
  background-color: rgba(255, 255, 255, 0.1);
  border-width: 0;
  border-radius: 8px;
  transition: background-color 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  cursor: pointer;
}

.custom-arrow button:hover {
  background-color: rgba(255, 255, 255, 0.2);
}

.custom-arrow button:active {
  transform: scale(0.95);
  transform-origin: center;
}

.custom-dots {
  display: flex;
  margin: 0;
  padding: 0;
  position: absolute;
  bottom: 20px;
  left: 20px;
}

.custom-dots li {
  display: inline-block;
  width: 12px;
  height: 4px;
  margin: 0 3px;
  border-radius: 4px;
  background-color: rgba(255, 255, 255, 0.4);
  transition: width 0.3s, background-color 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  cursor: pointer;
}

.custom-dots li.is-active {
  width: 40px;
  background: #fff;
}

// 宽度小于768时
@media screen and (max-width: 768px) {
  .carousel-img {
    display: none;
  }
}
</style>