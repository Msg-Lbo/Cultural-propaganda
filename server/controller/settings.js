const executeQuery = require('../db')

// 首页设置
exports.homeSetting = async (req, res) => {
    const { carousel, recommend, information, campaigns } = req.body
    try {
        // console.log(carousel, recommend, information, campaigns);
        // 清空 setting_carousel setting_recommend setting_information setting_campaigns 表
        const sql1 = `delete from setting_carousel`
        const sql2 = `delete from setting_recommend`
        const sql3 = `delete from setting_information`
        const sql4 = `delete from setting_campaigns`
        await executeQuery(sql1)
        await executeQuery(sql2)
        await executeQuery(sql3)
        await executeQuery(sql4)
        if (carousel) {
            carousel.forEach(async item => {
                // id从1开始
                const id = carousel.indexOf(item) + 1
                // 插入数据
                const sql5 = `insert into setting_carousel (id, article_id) values (?, ?)`
                await executeQuery(sql5, [id, item])

            });
        }
        if (recommend) {
            recommend.forEach(async item => {
                // id从1开始
                const id = recommend.indexOf(item) + 1
                const sql6 = `insert into setting_recommend (id, article_id) values (?, ?)`
                await executeQuery(sql6, [id, item])

            });
        }
        if (information) {
            information.forEach(async item => {
                // id从1开始
                const id = information.indexOf(item) + 1
                const sql7 = `insert into setting_information (id, article_id) values (?, ?)`
                await executeQuery(sql7, [id, item])
            });
        }
        if (campaigns) {
            campaigns.forEach(async item => {
                // id从1开始
                const id = campaigns.indexOf(item) + 1
                const sql8 = `insert into setting_campaigns (id, article_id) values (?, ?)`
                await executeQuery(sql8, [id, item])
            });
        }
        return res.json({
            code: 200,
            succeed: true,
            msg: '更新首页设置成功',
        })
    } catch (error) {
        console.log("服务端错误", error);
        return res.json({
            code: 500,
            msg: '服务端错误'
        });
    }
}
// 获取首页设置
exports.getHomeSetting = async (req, res) => {
    try {
        const sql1 = `select * from setting_carousel`
        const sql2 = `select * from setting_recommend`
        const sql3 = `select * from setting_information`
        const sql4 = `select * from setting_campaigns`
        const result1 = await executeQuery(sql1)
        const result2 = await executeQuery(sql2)
        const result3 = await executeQuery(sql3)
        const result4 = await executeQuery(sql4)

        // 遍历数组，将article_id取出，并查询article表，返回文章标题和id
        let carousel = []
        for (const item of result1) {
            const sql5 = `select id, article_title from article where id = ?`
            const [result] = await executeQuery(sql5, [item.article_id])
            carousel.push(result)
        }
        let recommend = []
        for (const item of result2) {
            const sql6 = `select id, article_title from article where id = ?`
            const [result] = await executeQuery(sql6, [item.article_id])
            recommend.push(result)
        }
        let information = []
        for (const item of result3) {
            const sql7 = `select id, article_title from article where id = ?`
            const [result] = await executeQuery(sql7, [item.article_id])
            information.push(result)
        }
        let campaigns = []
        for (const item of result4) {
            const sql8 = `select id, article_title from article where id = ?`
            const [result] = await executeQuery(sql8, [item.article_id])
            campaigns.push(result)
        }


        return res.json({
            code: 200,
            msg: '获取首页设置成功',
            succeed: true,
            data: {
                carousel,
                recommend,
                information,
                campaigns
            }
        })
    } catch (error) {
        console.log("服务端错误", error);
        return res.json({
            code: 500,
            msg: '服务端错误'
        });
    }
}
