'use strict';

const Service = require('egg').Service;

class StudentsService extends Service {
    //添加
    async poststudents() {
        let name = this.ctx.request.body;
        // console.log(name)
        // console.log(888888888)
        const students = {
            student_name: name.student_name,
            school: name.school,
            phone: name.phone,
            category: name.selected,
            parent_phone: name.parent_phone,
            parent_name: name.parent_name
        }
        await this.app.model.Students.create(students)

    }
    // 删除
    async deletestudents() {
        const id = this.ctx.params.id; 
        
        const students = await this.app.model.Students.findOne({
            where: {
                id: id
            }
        });
        students.destroy();
        this.ctx.redirect("/students")
    }

    // 查找
    async getstudentlist() {
        const studentList = await this.app.model.Students.findAll();
        return studentList
    }

}

module.exports = StudentsService;