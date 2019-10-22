'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/',controller.login.zhuce)
  router.post('/login',controller.login.login)
  router.post('/registereds',controller.login.create)
  
  // 登录页
  router.post('/denglu',controller.home.denglu)

  // 员工查找
  router.get('/getemployees',controller.employees.getemployees)
  // 添加
  router.post('/postemployees',controller.employees.postemployees)


  // 学员添加
  router.post('/poststudents',controller.students.poststudents)
  // 查找
  router.get('/getstudentlist',controller.students.getstudentlist)
  // 删除
  router.delete('/deletestudents:id',controller.students.deletestudents)

  // 备注
  router.post('/postremarks',controller.remarks.postremarks)
  router.put('/putremarks',controller.remarks.putremarks)
  router.get('/getremarks',controller.remarks.getremarks)
};
