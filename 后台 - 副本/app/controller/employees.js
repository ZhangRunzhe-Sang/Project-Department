'use strict';

const Controller = require('egg').Controller;

class EmployeesController extends Controller {
  // 查找
  async getemployees() {
    const getemployees = await this.ctx.service.employees.getemployees()
    this.ctx.body = getemployees
  }
  // 添加
  async postemployees() {
    const postemployees = await this.ctx.service.employees.postemployees()
    this.ctx.body = postemployees
  }
}

module.exports = EmployeesController;