const mysql = require('mysql2/promise'); // 注意这里使用 mysql2/promise

// 创建数据库连接池
const pool = mysql.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'banana',
    password: '141444',
    database: 'cultural',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
});

// 使用连接池执行查询
const executeQuery = async (sql, values) => {
    try {
        const connection = await pool.getConnection();
        const [results] = await connection.query(sql, values);
        connection.release();
        return results;
    } catch (error) {
        throw error;
    }
};

module.exports = executeQuery;
