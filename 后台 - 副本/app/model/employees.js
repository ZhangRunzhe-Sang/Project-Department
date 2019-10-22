module.exports = app => {
    const {
        STRING
    } = app.Sequelize;

    const Employees = app.model.define('employees', { //sequelize会自动创建主键
        staff_name: STRING,
        staff_phone:STRING,
        staff_nub:STRING,
        staff_pas:STRING,
    }) 


    // Clazz.associate = function () {
    //     app.model.Employees.belongsTo(app.model.Students, {  //设置外键
    //         foreignKey: 'students_id',
    //         as: 'students'
    //     })
    // }
    return Employees;
}