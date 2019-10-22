module.exports = app => {
    const {
        STRING,
    }   =app.Sequelize;

    const Remarks = app.model.define('remarks',{
        time:STRING,
        category:STRING,
        event:STRING,
    })
    return Remarks
}