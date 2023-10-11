const executeQuery = require('../db')

// 新增分类
exports.addCategory = async (req, res) => {
    const { name } = req.body
    // 如果有一个为空
    if (!name || name.trim() === '') {
        res.json({
            code: 400,
            msg: '参数不可为空'
        })
        return
    }
    try {
        // 判断分类是否存在
        const sql1 = 'select * from category where category_name=?'
        const rows1 = await executeQuery(sql1, [name])
        // 如果分类存在
        if (rows1.length !== 0) {
            return res.json({
                code: 400,
                msg: '分类已存在'
            })

        }
        const sql = 'insert into category (category_name) values (?)'
        const rows = await executeQuery(sql, [name])
        // 如果影响行数为0
        if (rows.affectedRows === 0) {
            res.json({
                code: 400,
                msg: '新增失败'
            })
        }
        res.json({
            code: 200,
            succeed: true,
            msg: '新增成功'
        })

    } catch (error) {
        console.log(error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 获取分类列表
exports.getCategoryList = async (req, res) => {
    try {
        // 获取分类列表的内容，并且获取每个分类所包含的文章数量
        const sql = 'select category.*,count(article.category_id) as article_count from category left join article on category.id=article.category_id group by category.id'
        const rows = await executeQuery(sql)
        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: rows
        })
    } catch (error) {
        console.log(error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 删除分类
exports.deleteCategory = async (req, res) => {
    const { id } = req.body
    try {
        const sql = 'delete from category where id=?'
        const rows = await executeQuery(sql, [id])
        // 如果影响行数为0
        if (rows.affectedRows === 0) {
            res.json({
                code: 400,
                msg: '删除失败'
            })
        }
        res.json({
            code: 200,
            succeed: true,
            msg: '删除成功'
        })
    } catch (error) {
        console.log(error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 修改分类
exports.updateCategory = async (req, res) => {
    const { id, name } = req.body
    try {
        // 判断分类是否存在
        const sql1 = 'select * from category where category_name=?'
        const rows1 = await executeQuery(sql1, [name])
        // 如果分类存在
        if (rows1.length !== 0) {
            return res.json({
                code: 400,
                msg: '分类已存在'
            })

        }
        const sql = 'update category set category_name=? where id=?'
        const rows = await executeQuery(sql, [name, id])
        // 如果影响行数为0
        if (rows.affectedRows === 0) {
            res.json({
                code: 400,
                msg: '修改失败'
            })
        }
        res.json({
            code: 200,
            succeed: true,
            msg: '修改成功'
        })
    } catch (error) {
        console.log(error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}