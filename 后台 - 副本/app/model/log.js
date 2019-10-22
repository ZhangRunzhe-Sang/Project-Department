module.exports = app => {
    const {
        STRING
    } = app.Sequelize;

    const Log = app.model.define('log', { //sequelize会自动创建主键
        name: STRING,
        password:STRING,
    })

    return Log;
}