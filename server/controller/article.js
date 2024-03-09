const executeQuery = require('../db')
const jwt = require("jsonwebtoken");
const jwtconfig = require("../jwt_config");
const secretKey = jwtconfig.jwsSecretKey;
// 新增文章
exports.addArticle = async (req, res) => {
    const { article_title, des, content, category_id, cover, author,album } = req.body
    // 如果有一个为空
    if (!article_title || !des || !content || !category_id || !cover || !author || !album) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }

    try {
        const create_time = new Date()
        const sql = 'insert into article (article_title,des,content,category_id,cover,author,create_time,album) values (?,?,?,?,?,?,?,?)'
        const rows = await executeQuery(sql, [article_title, des, content, category_id, cover, author, create_time, album])
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
        console.log("服务端错误：", error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}
// 模糊搜索文章
exports.searchArticle = async (req, res) => {
    const { keyword } = req.query
    // 如果有一个为空
    if (!keyword) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }
    try {
        // 关键字模糊查询状态为已审核的文章
        const sql = `SELECT a.*, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE a.is_check = 1 AND a.article_title LIKE ?
                    GROUP BY a.id, u.nickname, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC`;
        const rows = await executeQuery(sql, [`%${keyword}%`])
        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: rows
        })
    } catch (error) {
        console.log("服务端错误：", error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}
// 分页获取文章列表
exports.getArticleList = async (req, res) => {
    const { status, page, pageSize, category_id } = req.query;
    try {
        let sql;
        let params;
        // 获取指定状态，指定分类的文章，如果状态是-1，则获取所有文章，不限分类, 评论数
        if (status == -1 && category_id == -1) {
            sql = `SELECT a.*, u.nickname, c.category_name, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN category c ON a.category_id = c.id
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    GROUP BY a.id, u.nickname, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
            params = [(page - 1) * parseInt(pageSize), parseInt(pageSize)];
        }
        else if (status == -1) {
            sql = `SELECT a.*, u.nickname, c.category_name, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN category c ON a.category_id = c.id
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE FIND_IN_SET(?, a.category_id)
                    GROUP BY a.id, u.nickname, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
            params = [category_id, (page - 1) * parseInt(pageSize), parseInt(pageSize)];
        }
        else if (category_id == -1) {
            sql = `SELECT a.*, u.nickname, c.category_name, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN category c ON a.category_id = c.id
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE a.is_check = ?
                    GROUP BY a.id, u.nickname, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
            params = [status, (page - 1) * parseInt(pageSize), parseInt(pageSize)];
        }
        else {
            sql = `SELECT a.*, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE a.is_check = ? AND FIND_IN_SET(?, a.category_id)
                    GROUP BY a.id, u.nickname, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
            params = [status, category_id, (page - 1) * parseInt(pageSize), parseInt(pageSize)];
        }
        const rows = await executeQuery(sql, params);

        const rows2 = await executeQuery('SELECT COUNT(*) AS total FROM article');
        const data = rows.map((item) => {
            return {
                id: item.id,
                article_title: item.article_title,
                author: item.author,
                nickname: item.nickname,
                category_id: item.category_id,
                category_name: item.category_name,
                cover: item.cover,
                create_time: item.create_time,
                update_time: item.update_time,
                comment_count: item.comment_count,
                des: item.des,
                is_top: item.is_top,
                is_check: item.is_check,
                like: item.like,
                num_read: item.num_read
            };
        });

        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                list: data,
                total: Math.ceil(rows2[0].total / pageSize)
            }
        });
    } catch (error) {
        console.error("服务端错误：", error);
        res.json({
            code: 500,
            msg: '服务端错误'
        });
    }
};
// 获取用户文章列表
exports.getUserArticleList = async (req, res) => {
    const { page, pageSize, account } = req.query;
    try {
        const sql = `SELECT a.*, c.category_name, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN category c ON FIND_IN_SET(c.id, a.category_id)
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE a.author = ?
                    GROUP BY a.id, u.nickname, c.category_name, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
        const rows = await executeQuery(sql, [account, (page - 1) * parseInt(pageSize), parseInt(pageSize)]);

        const sql2 = 'SELECT COUNT(*) AS total FROM article WHERE author = ?';
        const rows2 = await executeQuery(sql2, [account]);
        const data = rows.map((item) => {
            return {
                id: item.id,
                article_title: item.article_title,
                author: item.author,
                nickname: item.nickname,
                category_id: item.category_id,
                category_name: item.category_name,
                cover: item.cover,
                create_time: item.create_time,
                update_time: item.update_time,
                comment_count: item.comment_count,
                des: item.des,
                is_check: item.is_check,
                is_top: item.is_top,
                like: item.like,
                num_read: item.num_read
            }
        })

        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                list: data,
                total: Math.ceil(rows2[0].total / pageSize)
            }
        })
    } catch (error) {
        console.error("服务端错误：", error);
        res.json({
            code: 500,
            msg: '服务端错误'
        });
    }
}
// 获取指定id文章
exports.getArticleDetail = async (req, res) => {
    const { id } = req.query
    // id为空
    if (!id) {
        return res.json({
            code: 400,
            msg: '参数错误'
        })
    }
    try {
        // 获取当前账户
        const token = req.cookies.token;
        const decodedToken = jwt.verify(token, secretKey);
        const account = decodedToken.account;
        // 增加已审核文章阅读次数,获取作者昵称,当前用户是否点赞,当前用户是否收藏
        const sql = `SELECT a.*, u.nickname, al.name, COUNT(cmt.id) AS comment_count,
                    (SELECT COUNT(*) FROM like_article WHERE article_id = a.id AND account = ?) AS is_like,
                    (SELECT COUNT(*) FROM collect_article WHERE article_id = a.id AND account = ?) AS is_collect
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    LEFT JOIN albums al ON a.album = al.id
                    WHERE a.id = ?
                    GROUP BY a.id, u.nickname, cmt.article_id`;

        const sql1 = 'update article set num_read = num_read + 1 where id = ?'
        await executeQuery(sql1, [id])
        const [rows] = await executeQuery(sql, [account, account, id])
        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: rows
        })
    } catch (error) {
        console.log("服务端错误：", error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}
// 修改文章
exports.updateArticle = async (req, res) => {
    const { article_title, des, content, category_id, cover, id } = req.body
    // 如果有一个为空
    if (!article_title || !des || !content || !category_id || !cover || !id) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }

    try {
        const sql = 'update article set article_title = ?,des = ?,content = ?,category_id = ?, is_check = 0 ,cover = ? where id = ?'
        const rows = await executeQuery(sql, [article_title, des, content, category_id, cover, id])
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
        console.log("服务端错误：", error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}
// 删除文章
exports.deleteArticle = async (req, res) => {
    const { id } = req.body
    // 如果有一个为空
    if (!id) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }

    try {
        const sql = 'delete from article where id = ?'
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
        console.log("服务端错误：", error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}
// 获取主页文章
exports.getHomeArticleList = async (req, res) => {
    try {
        const getArticleData = async (settingTable) => {
            const sql = `SELECT a.*, u.nickname, COUNT(cmt.id) AS comment_count
                        FROM article a
                        LEFT JOIN users u ON a.author = u.account
                        LEFT JOIN comment cmt ON cmt.article_id = a.id
                        WHERE a.is_check = 1 AND a.id IN (SELECT article_id FROM ${settingTable})
                        GROUP BY a.id, u.nickname, cmt.article_id
                        ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC`;
            const rows = await executeQuery(sql);
            return rows.map((item) => {
                return {
                    id: item.id,
                    article_title: item.article_title,
                    num_read: item.num_read,
                    nickname: item.nickname,
                    account: item.author,
                    comment_count: item.comment_count,
                    like: item.like,
                    cover: item.cover,
                    create_time: item.create_time,
                    update_time: item.update_time,
                    des: item.des,
                }
            });
        };
        const carouselData = await getArticleData('setting_carousel');
        const recommendData = await getArticleData('setting_recommend');
        const informationData = await getArticleData('setting_information');
        const campaignsData = await getArticleData('setting_campaigns');
        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                carousel: carouselData,
                recommend: recommendData,
                information: informationData,
                campaigns: campaignsData
            }
        });
    } catch (error) {
        console.log(error);
        res.json({
            code: 500,
            msg: '服务端错误'
        });
    }
}
// 获取阅读数量前十的文章
exports.getHotArticle = async (req, res) => {
    try {
        // 获取已审核文章列表并获取文章作者的昵称,评论数量
        const sql = `SELECT a.*, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE a.is_check = 1
                    GROUP BY a.id, u.nickname, cmt.article_id
                    ORDER BY a.num_read DESC
                    LIMIT 10`;
        const rows = await executeQuery(sql)
        const data = rows.map((item) => {
            return {
                id: item.id,
                article_title: item.article_title,
                num_read: item.num_read,
                nickname: item.nickname,
                account: item.author,
                comment_count: item.comment_count,
                like: item.like,
                cover: item.cover,
                create_time: item.create_time,
                update_time: item.update_time,
                des: item.des,

            }
        })
        return res.json({
            code: 200,
            msg: "获取成功",
            succeed: true,
            data
        })
    } catch (error) {
        console.log("服务端错误:", error);
        return res.json({
            code: 500,
            msg: "服务端错误"
        })
    }
}
// 审核文章
exports.checkArticle = async (req, res) => {
    const { id, is_check } = req.body
    // 如果有一个为空
    if (!id || is_check == null) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }
    try {
        const sql = 'update article set is_check = ? where id = ?'
        const rows = await executeQuery(sql, [is_check, id])
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
        console.log("服务端错误：", error)
        res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}
// 点赞文章或取消点赞
exports.likeArticle = async (req, res) => {
    const { id } = req.body
    // 如果有一个为空
    if (!id) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }
    try {
        // 获取用户账号
        const token = req.cookies.token;
        const decodedToken = jwt.verify(token, secretKey);
        const account = decodedToken.account;
        // 查询是否已经点赞
        const sql = 'select * from like_article where article_id = ? and account = ?'
        const rows = await executeQuery(sql, [id, account])
        // 如果已经点赞
        if (rows.length > 0) {
            // 取消点赞
            const sql1 = 'delete from like_article where article_id = ? and account = ?'
            await executeQuery(sql1, [id, account])
            // 文章点赞数减一
            const sql2 = 'update article set `like` = `like` - 1 where id = ?'
            await executeQuery(sql2, [id])
            return res.json({
                code: 200,
                msg: '取消点赞成功',
                succeed: true
            })
        } else {
            // 点赞
            const sql3 = 'insert into like_article (article_id,account) values (?,?)'
            await executeQuery(sql3, [id, account])
            // 文章点赞数加一
            const sql4 = 'update article set `like` = `like` + 1 where id = ?'
            await executeQuery(sql4, [id])
            return res.json({
                code: 200,
                msg: '点赞成功',
                succeed: true
            })
        }
    } catch (error) {
        console.log("服务端错误:", error);
        return res.json({
            code: 500,
            msg: "服务端错误"
        })
    }
}
// 收藏文章或取消收藏
exports.collectArticle = async (req, res) => {
    const { id } = req.body
    // 如果有一个为空
    if (!id) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }
    try {
        // 获取用户账号
        const token = req.cookies.token;
        const decodedToken = jwt.verify(token, secretKey);
        const account = decodedToken.account;

        // 查询是否已经收藏
        const sql = 'select * from collect_article where article_id = ? and account = ?'
        const rows = await executeQuery(sql, [id, account])
        // 如果已经收藏
        if (rows.length > 0) {
            // 取消收藏
            const sql1 = 'delete from collect_article where article_id = ? and account = ?'
            await executeQuery(sql1, [id, account])
            return res.json({
                code: 200,
                msg: '取消收藏成功',
                succeed: true
            })
        } else {
            // 收藏
            const sql3 = 'insert into collect_article (article_id,account) values (?,?)'
            await executeQuery(sql3, [id, account])
            return res.json({
                code: 200,
                msg: '收藏成功',
                succeed: true
            })
        }
    } catch (error) {
        console.log("服务端错误:", error);
        return res.json({
            code: 500,
            msg: "服务端错误"
        })
    }
}
// 获取用户收藏的文章列表
exports.getUserCollectArticleList = async (req, res) => {
    const { page, pageSize } = req.query;
    try {
        // 获取用户账号
        const token = req.cookies.token;
        const decodedToken = jwt.verify(token, secretKey);
        const account = decodedToken.account;
        // 获取文章列表
        const sql = `SELECT a.*, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE a.id IN (SELECT article_id FROM collect_article WHERE account = ?)
                    GROUP BY a.id, u.nickname
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
        const rows = await executeQuery(sql, [account, (page - 1) * parseInt(pageSize), parseInt(pageSize)]);
        const sql2 = 'SELECT COUNT(*) AS total FROM article WHERE id IN (SELECT article_id FROM collect_article WHERE account = ?)';
        const rows2 = await executeQuery(sql2, [account]);
        const data = rows.map((item) => {
            return {
                id: item.id,
                article_title: item.article_title,
                author: item.author,
                nickname: item.nickname,
                category_id: item.category_id,
                category_name: item.category_name,
                cover: item.cover,
                create_time: item.create_time,
                update_time: item.update_time,
                comment_count: item.comment_count,
                des: item.des,
                album_name: item.name,
                is_check: item.is_check,
                is_top: item.is_top,
                like: item.like,
                num_read: item.num_read
            };
        })
        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                list: data,
                total: Math.ceil(rows2[0].total / pageSize)
            }
        })
    } catch (error) {
        console.error("服务端错误：", error);
        res.json({
            code: 500,
            msg: '服务端错误'
        });
    }
}