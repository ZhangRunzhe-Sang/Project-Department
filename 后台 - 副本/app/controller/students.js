'use strict';

const Controller = require('egg').Controller;

class StudentsController extends Controller {
  //添加
  async poststudents() {
    const studentsclass = await this.ctx.service.students.poststudents()
    this.ctx.body = studentsclass
  }

  // // 通过id删除学生信息
  async deletestudents() {
    const studentsid = await this.ctx.service.students.deletestudents()
    this.ctx.body = studentsid
  }
    
  //查询
  async getstudentlist(){
    const studentlist = await this.ctx.service.students.getstudentlist()
    this.ctx.body = studentlist
  }
}

module.exports = StudentsController;