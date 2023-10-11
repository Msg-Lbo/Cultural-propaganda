import { createRouter, createWebHistory } from 'vue-router'
import { useUserStore } from '@/store/userinfo'
import { createDiscreteApi } from 'naive-ui'

const { message } = createDiscreteApi(['message'])
const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'index',
            component: () => import('@/views/home/Index.vue'),
            redirect: '/home',
            children: [
                {
                    path: '/home',
                    name: 'home',
                    component: () => import('@/views/home/Home.vue')
                },
                {
                    path: '/category',
                    name: 'category',
                    component: () => import('@/views/home/Category.vue')
                },
                {
                    path: '/category',
                    name: 'category',
                    component: () => import('@/views/home/Category.vue')
                },
                {
                    path: '/campaign',
                    name: 'campaign',
                    component: () => import('@/views/home/Campaign.vue')
                },
                {
                    path: '/authoring',
                    name: 'authoring',
                    component: () => import('@/views/home/Authoring.vue'),
                    meta: {
                        islogin: true
                    },

                },
                {
                    path: '/userinfo',
                    name: 'userinfo',
                    component: () => import('@/views/home/UserInfo.vue'),
                    meta: {
                        islogin: true
                    },
                },
                {
                    path: '/about',
                    name: 'about',
                    component: () => import('@/views/home/About.vue')
                },
                {
                    path: '/detail',
                    name: 'detail',
                    component: () => import('@/views/home/Articledetail.vue')
                },
                {
                    path: '/campaign-detail',
                    name: 'campaign-detail',
                    component: () => import('@/views/home/CampaignDetail.vue')
                }
            ]
        },
        {
            path: '/login',
            name: 'Login',
            component: () => import('@/views/login/Login.vue')
        },
        {
            path: '/admin',
            name: 'Admin',
            component: () => import('@/views/admin/Index.vue'),
            redirect: '/article-manager',
            meta: {
                requireAuth: true
            },
            children: [
                {
                    path: '/article-manager',
                    name: 'article-manager',
                    component: () => import('@/views/admin/article/Index.vue')
                },
                {
                    path: '/campaign-manager',
                    name: 'campaign-manager',
                    component: () => import('@/views/admin/campaign/Index.vue')
                },
                {
                    path: '/category-manager',
                    name: 'category-manager',
                    component: () => import('@/views/admin/Category.vue')
                },
                {
                    path: '/users-manager',
                    name: 'users-manager',
                    component: () => import('@/views/admin/Users.vue')
                },
                {
                    path: '/reply-manager',
                    name: 'reply-manager',
                    component: () => import('@/views/admin/Reply.vue')
                },
                {
                    path: '/settings-manager',
                    name: 'settings-manager',
                    component: () => import('@/views/admin/Settings.vue')
                }
            ]
        }
    ]
})

router.beforeEach((to, _from, next) => {
    const userStore = useUserStore()
    if (to.meta.requireAuth && !userStore.id) {
        userStore.isAdmin().then(res => {
            if (res === false) {
                message.error('您不是管理员，无法访问该页面')
            } else {
                next()
            }
        })
    } else if (to.meta.islogin && !userStore.id) {
        message.error('请先登录')
        next('/login')
    } else {
        next()
    }
})


export default router