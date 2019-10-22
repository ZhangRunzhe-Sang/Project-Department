'use strict';

const Service = require('egg').Service;

class EmployeesService extends Service {
    // 查找
    async getemployees() {
        const getemployees = await this.app.model.Employees.findAll();
        return getemployees
    }
    // 添加
    async postemployees() {
        let name = this.ctx.request.body;
        // console.log(name)
        // console.log(888888888)
        const employees = {
            staff_name: name.new_name, 
            staff_phone:name.new_phone,
            staff_nub: name.new_nub,
            staff_pas: name.new_pas
        }
        await this.app.model.Employees.create(employees)
    }
}
 
module.exports = EmployeesService;