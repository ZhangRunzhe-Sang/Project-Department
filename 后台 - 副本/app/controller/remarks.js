'use strict';

const Controller = require('egg').Controller;

class RemarksController extends Controller {
    async getremarks() {
        const getremarks = await this.ctx.service.remarks.getremarks();
        this.ctx.body = getremarks
    }
    async postremarks() {
        const postremarks = await this.ctx.service.remarks.postremarks();
        this.ctx.body = postremarks
    }
    async putremarks() {
        const putremarks = await this.ctx.service.remarks.putremarks();
        this.ctx.body = putremarks
    }  
}

module.exports = RemarksController;
