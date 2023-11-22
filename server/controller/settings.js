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
        // 更新article表中的is_carousel字段
        const checkColumnSql = "SHOW COLUMNS FROM article LIKE 'is_campaigns'"
        let columnExists = await executeQuery(checkColumnSql)
        //  如果不存在is_carousel字段,则添加is_carousel字段
        if (columnExists && columnExists.length === 0) {
            const addColumnSql = 'ALTER TABLE article ADD COLUMN is_campaigns INT DEFAULT 0'
            await executeQuery(addColumnSql)
        }

        // 更新campaigns的is_campaigns字段,将campaigns中的id对应的is_campaigns字段设置为1,其余设置为0
        if (campaigns !== null && campaigns !== undefined) {
            const updateAllCampaignsSql = 'UPDATE article SET is_campaigns = ?'
            await executeQuery(updateAllCampaignsSql, [0])
        }else{
            const updateOtherCampaignsSql = 'UPDATE article SET is_campaigns = ? WHERE id NOT IN (?)'
            await executeQuery(updateOtherCampaignsSql, [0, campaigns])
        }

        const updateOtherCampaignsSql = 'UPDATE article SET is_campaigns = ? WHERE id NOT IN (?)'
        await executeQuery(updateOtherCampaignsSql, [0, campaigns])

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
