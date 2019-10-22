module.exports = app => {
    const {
        STRING
    } = app.Sequelize;

    const Students = app.model.define('students', {
        student_name: STRING,
        school: STRING,
        phone:STRING,
        category:STRING,
        parent_phone:STRING,
        parent_name:STRING
    })

    // Students.associate = function () {
    //     app.model.Students.belongsTo(app.model.Employees, {  //设置外键
    //         foreignKey: 'employees_id',
    //         as: 'employees'
    //     })
    // }

    return Students;
}