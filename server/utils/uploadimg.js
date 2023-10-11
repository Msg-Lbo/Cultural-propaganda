const crypot = require('crypto')
const executeQuery = require('../db')
exports.uploadAvatar = async (req, res) => {
    try {
        const onlyId = crypot.randomUUID()
        const file = req.files[0]
        // 用时间戳命名图片
        const fileName = new Date().getTime()
        // 获取文件后缀
        const suffix = file.originalname.split('.')[1];
        // 组合文件名
        const newFileName = fileName + '.' + suffix;
        fs.renameSync('./public/uploads/' + file.filename, './public/uploads/avatars/' + newFileName)
        const sql = 'insert into avatars (only_id,image_url) values(?,?)'
        const imgName = `http://127.0.0.1:9090/uploads/avatars/${newFileName}`
        const rows = await executeQuery(sql, [onlyId, imgName])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '上传失败'
            })
        }
        return res.json({
            code: 200,
            msg: '上传成功',
            succeed: true,
            data: {
                image_url: 'http://127.0.0.1:9090/uploads/avatars/' + newFileName,
                only_id: onlyId
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

exports.uploadCover = async (req, res) => {
    try {
        const onlyId = crypot.randomUUID()
        const file = req.files[0]
        // 用时间戳命名图片
        const fileName = new Date().getTime()
        // 获取文件后缀
        const suffix = file.originalname.split('.')[1];
        // 组合文件名
        const newFileName = fileName + '.' + suffix;
        fs.renameSync('./public/uploads/' + file.filename, './public/uploads/articleCovers/' + newFileName)
        const sql = 'insert into images (only_id,image_url) values(?,?)'
        const imgName = `http://127.0.0.1:9090/uploads/articleCovers/${newFileName}`
        const rows = await executeQuery(sql, [onlyId, imgName])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '上传失败'
            })
        }
        return res.json({
            code: 200,
            msg: '上传成功',
            succeed: true,
            data: {
                image_url: 'http://127.0.0.1:9090/uploads/articleCovers/' + newFileName,
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

exports.uploadImage = async (req, res) => {
    try {
        const onlyId = crypot.randomUUID()
        const file = req.files[0]
        // 用时间戳命名图片
        const fileName = new Date().getTime()
        // 获取文件后缀
        const suffix = file.originalname.split('.')[1];
        // 组合文件名
        const newFileName = fileName + '.' + suffix;
        fs.renameSync('./public/uploads/' + file.filename, './public/uploads/articleImages/' + newFileName)
        const sql = 'insert into images (only_id,image_url) values(?,?)'
        const imgName = `http://127.0.0.1:9090/uploads/articleImages/${newFileName}`
        const rows = await executeQuery(sql, [onlyId, imgName])
        if (rows.affectedRows !== 1) {
            return res.json({
                code: 400,
                msg: '上传失败'
            })
        }
        return res.json({
            code: 200,
            msg: '上传成功',
            succeed: true,
            data: {
                image_url: 'http://127.0.0.1:9090/uploads/articleImages/' + newFileName,
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