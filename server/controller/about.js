const executeQuery = require('../db')

// 保存关于信息
exports.saveAbout = async (req, res) => {
    try {
        const { content } = req.body
        const sql = 'update about set content=? where id=1'
        const rows = await executeQuery(sql, [content])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '保存失败'
            })
        }
        return res.json({
            code: 200,
            msg: '保存成功',
            succeed: true
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}
// 获取关于信息
exports.getAbout = async (req, res) => {
    try {
        const sql = 'select * from about where id=1'
        const rows = await executeQuery(sql)
        if (rows.length !== 1) {
            return res.json({
                code: 400,
                msg: '获取失败'
            })
        }
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: rows
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}