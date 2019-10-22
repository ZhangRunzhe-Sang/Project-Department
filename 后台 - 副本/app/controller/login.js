'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
    async login() {
        const login = await this.ctx.service.login.login()
        this.ctx.body = login
    }

    async zhuce() {
        await this.ctx.render('zhuce.html')
    }

    async create() {
        const body = this.ctx.request.body;

        const log = {
            name: body.username,
            // password:md5(body.password),
            password: body.password
        }
        await this.app.model.Log.create(log);
        this.ctx.redirect("/")
    }
}

module.exports = HomeController;