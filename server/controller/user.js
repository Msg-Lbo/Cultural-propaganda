const executeQuery = require('../db')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const jwtconfig = require('../jwt_config')
const crypot = require('crypto')
fs = require('fs')
const secretKey = jwtconfig.jwsSecretKey;
const expiresIn = jwtconfig.expiresIn;

// 创建用户
exports.register = async (req, res) => {
    const { account, password, email } = req.body
    // 信息是否为空
    if (!account || !password || !email) {
        return res.json({
            code: 400,
            msg: '用户名、密码、邮箱不能为空'
        })
    }

    try {
        // 如果用户名存在
        const sql1 = `select * from users where account=?`
        const exist = await executeQuery(sql1, [account])
        if (exist.length !== 0) {
            return res.json({
                code: 400,
                msg: '用户名已存在'
            })
        }

        // 如果用户名不存在
        const hashPassword = bcrypt.hashSync(password, 10)
        const identity = '用户'
        const create_time = new Date()
        const sql = `insert into users (account,password,email,identity,create_time) values(?,?,?,?,?)`
        const rows = await executeQuery(sql, [account, hashPassword, email, identity, create_time])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '注册失败'
            })
        }
        return res.json({
            code: 200,
            msg: '注册成功',
            succeed: true
        })


    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 400,
            msg: '服务端错误',
        })
    }
}
// 用户登录
exports.login = async (req, res) => {
    const { account, password } = req.body
    // 信息是否为空
    if (!account || !password) {
        return res.json({
            code: 400,
            msg: '用户名、密码不能为空'
        })
    }
    // 查询用户是否存在
    const sql = `select * from users where account=?`
    try {
        const rows = await executeQuery(sql, [account])
        if (rows.length === 0) {
            return res.json({
                code: 400,
                msg: '用户名不存在'
            })
        }
        // 用户存在
        // 比较密码
        const compareResult = bcrypt.compareSync(password, rows[0].password)
        if (!compareResult) {
            return res.json({
                code: 400,
                msg: '密码错误'
            })
        }
        // 如果用户被禁用
        if (rows[0].status === 1) {
            return res.json({
                code: 400,
                msg: '该账户已被禁用'
            })
        }
        // 密码正确
        const user = {
            ...rows[0],
            password: '',
            image_url: '',
            create_time: '',
            update_time: ''
        }
        // 生成token
        const token = jwt.sign(user, secretKey, {
            // token时效
            expiresIn: expiresIn,
        })
        // 把token放入cookie
        res.cookie('token', token, { httpOnly: true, maxAge: 3600000, sameSite: 'none', secure: true });
        return res.json({
            code: 200,
            msg: '登录成功',
            succeed: true,
            data: {
                id: rows[0].id,
            }
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 400,
            msg: '服务端错误',
        })
    }
}
// 获取全部用户
exports.getAllUsers = async (req, res) => {
    const { page, pageSize } = req.query
    // 信息是否为空
    if (!page || !pageSize) {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    try {
        // 分页查询
        const sql = 'select * from users order by CAST(create_time AS DATETIME) DESC LIMIT 0,?'
        const rows = await executeQuery(sql, [page * pageSize])
        // 分页总数向上取整
        const sql2 = 'select count(*) as total from users'
        const rows2 = await executeQuery(sql2)
        const total = Math.ceil(rows2[0].total / pageSize)
        const data = rows.map(item => {
            return {
                account: item.account,
                nickname: item.nickname || '默认用户名',
                email: item.email,
                identity: item.identity,
                create_time: item.create_time,
                status: item.status == 0 ? true : false
            }
        })
        return res.json({
            code: 200,
            msg: '获取成功',
            succeed: true,
            data: {
                total,
                data
            }
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 400,
            msg: '服务端错误',
        })
    }
}
// 删除用户
exports.deleteUser = async (req, res) => {
    const { account } = req.body
    // 信息是否为空
    if (!account) {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    try {
        const sql = 'delete from users where account=?'
        const rows = await executeQuery(sql, [account])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '删除失败'
            })
        }
        return res.json({
            code: 200,
            msg: '删除成功',
            succeed: true
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 400,
            msg: '服务端错误',
        })
    }
}
// 更新用户状态
exports.updateUser = async (req, res) => {
    const { account, status } = req.body
    // 信息是否为空
    if (!account || !status) {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    try {
        const sql = 'update users set status=? where account=?'
        const rows = await executeQuery(sql, [status, account])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '更新失败'
            })
        }
        return res.json({
            code: 200,
            msg: '更新成功',
            succeed: true
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 400,
            msg: '服务端错误',
        })
    }
}
// 忘记密码
exports.forgetPassword = async (req, res) => {
    const { account, email, newPassword } = req.body
    // 信息是否为空
    if (!account || !email || !newPassword) {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    // 查询用户是否存在
    const sql = `select * from users where account=?`
    try {
        const rows = await executeQuery(sql, [account])
        if (rows.length === 0) {
            return res.json({
                code: 400,
                msg: '用户名不存在'
            })
        }
        // 用户存在
        // 比较邮箱
        if (email !== rows[0].email) {
            return res.json({
                code: 400,
                msg: '邮箱错误'
            })
        }
        // 邮箱正确
        // 修改密码
        const hashPassword = bcrypt.hashSync(newPassword, 10)
        const sql1 = `update users set password=? where account=?`
        const rows1 = await executeQuery(sql1, [hashPassword, account])
        if (rows1.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '修改密码失败'
            })
        }
        return res.json({
            code: 200,
            msg: '修改密码成功',
            succeed: true
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 400,
            msg: '服务端错误',
        })
    }
}
// 修改密码
exports.resetPassword = async (req, res) => {
    const { account, oldPassword, newPassword } = req.body
    // 信息是否为空
    if (!account || !oldPassword || !newPassword) {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    // 查询用户是否存在
    const sql = `select * from users where account=?`
    try {
        const rows = await executeQuery(sql, [account])
        if (rows.length === 0) {
            return res.json({
                code: 400,
                msg: '用户名不存在'
            })
        }
        // 用户存在
        // 比较密码
        const compareResult = bcrypt.compareSync(oldPassword, rows[0].password)
        if (!compareResult) {
            return res.json({
                code: 400,
                msg: '密码错误'
            })
        }
        // 密码正确
        // 修改密码
        const hashPassword = bcrypt.hashSync(newPassword, 10)
        const sql1 = `update users set password=? where account=?`
        const rows1 = await executeQuery(sql1, [hashPassword, account])
        if (rows1.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '修改密码失败'
            })
        }
        return res.json({
            code: 200,
            msg: '修改密码成功',
            succeed: true
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 400,
            msg: '服务端错误',
        })
    }
}
// 用户退出登录
exports.logout = async (req, res) => {
    res.clearCookie('token', {
        sameSite: "none",
        secure: true,
    })
    // res.cookie('token', '123123',{ httpOnly: true, maxAge: 0 })

    return res.json({
        code: 200,
        msg: '退出登录成功',
        succeed: true
    })
}
// 绑定用户头像
exports.bindAccount = async (req, res) => {
    const { account, only_id, url } = req.body
    // 信息是否为空
    if (!account || !only_id || !url) {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    try {
        const sql = 'update avatars set account=? where only_id=?'
        const rows = await executeQuery(sql, [account, only_id])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '绑定失败'
            })
        }
        const sql2 = 'update users set image_url=? where account=?'
        const rows2 = await executeQuery(sql2, [url, account])
        if (rows2.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '绑定失败'
            })
        }
        return res.json({
            code: 200,
            msg: '修改成功',
            succeed: true,
            data: {
                image_url: url
            }
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}
// 获取用户信息
exports.getUserInfo = async (req, res) => {
    const { id } = req.body
    // 信息是否为空
    if (!id) {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    try {
        const sql = 'select * from users where id=?'
        const rows = await executeQuery(sql, [id])
        if (rows.length !== 1) {
            return res.json({
                code: 400,
                msg: '获取信息失败'
            })
        }
        return res.json({
            code: 200,
            msg: '获取信息成功',
            succeed: true,
            data: {
                id: rows[0].id,
                account: rows[0].account,
                nickname: rows[0].nickname,
                email: rows[0].email,
                image_url: rows[0].image_url,
                identity: rows[0].identity,
                sex: rows[0].sex
            }
        })
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}
// 修改用户信息
exports.updateUserInfo = async (req, res) => {
    const { id, nickname, sex, email } = req.body
    // 信息是否为空
    if (id == '' || nickname == '' || sex == '' || email == '') {
        return res.json({
            code: 400,
            msg: '信息不能为空'
        })
    }
    try {
        const update_time = new Date()
        const sql = 'update users set nickname=?, sex=?, email=?, update_time=? where id=?'
        const rows = await executeQuery(sql, [nickname, sex, email, update_time, id])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '修改信息失败'
            })
        }
        return res.json({
            code: 200,
            msg: '修改信息成功',
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
// 是否管理员
exports.isAdmin = async (req, res) => {
    const { account } = req.body
    // 信息是否为空
    if (!account) {
        return res.json({
            code: 400,
            msg: '请先登陆'
        })
    }
    try {
        const sql = 'select * from users where account=?'
        const rows = await executeQuery(sql, [account])
        if (rows.length !== 1) {
            return res.json({
                code: 400,
                msg: '获取信息失败'
            })
        }
        if (rows[0].identity === '管理员') {
            return res.json({
                code: 200,
                msg: '管理员',
                succeed: true,
                data: {
                    identity: rows[0].identity
                }
            })
        } else {
            return res.json({
                code: 200,
                msg: '用户',
                succeed: true,
                data: {
                    identity: rows[0].identity
                }
            })
        }
    } catch (error) {
        console.log('服务端错误：', error);
        return res.json({
            code: 500,
            msg: '服务器错误'
        })
    }
}