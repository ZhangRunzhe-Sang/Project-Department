        'use strict';

const Service = require('egg').Service;

class RemarksService extends Service {
    async getremarks() {
        const getremarks = await this.app.model.Remarks.findAll();
        return getremarks
    }
    async postremarks() {
        let name = this.ctx.request.body;
        const remarks = {
            time: name.remarks_time,
            category: name.remarks_category,
            event: name.remarks_event,
        }
        await this.app.model.Remarks.create(remarks);
        this.ctx.redirect("/remarks")
    }
    async putremarks() {
        let id = this.ctx.params.id
        let putremarks = this.ctx.request.body.putremarks
        let row = {
            name: putremarks
        },
            options = {
                where: {
                    id: id
                }
            }
        await this.app.model.Remarks.update(row, options);
        const remarks = await this.app.model.remarks.findAll();
        return remarks
    }
}

module.exports = RemarksService;
