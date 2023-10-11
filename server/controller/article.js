const executeQuery = require('../db')
const crypot = require('crypto')
// 新增文章
exports.addArticle = async (req, res) => {
    const { article_title, des, content, category_id, cover, author } = req.body
    // 如果有一个为空
    if (!article_title || !des || !content || !category_id || !cover || !author) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }

    try {
        const create_time = new Date()
        const sql = 'insert into article (article_title,des,content,category_id,cover,author,create_time) values (?,?,?,?,?,?,?)'
        const rows = await executeQuery(sql, [article_title, des, content, category_id, cover, author, create_time])
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
        // 关键字模糊查询
        const sql = 'select * from article where article_title like ?'
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
    const { page, pageSize, category_id } = req.query;
    try {
        let sql;
        let params;

        if (category_id == null || category_id === 'all') {
            // 获取所有文章，不限分类, 评论数
            sql = `SELECT a.*, c.category_name, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN category c ON FIND_IN_SET(c.id, a.category_id)
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    GROUP BY a.id, u.nickname, c.category_name, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
            params = [(page - 1) * parseInt(pageSize), parseInt(pageSize)];
        } else {
            // 获取指定分类下的文章
            sql = `SELECT a.*, c.category_name, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN category c ON FIND_IN_SET(c.id, a.category_id)
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    WHERE a.category_id = ?
                    GROUP BY a.id, u.nickname, c.category_name, cmt.article_id
                    ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC
                    LIMIT ?, ?`;
            params = [category_id, (page - 1) * parseInt(pageSize), parseInt(pageSize)];
        }

        const rows = await executeQuery(sql, params);

        const sql2 = 'SELECT COUNT(*) AS total FROM article' + (category_id !== undefined ? ' WHERE category_id = ?' : '');
        const rows2 = await executeQuery(sql2, [category_id]);
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
// 分页获取指定用户的文章列表,评论数
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
        // 增加文章阅读次数,获取作者昵称
        const sql = `SELECT a.*, u.nickname
                        FROM article a
                        LEFT JOIN users u ON a.author = u.account
                        WHERE a.id = ?`;
        const sql1 = 'update article set num_read = num_read + 1 where id = ?'
        await executeQuery(sql1, [id])
        const rows = await executeQuery(sql, [id])
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
        const sql = 'update article set article_title = ?,des = ?,content = ?,category_id = ?,cover = ? where id = ?'
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
// 置顶文章
exports.updateIsTop = async (req, res) => {
    const { id, is_top } = req.body
    console.log(id, is_top);
    // 如果有一个为空
    if (!id || is_top == null) {
        res.json({
            code: 400,
            msg: '参数错误'
        })
        return
    }
    try {
        const sql = 'update article set is_top = ? where id = ?'
        const rows = await executeQuery(sql, [is_top, id])
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
        // 获取文章列表
        const sql = 'SELECT * FROM settings WHERE name = ?';
        const carousel = await executeQuery(sql, ['carousel']);
        const recommend = await executeQuery(sql, ['recommend']);
        const information = await executeQuery(sql, ['information']);
        const campaigns = await executeQuery(sql, ['campaigns']);
        const carouselId = JSON.parse(carousel[0].array);
        const recommendId = JSON.parse(recommend[0].array);
        const informationId = JSON.parse(information[0].array);
        const campaignsId = JSON.parse(campaigns[0].array);
        // 构造查询条件
        const articleIds = [].concat(carouselId, recommendId, informationId, campaignsId).filter(id => id !== null);

        // 使用占位符构造 IN 子句，根据文章ID数组查询文章列表，排除content列
        const placeholders = articleIds.map(() => '?').join(',');
        if (placeholders.length == 0) {
            return res.json({
                code: 404,
                msg: '没有找到其他文章'
            })
        }
        // 查询文章列表,并获得文章的作者昵称,评论数
        const sql2 = `SELECT a.*, u.nickname, COUNT(cmt.id) AS comment_count
                  FROM article a
                  LEFT JOIN users u ON a.author = u.account
                  LEFT JOIN comment cmt ON cmt.article_id = a.id
                  WHERE a.id IN (${placeholders})
                  GROUP BY a.id, u.nickname
                  ORDER BY CAST(a.update_time AS DATETIME) DESC, CAST(a.create_time AS DATETIME) DESC`;

        const rows = await executeQuery(sql2, articleIds);

        // 组织结果成分组结构
        const groupedResults = {
            carousel: [],
            recommend: [],
            information: [],
            campaigns: [],
        };
        // 遍历查询结果，根据ID分组
        rows.forEach(row => {
            if (carouselId && carouselId.includes(row.id.toString())) {
                groupedResults.carousel.push(row);
            } else if (recommendId && recommendId.includes(row.id.toString())) {
                groupedResults.recommend.push(row);
            } else if (informationId && informationId.includes(row.id.toString())) {
                groupedResults.information.push(row);
            } else if (campaignsId && campaignsId.includes(row.id.toString())) {
                groupedResults.campaigns.push(row);
            }
        });


        res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: groupedResults
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
        // 获取文章列表并获取文章作者的昵称,评论数量
        const sql = `SELECT a.*, u.nickname, COUNT(cmt.id) AS comment_count
                    FROM article a
                    LEFT JOIN users u ON a.author = u.account
                    LEFT JOIN comment cmt ON cmt.article_id = a.id
                    GROUP BY a.id, u.nickname
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