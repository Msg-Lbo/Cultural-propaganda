# 一个简单的文化管理平台
### 前端基于Vue3+Vite+Typescript+Naive UI开发
### 后端基于Express+Mysql开发

## 须知

数据库内包含较多测试文章,请自行删除

#### 项目包含较多图片,请单独下载

[图片下载](https://www.123pan.com/s/LiRRVv-9wwV3.html)

将下载完成的压缩包解压至`server`下并替换`public`文件夹

另外需要将Mysql的字符集改成**utf8mb4**格式

`server/db/index.js`中修改为自己的数据库配置

`server/jwt_config/index.js`中也可以修改,如果不知道那是什么,就不需要修改

`server/app.js`中,建议修改cors配置,不保证每个环境下前端路径都是`http://localhost:5173`,请根据自己实际情况修改

## 开始

### 安装依赖

```bash
git clone https://github.com/Msg-Lbo/Cultural-propaganda.git
cd client
npm install
cd server
npm install
```

### 运行项目

```bash
cd client
npm run dev
cd server
node app.js
```

### 打包

```bash
npm run build
```

### 其他

超级管理员:

账号:msglbo
密码:141444



