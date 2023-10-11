const executeQuery = require('../db')

// 首页设置
exports.homeSetting = async (req, res) => {
    const { carousel, recommend, information, campaigns } = req.body
    try {
        // 更新carousel,recommend,information,campaigns的array字段
        const sql = 'update settings set array = ? where name = ?'
        await executeQuery(sql, [JSON.stringify(carousel), 'carousel'])
        await executeQuery(sql, [JSON.stringify(recommend), 'recommend'])
        await executeQuery(sql, [JSON.stringify(information), 'information'])
        await executeQuery(sql, [JSON.stringify(campaigns), 'campaigns'])
        // 更新campaigns的is_campaigns字段,将campaigns中的id对应的is_campaigns字段设置为1,其余设置为0
        for (let i = 0; i < campaigns.length; i++) {
            const sql = 'update article set is_campaigns = ? where id = ?'
            await executeQuery(sql, [1, parseInt(campaigns[i])])
        }
        const sql3 = 'update article set is_campaigns = ? where id not in (?)'
        await executeQuery(sql3, [0, campaigns])


        return res.json({
            code: 200,
            msg: '设置成功',
            succeed: true
        })
    } catch (error) {
        console.log("服务端错误", error)
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}
// 获取首页设置
exports.getHomeSetting = async (req, res) => {
    try {
        const sql = 'SELECT array FROM settings WHERE name = ?';
        const carousel = await executeQuery(sql, ['carousel']);
        const recommend = await executeQuery(sql, ['recommend']);
        const information = await executeQuery(sql, ['information']);
        const campaigns = await executeQuery(sql, ['campaigns']);
        const carouselTitles = JSON.parse(carousel[0].array);
        const recommendTitles = JSON.parse(recommend[0].array);
        const informationTitles = JSON.parse(information[0].array);
        const campaignsTitles = JSON.parse(campaigns[0].array);
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                carousel: carouselTitles,
                recommend: recommendTitles,
                information: informationTitles,
                campaigns: campaignsTitles,
            }
        });
    } catch (error) {
        console.log("服务端错误", error);
        return res.json({
            code: 500,
            msg: '服务端错误'
        });
    }
}
