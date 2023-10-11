const executeQuery = require('../db')

// 发布活动
exports.publishCampaign = async (req, res) => {
    const { title, content, cover, author, start_time, end_time } = req.body
    try {
        const sql = 'insert into campaigns (title,content,cover,author,start_time,end_time) values (?,?,?,?,?,?)'
        await executeQuery(sql, [title, content, cover, author, start_time, end_time])
        return res.json({
            code: 200,
            msg: '发布成功',
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

// 参与活动
exports.joinCampaign = async (req, res) => {
    const { id, user } = req.body
    try {
        // 更新用户的campaigns字段
        const sql = 'select campaigns from users where account = ?'
        const sql1 = 'update users set campaigns = ? where account = ?'
        const sql2 = 'select join_num from campaigns where id = ?'
        const sql3 = 'update campaigns set join_num = ? where id = ?'
        const [campaigns] = await executeQuery(sql, [user])
        // 没参与
        if (campaigns.campaigns == '' || campaigns.campaigns == null) {
            let campaignsArray = []
            campaignsArray.push(id)
            await executeQuery(sql1, [JSON.stringify(campaignsArray), user])
            const [join_num] = await executeQuery(sql2, [id])
            await executeQuery(sql3, [join_num.join_num + 1, id])
            // 更新活动的join_num字段
            return res.json({
                code: 200,
                msg: '参与成功',
                succeed: true
            })
        }
        // 已经参与
        const newCampaigns = JSON.parse(campaigns.campaigns)
        if (newCampaigns.includes(id)) {
            return res.json({
                code: 200,
                msg: '已参与',
                succeed: true
            })
        }
        // 参与其他活动
        newCampaigns.push(id)
        console.log(newCampaigns);
        await executeQuery(sql1, [JSON.stringify(newCampaigns), user])
        const [join_num] = await executeQuery(sql2, [id])
        await executeQuery(sql3, [join_num.join_num + 1, id])
        // 更新活动的join_num字段
        return res.json({
            code: 200,
            msg: '参与成功',
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

// 修改活动
exports.updateCampaigns = async (req, res) => {
    const { id, title, content, cover, start_time, end_time } = req.body
    try {
        const sql = 'update campaigns set title = ?,content = ?,cover = ?,start_time = ?,end_time = ? where id = ?'
        await executeQuery(sql, [title, content, cover, start_time, end_time, id])
        return res.json({
            code: 200,
            msg: '修改成功',
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

// 获取活动列表
exports.getCampaignsList = async (req, res) => {
    const { page, pageSize } = req.query
    try {
        const sql = 'select * from campaigns limit ?,?'
        const campaignsList = await executeQuery(sql, [(page - 1) * parseInt(pageSize), parseInt(pageSize)])
        const sql1 = 'select count(*) as total from campaigns'
        const total = await executeQuery(sql1)
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                campaignsList,
                // 总页数,向上取整
                total: Math.ceil(total[0].total / parseInt(pageSize))

            }
        })
    } catch (error) {
        console.log("服务端错误", error)
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 获取活动详情
exports.getCampaignsDetail = async (req, res) => {
    const { id } = req.query
    try {
        const sql = 'select * from campaigns where id = ?'
        const campaignsDetail = await executeQuery(sql, [id])
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: campaignsDetail[0]
        })
    } catch (error) {
        console.log("服务端错误", error)
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 获取用户参与的活动
exports.getUserCampaigns = async (req, res) => {
    const { user } = req.query
    try {
        const sql = 'select campaigns from user where username = ?'
        const campaigns = await executeQuery(sql, [user])
        if (campaigns[0].campaigns === null) {
            return res.json({
                code: 200,
                msg: '获取成功',
                succeed: true,
                data: []
            })
        }
        const campaignsArray = JSON.parse(campaigns[0].campaigns)
        const sql1 = 'select * from article where id in (?)'
        const userCampaigns = await executeQuery(sql1, [campaignsArray])
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: userCampaigns
        })
    } catch (error) {
        console.log("服务端错误", error)
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 获取活动参与了哪些用户
exports.getCampaignsUsers = async (req, res) => {
    const { id } = req.query
    try {
        const sql = 'select campaigns from user'
        const campaigns = await executeQuery(sql)
        const campaignsUsers = []
        for (let i = 0; i < campaigns.length; i++) {
            const campaignsArray = JSON.parse(campaigns[i].campaigns)
            if (campaignsArray !== null && campaignsArray.includes(parseInt(id))) {
                campaignsUsers.push(campaigns[i])
            }
        }
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: campaignsUsers
        })
    } catch (error) {
        console.log("服务端错误", error)
        return res.json({
            code: 500,
            msg: '服务端错误'
        })
    }
}

// 删除活动
exports.deleteCampaigns = async (req, res) => {
    const { id } = req.body
    try {
        const sql = 'delete from campaigns where id = ?'
        await executeQuery(sql, [id])
        // 更新用户的campaigns字段
        const sql1 = 'select account,campaigns from users'
        const users = await executeQuery(sql1)
        for (let i = 0; i < users.length; i++) {
            const campaignsArray = JSON.parse(users[i].campaigns)
            if (campaignsArray !== null && campaignsArray.includes(parseInt(id))) {
                const index = campaignsArray.indexOf(parseInt(id))
                campaignsArray.splice(index, 1)
                const sql2 = 'update user set campaigns = ? where account = ?'
                await executeQuery(sql2, [JSON.stringify(campaignsArray), users[i].username])
            }
        }
        return res.json({
            code: 200,
            msg: '删除成功',
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

