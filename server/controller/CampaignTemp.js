const executeQuery = require('../db')

// 参与活动,进入待审核状态
exports.joinCampaignOfStatus = async (req, res) => {
    const { user, campaign } = req.body
    try {
        // 如果被拒绝
        const sql1 = `select * from user_campaigns where user=? and campaign=? and status = 2`
        const isRefuse = await executeQuery(sql1, [user, campaign])
        if (isRefuse.length !== 0) {
            return res.json({
                code: 200,
                msg: '您已被禁止参与该活动,请联系管理员核实情况',
                succeed: true,
                status: 2
            })
        }
        // 如果已经有记录了，就不再添加
        const sql0 = `select * from user_campaigns where user=? and campaign=? and status = 0`
        const isJoin = await executeQuery(sql0, [user, campaign])
        if (isJoin.length !== 0) {
            return res.json({
                code: 200,
                msg: '已有记录,请勿重复提交,等待审核',
                succeed: true,
                status: 0
            })
        }
        // 如果已经参与了
        const sql2 = `select * from user_campaigns where user=? and campaign=? and status = 1`
        const isJoin2 = await executeQuery(sql2, [user, campaign])
        if (isJoin2.length !== 0) {
            return res.json({
                code: 200,
                msg: '审核已通过，快去发布作品吧',
                succeed: true,
                status: 1
            })
        }

        const sql = `insert into user_campaigns (user, campaign, status) values (?, ?, ?)`
        await executeQuery(sql, [user, campaign, 0])
        return res.json({
            code: 200,
            msg: '参与成功,等待审核',
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

// 同意参与活动
exports.joinCampaignOfAgree = async (req, res) => {
    const { user, campaign } = req.body
    console.log(user, campaign);
    try {
        const sql = `update user_campaigns set status=1 where user=? and campaign=?`
        const isStatus = await executeQuery(sql, [user, parseInt(campaign)])
        console.log(isStatus);
        if (isStatus.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '审核失败'
            })
        }
        // 更新用户的campaigns字段
        const sql4 = 'select campaigns from users where account = ?'
        const sql1 = 'update users set campaigns = ? where account = ?'
        const sql2 = 'select join_num from campaigns where id = ?'
        const sql3 = 'update campaigns set join_num = ? where id = ?'
        const [campaigns] = await executeQuery(sql4, [user])
        // 没参与
        if (campaigns.campaigns == '' || campaigns.campaigns == null) {
            let campaignsArray = []
            campaignsArray.push(campaign)
            await executeQuery(sql1, [JSON.stringify(campaignsArray), user])
            const [join_num] = await executeQuery(sql2, [campaign])
            await executeQuery(sql3, [join_num.join_num + 1, campaign])
            // 更新活动的join_num字段
            return res.json({
                code: 200,
                msg: '审核通过成功',
                succeed: true
            })
        }
        // 已经参与
        const newCampaigns = JSON.parse(campaigns.campaigns)
        if (newCampaigns.includes(campaign)) {
            return res.json({
                code: 200,
                msg: '已参与',
                succeed: true
            })
        }
        // 参与其他活动
        newCampaigns.push(campaign)
        await executeQuery(sql1, [JSON.stringify(newCampaigns), user])
        const [join_num] = await executeQuery(sql2, [campaign])
        await executeQuery(sql3, [join_num.join_num + 1, campaign])
        // 更新活动的join_num字段
        return res.json({
            code: 200,
            msg: '参与成功',
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

// 拒绝参与活动
exports.joinCampaignOfRefuse = async (req, res) => {
    const { user, campaign } = req.body
    try {
        const sql = `update user_campaigns set status=2 where user=? and campaign=?`
        const isStatus = await executeQuery(sql, [user, parseInt(campaign)])
        if (isStatus.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '审核失败'
            })
        }
        return res.json({
            code: 200,
            msg: '审核拒绝成功',
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

// 分页获取指定状态的参与活动列表
exports.getCampaignsStatusUser = async (req, res) => {
    const { status, page, pageSize } = req.query
    try {
        // 获得活动user_campaigns的campaign字段
        const sql3 = `select campaign from user_campaigns where status=? limit ?, ?`
        const rows3 = await executeQuery(sql3, [status, (page - 1) * parseInt(pageSize), parseInt(pageSize)])
        // 获得活动信息
        const sql4 = `select title,id from campaigns where id=?`
        let campaigns = []
        for (let i = 0; i < rows3.length; i++) {
            const [campaign] = await executeQuery(sql4, [rows3[i].campaign])
            campaigns.push(campaign)
        }
        const sql = `select * from user_campaigns where status=? limit ?, ?`
        const rows = await executeQuery(sql, [status, (page - 1) * parseInt(pageSize), parseInt(pageSize)])
        const sql1 = `select count(*) as total from user_campaigns where status=?`
        const [total] = await executeQuery(sql1, [status])
        const data = {
            ...rows.map((item, index) => {
                return {
                    ...item,
                    campaign: campaigns[index].title,
                    campaignId: campaigns[index].id
                }
            })
        }
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: data,
            // 总页数，向上取整
            totalPage: Math.ceil(total.total / parseInt(pageSize))
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}