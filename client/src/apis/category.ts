import { $http } from '.'
// 新增分类
export const addCategoryApi = async (name: string) => {
    return await $http({
        url: '/category/add-category',
        method: 'POST',
        data: { name }
    })
}
// 获取分类列表
export const getCategoryListApi = async () => {
    return await $http({
        url: '/category/category-list',
        method: 'GET'
    })
}
// 删除分类
export const deleteCategoryApi = async (id: number) => {
    return await $http({
        url: '/category/delete-category',
        method: 'POST',
        data: { id }
    })
}
// 更新分类
export const updateCategoryApi = async (id: number, name: string) => {
    return await $http({
        url: '/category/update-category',
        method: 'POST',
        data: { id, name }
    })
}

