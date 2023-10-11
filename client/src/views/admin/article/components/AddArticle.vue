<template>
    <n-scrollbar style="max-height: 72vh">
        <div id="article">
            <div class="article-content">
                <div class="header">
                    <div class="title-content">
                        <n-form ref="formRef" :label-width="80" :model="articleForm" require-mark-placement="left">
                            <n-form-item label="文章标题" path="title">
                                <n-input v-model:value="articleForm.article_title" placeholder="输入标题" />
                            </n-form-item>
                            <n-form-item label="文章描述" path="des">
                                <n-input v-model:value="articleForm.des" placeholder="输入描述" />
                            </n-form-item>
                            <n-form-item label="文章分类" path="category_id">
                                <n-select v-model:value="articleForm.category_id" :options="categoryOptions" />
                            </n-form-item>
                        </n-form>
                    </div>
                    <div class="cover-content">
                        <div class="label">文章封面:</div>
                        <img v-if="articleForm.cover" :src="articleForm.cover" alt=""
                            style="width: 240px; height:180px; border: 1px dashed #eee;">
                        <div v-else
                            style="width:240px; height:180px; border: 1px dashed; text-align: center; line-height: 180px;">
                            暂无封面
                        </div>
                        <div class="upload-content">
                            <n-upload with-credentials action="http://127.0.0.1:9090/api/article/upload-cover"
                                :default-upload="true" @before-upload="beforeUpload" @finish="handleFinish"
                                :show-file-list="false">
                                <n-button>选择文件</n-button>
                            </n-upload>
                        </div>
                    </div>
                </div>

                <md-editor v-model="articleForm.content" @onUploadImg="onUploadImg"
                    @onSave="props.editId ? onUpdate() : onSave()" style="height: 670px;" />
            </div>

        </div>
    </n-scrollbar>
</template>

<script setup lang='ts'>
import { onMounted, ref } from 'vue'
import { MdEditor } from 'md-editor-v3';
import 'md-editor-v3/lib/style.css';
import { UploadFileInfo, useMessage } from 'naive-ui';
import { addArticleApi, getArticleDetailApi, updateArticleApi, uploadArticleImageApi } from '@/apis/article';
import { useUserStore } from '@/store/userinfo';
import { getCategoryListApi } from '@/apis/category';

const message = useMessage()
const userStore = useUserStore()
onMounted(() => {
    getCategoryList()
})
const articleForm = ref({
    id: 0,
    article_title: '',
    des: '',
    cover: '',
    content: '',
    category_id: '',
    author: userStore.account
})
// 父组件传递过来的id
const props = defineProps({
    editId: {
        type: Number,
        default: 0
    }
})
// 或者文章详情
const getArticleDetail = async () => {
    const res = await getArticleDetailApi(props.editId)
    if (res.code === 200) {
        articleForm.value = res.data[0]
        console.log(articleForm.value);
    }
}
// 如果有id，就获取文章详情
if (props.editId) {
    getArticleDetail()
}


// 获取分类列表
const categoryOptions = ref([])
const getCategoryList = async () => {
    const res = await getCategoryListApi()
    if (res.code === 200) {
        const formatData = res.data.map((item: any) => {
            return {
                label: item.category_name,
                value: item.id
            }
        })
        categoryOptions.value = formatData
    }
}

// 封面上传成功回调
const handleFinish = async ({
    event
}: {
    event?: ProgressEvent
}) => {
    const res = await JSON.parse((event?.target as XMLHttpRequest).response)
    if (res.code === 200) {
        message.success(res.msg)
        articleForm.value.cover = res.data.image_url; // 获取上传成功后的URL
    }
}
// 提交文章
const onSave = async () => {
    // 如果表单为空
    if (!articleForm.value.article_title || !articleForm.value.des || !articleForm.value.cover || !articleForm.value.content) {
        message.error('请填写完整的文章信息')
        return
    }
    const res = await addArticleApi(articleForm.value)
    if (res.code === 200) {
        message.success(res.msg)
    }
}
// 更新文章
const onUpdate = async () => {
    // 如果表单为空
    if (!articleForm.value.article_title || !articleForm.value.des || !articleForm.value.cover || !articleForm.value.content) {
        message.error('请填写完整的文章信息')
        return
    }
    const res = await updateArticleApi(articleForm.value)
    if (res.code === 200) {
        message.success(res.msg)
    }
}
// 封面上传之前
const beforeUpload = async (data: {
    file: UploadFileInfo
    fileList: UploadFileInfo[]
}) => {
    if (data.file.file?.type !== 'image/png' && data.file.file?.type !== 'image/jpeg') {
        message.error('只能上传png或jpeg格式的图片文件，请重新上传')
        return false
    }
    return true
}

// 文章内容图片上传
const onUploadImg = async (files: any[], callback: any) => {
    const res = await Promise.all(
        files.map((file) => {
            return new Promise(async (rev, _rej) => {
                const form = new FormData();
                form.append('file', file);
                const res = await uploadArticleImageApi(form)
                if (res.code === 200) {
                    rev(res)
                    console.log(res);
                }
            });
        })
    );
    callback(res.map((item: any) => item.data.image_url));
};
</script>

<style lang='scss' scoped>
.header {
    background-color: #fff;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 8px;
    align-items: center;
    border: 1px solid #eee;
    margin-bottom: 8px;
    padding: 20px;
}

.cover-content {
    display: flex;
    align-items: center;


    ::v-deep(.n-button) {
        margin-left: 8px;
    }
}
</style>