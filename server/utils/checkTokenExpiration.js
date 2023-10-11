const jwt = require("jsonwebtoken");
const jwtconfig = require("../jwt_config");
const secretKey = jwtconfig.jwsSecretKey;

// 对请求中的cookie中的token进行验证
const authToken = async (req, res, next) => {
    // 获取cookie中的token
    const token = req.cookies.token;
    // 如果没有token
    if (!token) {
        return res.json({
            code: 400,
            msg: "请先登录",
        });
    }
    // 如果有token
    try {
        const decodedToken = jwt.verify(token, secretKey);
        req.userId = decodedToken.userId;
        // 验证token
        const decoded = jwt.verify(token, secretKey);
        // 如果token过期
        if (decoded.exp <= Date.now() / 1000) {
            return res.json({
                code: 400,
                msg: "登录已过期",
            });
        }
        // 如果token未过期
        next();
    } catch (error) {
        if (error.name === 'TokenExpiredError') {
            return res.json({
                code: 401,
                message: '登录已过期'
            });
        }
        console.log("服务端错误：", error);
        return res.json({
            code: 400,
            msg: "服务端错误",
        });
    }
};

module.exports = authToken;
