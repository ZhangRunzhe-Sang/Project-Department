'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  // async index() {
  //   const { ctx } = this;
  //   ctx.body = 'hi, egg';
  // }
  async denglu() {
    const denglu = await this.ctx.service.login.login()
    this.ctx.body = denglu
    console.log(denglu)
  }
}

module.exports = HomeController;
