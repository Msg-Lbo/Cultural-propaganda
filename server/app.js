const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const bodyPaser = require('body-parser');
const multer = require('multer');

const app = express();
const host = '127.0.0.1';
const port = 9090;

const corsOptions = {
    origin: ['http://localhost:5173'], // 允许访问的域名。也可以使用函数进行更复杂的判断。
    methods: 'GET,POST', // 允许的 HTTP 方法。
    allowedHeaders: 'Content-Type,Authorization', // 允许的请求头。
    exposedHeaders: 'Content-Length', // 允许暴露给客户端的响应头。
    credentials: true, // 允许发送身份凭证（如 cookies）。
};

app.use(cors(corsOptions));
app.use(bodyPaser.urlencoded({ extended: true }));
app.use(bodyPaser.json());
const upload = multer({
    dest: './public/uploads/',
});
app.use(upload.any());
app.use(express.static('./public'));
app.use(cookieParser());
app.use('/api', require('./router'));

app.listen(port, host, () => {
    console.log(`Server is running on http://${host}:${port}`);
});