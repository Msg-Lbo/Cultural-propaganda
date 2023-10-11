const executeQuery = require('../db')

// 新增评论
exports.addComment = async (req, res) => {
    const { article_id, content, user_account } = req.body
    // 如果有一个为空
    if (!article_id || !content || content.trim() === '' || !user_account || user_account.trim() === '') {
        res.json({
            code: 400,
            msg: '参数不可为空'
        })
        return
    }
    const create_time = new Date().getTime()
    try {
        const sql = 'insert into comment (article_id,content,user_account,create_time) values (?,?,?,?)'
        const rows = await executeQuery(sql, [article_id, content, user_account, create_time])
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
// 获取评论列表
exports.getCommentList = async (req, res) => {
    const { article_id } = req.query
    // 如果有一个为空
    if (!article_id) {
        res.json({
            code: 400,
            msg: '参数不可为空'
        })
        return
    }
    try {
        // 获取用户头像，用户名，评论内容，评论时间
        const sql = `select comment.*,users.image_url,users.nickname,article.article_title from comment
            left join article on comment.article_id=article.id
            left join users on comment.user_account=users.account 
            where article_id=?`
        const rows = await executeQuery(sql, [article_id])
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
// 删除评论
exports.deleteComment = async (req, res) => {
    const { id } = req.body
    // 如果有一个为空
    if (!id) {
        res.json({
            code: 400,
            msg: '参数不可为空'
        })
        return
    }
    try {
        const sql = 'delete from comment where id=?'
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
// 分页获取全部评论
exports.getAllCommentList = async (req, res) => {
    const { page, pageSize } = req.query
    try {
        // 分页获取用户头像，用户名，评论内容，评论时间,所属文章标题
        const sql = `select comment.*,users.image_url,users.nickname,article.article_title from comment
            left join article on comment.article_id=article.id
            left join users on comment.user_account=users.account 
            order by comment.create_time desc
            limit ${(page - 1) * pageSize},${pageSize}`
        const sql2 = `select count(*) as total from comment`
        const rows2 = await executeQuery(sql2)
        const rows = await executeQuery(sql)
        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                list: rows,
                // 向上取整
                count: Math.ceil(rows2[0].total / pageSize)
            }
        })

    } catch (error) {
        console.log(error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}