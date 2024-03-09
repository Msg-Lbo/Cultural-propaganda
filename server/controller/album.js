const executeQuery = require('../db')
const jwt = require("jsonwebtoken");
const jwtconfig = require("../jwt_config");
const secretKey = jwtconfig.jwsSecretKey;
// 获取专辑列表
exports.getAlbumList = async (req, res) => {
    try {
        // 获取用户账号
        const token = req.cookies.token;
        if (!token) {
            return res.json({
                code: 400,
                msg: '请先登录'
            })
        }
        const decodedToken = jwt.verify(token, secretKey);
        const account = decodedToken.account;
        const sql = `select * from albums where account = ?`
        const result = await executeQuery(sql, [account])
        // 获取文章列表,只要文章id和文章标题
        const sql2 = `select article.id, article.article_title from article left join albums on article.album = albums.id where article.album = ?`
        let album_arr = []
        for (const item of result) {
            const result2 = await executeQuery(sql2, [item.id])
            const data = {
                id: item.id,
                albumName: item.name,
                articleList: result2
            }
            album_arr.push(data)
        }
        return res.json({
            code: 200,
            succeed: true,
            msg: '获取专辑列表成功',
            data: album_arr
        })
    } catch (err) {
        console.log(err);
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 创建专辑
exports.createAlbum = async (req, res) => {
    try {
        const { name } = req.body
        // 获取用户账号
        const token = req.cookies.token;
        if (!token) {
            return res.json({
                code: 400,
                msg: '请先登录'
            })
        }
        const decodedToken = jwt.verify(token, secretKey);
        const account = decodedToken.account;
        // 查询该用户的专辑是否存在
        const sql1 = `select * from albums where name = ? and account = ?`
        const result1 = await executeQuery(sql1, [name, account])
        if (result1.length > 0) {
            return res.json({
                code: 400,
                msg: '该专辑已存在'
            })
        }
        const sql = `insert into albums (name, account) values (?, ?)`
        const result = await executeQuery(sql, [name, account])
        if (result.affectedRows === 1) {
            return res.json({
                code: 200,
                succeed: true,
                msg: '创建专辑成功',
            })
        }
    } catch (err) {
        console.log(err);
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 获取专辑下的文章列表
exports.getAlbumIdList = async (req, res) => {
    try {
        // 获取用户账号
        const token = req.cookies.token;
        if (!token) {
            return res.json({
                code: 400,
                msg: '请先登录'
            })
        }
        const decodedToken = jwt.verify(token, secretKey);
        const account = decodedToken.account;
        const sql = `select * from albums where account = ?`
        const result = await executeQuery(sql, [account])
        return res.json({
            code: 200,
            succeed: true,
            msg: '获取成功',
            data: result
        })
    } catch (err) {
        console.log(err);
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}