###运行服务器 
    mysql -u root -p123456789(密码)
###查看数据库
    show databases;
    1.use （数据库名字）进入数据库
    2.create database (数据库名字); 新建数据库
    3.show tables; 查看数据库的表
    4.exit 退出服务器

###入门最基本语句
    1.mysql -u root -p123456789(密码) 链接服务器
    2.show databases; 查看所有的库
    3.use （数据库名字）选择库
    4.show tables; 查看库下面所有的表
    5.create database （数据库名字）charset 字符集; 创建数据库
    6.drop database 数据库名字; 删除一个数据库
    注意：Mysql中, 表/列可以改名，database不能改名，
    7.show tables 查看库下面所有的表
    8.创建表的语句
    create table stu(
        snum int,
        sname varchar(10)
    )engine myisam charset utf8;
    9.删除表：drop table （表名）
    10.修改表名:rename table (要改的表名) to (改之后的表名);
    11.给表添加内容:
    insert into (要添加内容的表名) values
    (1,'要添加的内容')，
    (2,'666');
    12.查看表里的所有内容:
    select * from (要查看的表的名字);
    13.清空表的数据 truncate 表名
    14.更改表 :alter table 表名

<b>注意:Truncate和delete是有区别的</b>
在于 truncate 相当于删表再重建一张同结构的表，操作后得到一张全新的表，而delete是从删除所有的层面来操作的，
Trucate相当于把旧的学籍表扔了重画一张，
Delete相当于用橡皮擦把学籍表的数据库擦掉
如果决定全清空的下，Trucate更快一些

###乱码问题
    set names gbk; 设置字符集

>查看表的结构:
desc 表名；

###创建一个简单的列表
    create table class(
        id int primary key auto_incre,emt,
        sname varchar(10) not null default '',
        gender char(1) not null default '',
        company varchar(20) not null defult '',
        salary decimal(6,2) not null default 0.00,
        fanbu smallint not null default 0
    )engine myisam charset utf8;

###增
    给列添加内容思路:

    往哪张表 添加行 class
    添加哪几列（id,sname,gender,company,salary,fanbu）
    values
    (1,'张三','男','百度',8888.64,234);

    insert into class
    (id,sname,gender,company,salary,fanbu)
    values
    (1,'张三','男','百度',8888.64,345);

    如果一次性要添加多行只需要用,
    
    (1,'张三','男','百度',8888.64,345),
    (2,'李四','男','百度',45628.4,995);

###改

    update 表名
    set 列名= 要改的内容
    where id = 要改的哪一行 （必写 否则所有的内容进行更改）

    注意: where 就只能用id=N这种形式是错误的 XXXX

    where expression，表达式，
    只要where 表达式为真，则该行就发作用

    改性别为男，且工资>8000的用户

    update class 
    set fanbu=159
    where gender='男' and salary>8000;

###删
    删除 就是指删除整行，不存在删除一行中的某几列
    
    删哪张表的数据:class
    删哪几行:where expression(表达式)

    delete from class where (表达式)

###查
    思路 
    查哪张表的数据
    查哪些列

    select
    select 要查询的列,要查询的列 from 表名 where id=6;（表达式）

    select * from class;
    * 代表所有列,表名后不加where条件,则选所有行
    因此取出所有行,所有列

###建表

    分析: 我们只要把第一行，表头建好了，这张表也就完成了。
    至于下面的 001，张三这不是表的概念，而是表中存储的数据。

    其实建表过程，就是一个画表头的过程，
    从术语上讲，这张表有四个列，
    建表的过程就是一个 声明字段 过程

###那么建表和列类型又有什么关系呢？

    分析:A4纸是数据的储存空间，而A4的大小是有限的，
    请问:你准备给学号留多宽?给姓名留多宽?自我介绍又留多宽?

    自然的，姓名如果留的过宽，比如20个字都能存，但一般人的姓名，就三四字--浪费了，
    如果留的过窄，导致存不下，更有问题。

    对应的，A4纸空间有限，硬盘空间也有限，
    我们建列时，自然想的是---能够容纳放置的内容，但是又不浪费，

    存储同样的数据，不同的列类型所占据的空间和效率是不一样的--这就是我们建表前要前列类型的意义

    所以--重点学列类型的存储范围与占据的字节关系


###MySQL三大列类型
    数值型
        整型
            Tinyint
                占据空间: 1字节存储范围，-128-127，0-255
            Smallint
                占据空间: 2字节存储范围，-32768-32767，0-65535
            Mediuint
                占据空间: 3字节存储范围，-8388608-8388607，0-16777215
            Int
                占据空间: 4字节存储范围，-2147483648-2147483647，0-4294967295
            bigint
                占据空间: 8字节存储范围，-9223372036854775808-9223372036854775807，0-18446744073709551615
        小数(浮点型/定点型)
            Float(D,M),decimal(D,M)


###int系列声明
    int，不加特殊说明，默认有符号

    unsigned
    加unsigned表示无符号,可以影响存储的范围
    -1不能插入了，因为有符号，范围是 0 255

    加列类型加unsigned表示其为无符号类型

    (M)

    zerofill zero是零,fill是填充,代表0
    M必须和zerofill配合才有意义，
    给学员添加一个学号
    1:学号不能为负,2.学号一般位数相同,即使不同,00013,01238
    即不够倍数，用0填充，

    snum统一补0，而且补到5位
    为什么是补到5位，因为M为5
    总结 M表示补0得宽度，和zerofill配合使用才有意义。

    观察snum的类型，可知zerofill则同时必是unsigned类型。
    0填充就自动无符号
    

###小数

    Float(D,M),decimal(D,M)

    浮点数在计算机里表示是比较复杂
    IEEE

    小数点左边 能大到多少?
    小数点右边 又能大到多少?

    M叫‘精度’---->代表‘总位数’，而D是‘标度’，代表小数位,（小数右边的位数）

    float(D,M) unsigned 也可以使用无符号类型

    浮点数能存 10^38 ，10^-38

    如果M<=24,点4个 字节，否则8个字节

    用来表示数据中的小数除了 float---浮点，
    还有一种叫定点decimal，定点是把整数部分，和小数部分，分开储存的。
    比float精确

    float有时会损失精度，
    如果像账户这样的敏感字段，建议用decimal

字符串类型
    char,varchar,text,blob
    char 和 varchar分别称为定长和变长类型
    char(6) 定长字符串

    对于char(N),不够N个长度,用空格在尾部补够N个长度,浪费了尾部。
    Char(M) ，M 代表宽度，0<=M<=255
    char型，如果不够M个字符，内部用空格补齐，取出时再把右侧空格删掉意味着，如果右侧本身有空格将会丢失

    varchar(100),也是储存0-100个字符

    而对于varchar(N),不用空格补齐，但列内容前，有1-2个字节来标志该列的内容长度。

    Varchar(M),M代表宽度,0<=M<=65535


    char(8)
    00000000
    'Hello  '
    'hello'
    Char(M)如何占据M个字符宽度?
    答:如果实际储存内容不足M个，则后面加空格补齐，
    取出来的时候，再把后面的空格去掉（所以，如果内容最后有空格，将会被清楚）

    速度上:定长速度快些

    注意:char(M)，varchar(M)限制的是字符，不是字节，
    即char(2)charset utf8, 能存2个utf8字符，比如‘中国’


    Text：文本类型，可以存比较大的文本段，搜索速度稍慢
    因此，如果不是特别大的内容，建议用插入，varchar来代替，
    Text 不用加默认值（加了也没用）
    一般用来储存文章内容，新闻内容等等

    Blob,是二进制类型，用来存储图像，音频等二进制信息
    意义:2进制，0-255都有可能出现
    Blob在于防止因为字符集的问题，导致信息丢失
    比如:一张图片中有0XFF字节，这个在ascii字符集认为非法，在入库的时候，被过滤了

###日期/时间类型

    dete型，存储 年-月-日

    date 能存1000-01-01 9999-12-31


    时间类型 20:20:20
    time

    datetime类型，日期时间类型
    日期时间类型输入格式YYYY-mm-dd HH:ii:ss

###mysql建表约束

    主键约束

    它能够唯一确定一张表中的一条记录，也就是我们通过给某个字段添加约束，就可以使得改字段
    不重复且不为空
    primary key 主键约束关键字


    create table user(
        id int primary key,
        name varchar(20)
    )

    id 有主键约束 它的内容不能为空也不能重复

    联合主键
    只要联合的主键值加起来不重复就可以
    create table user2(
        id int,
        name varchar(20),
        primary key(id,name)
    )

    自增约束

    自增约束关键字 auto_increment

    create table user3(
        id int primary key auto_increment,
        name varchar(20)
    )
    与主键约束一起用可以自动增长

    如果创建表的时候，忘记创建主键约束了？该怎么办？

    create table user4(
        id int,
        name varchar(20)
    )

    alter table suer4 add primary key(id);

    如何删除？？

    alter table user4 drop primary key;

    使用 modify 修改字段，添加约束
    alter table user4 modify id int primary key;

    外键约束
    涉及到两个表: 父表,子表
    主表，副标。

    关键字 foreign key (子表的内容) references classes(父表的内容)

    班级 (主表)
    create table classes(
        id int primary key,
        name varchar(20)
    );
 
    学生表 (副表)
    create table students(
        id int primary key,
        name varchar(20),
        class_id int,
        foreign key (class_id) references classes(id)
    )
    1. 主表 classes 中没有的数据值，在副表中，是不可以使用的。
    2. 主表中的记录被副表引用，是不可以被删除的。
    
    唯一约束

    约束修饰的字段的值不可以重复

    create table user5(
        id int,
        name varchar(20)
    );

    alter table user5 add unique(name)
    也可以这么写
    create table user5(
        id int,
        name varchar(20),
        unique(id,name)
    )
    也可以这么写
    create table user5(
        id int,
        name varchar(20) unique
    )

    unique(id,name) 表示两个键在一起不重复就行

    如何删除唯一约束？？
    alter table user7 drop index name;

    modify 添加?

    alter table user7 modify name varchar(20) unique;

    总结:
    1、建表的时候就添加约束
    2、可以使用 alter。。。add。。
    3、alter。。。modify。。。

    4、删除 alter。。。drop。。。


    非空约束
    修饰的字段不能为空 NULL

    create table user9(
        id int,
        name varchar(20) not null
    );

    name 不能为空  为空会报错


    默认约束
    当我们插入字段值的时候，如果没有传值，就会使用默认值

    关键字default 后面写默认值

    create table user10(
        id int,
        name varchar(20),
        age int default 10
    );

    age 默认值为10
    传了值，就不会使用默认值



###数据库的三大设计范式

    1.第一范式
    1NF

    数据表中的所有字段都是不可分割的原子值？？
    （1,'张三','中国四川省成都市武侯区武侯大道100号'）

    字段值还可以继续拆分的，就不满足第一范式
    （1,'张三','中国'四川省'成都市'武侯区武侯大道100号'）

    范式，设计的越详细，对于某些实际操作可能更好，但是不一定都是好处

    第一范式就是拆字段 
    address-》cuntry | privence | city | details
    拆的不能再拆了就满足第一范式

    2.第二范式
    必须是满足第一范式的前提下，第二范式要求，除主键外的每一列都必须完全依赖与主键。
    如果出现不完全依赖，只可能发生在联合主键的情况下。

    订单表
    create table myorder(
        product_id int,
        customer_id int,
        product_name varchar(20),
        customer_name varchar(20),
        primary key(product_id,customer_id)
    );

    问题?
    除主键以外的其他列，只依赖与主键的部分字段。
    不满足第二范式
    拆表
    create table myorder(
        order_id int primary key,
        product_id int,
        customer_id int
    );

    create table product(
        id int primary key,
        name varchar(20)
    );

    create table customer(
        id int primary key,
        name varchar(20)
    );

    分成三个表之后，就满足了第二范式的设计


    3. 第三范式
    3NF
    必须先满足第二范式，除开主键列的其他列之间不能有传递依赖关系。

    

###查询练习

    1.查询student表的所有记录。

    select * from student ;

    2.查询student表中的所有记录的 sname.ssex 和 class 列，

    select sname,seex,class from student;

    3.查询教师所有单位即不重读的depart列。
    distinct 排除重复
    select distinct depart from teacher


    4.查询score表中成绩在60到80之间的所有记录。
    between ... and ...
    select * from score where degree between 60 and 80;
    直接运算符比较
    select * from score where degree > 60 and degree < 80;

    5.查询score表中成绩为85,86或88的记录。
    表示或者关系的查询 in
    select * from score where degree in(85,86,88);


    6.查询student表中‘95031’班或性别为‘女’的同学记录。
    or表示或者
    select * from student where class='95031' or seex='女';

    7.以class降序查询student表的所有记录。
    升序，降序
    select * from student order by class desc;
    
    asc; 升序
    select * from student order by class asc ; (asc 可以省略掉默认就是升序)


    8.以cno升序，degree降序查询score表的所有记录。
    select * from score order by cno asc,degree desc;


    9. 查询‘95031’班的学生人数。
    统计 count
    select count(*) from student where class='95031';

    10. 查询score表中的最高分的学生学号和课程表。（子查询或者排序）
    select sno,cno from score where degree=(select max(degree) from score);

        1.找到最高分
        select max(degree) from score;
        
        2.找到最高分的 sno 和 cno 
        select sno,cno from score where degree=(selet max(degree) from score);


        排序做法
        limit 第一个数字表示从多少开始
        第二个数字表示查多少条

        select sno,con,degree from score order by degree desc limit 0,1;

    11.查询每门课的平均成绩。

    select * from coures;

    avg()
    select avg(degree) from score where cno='3-105',

    我能不能够在一个sql 语句中写呢?
    group by 分组
    select cno,avg(degree) from score group by cno;

    12.查询score表中至少有2名学生选修的并以3开头的课程的平均分数。

    select cno,avg(degree),count(*ssss) from score group by cno
    having count(cno)>=2 and cno like '3%';

    like '3%'（第一个是3的后面随意）


    13.查询分数大于70，小与90的sno列。

    select sno,degree from score
    where degree between 70 and 90;


    select sno,degree from score
    where degree>70 and degree<90;


    14.查询所有学生的 sname,cno 和 degree 列。

    看一下student这个表
    select sno,sname from student;

    再看一下score这个表
    select sno,cno,degree from score;

    然和这两个代码综合 吧student的sno替换成score

    select sname,cno,degree from student,score
    where student.sno=score.sno



    15.查询所有学生的sno,cname和degree列 

    select sno,cname,degree from coures,score
    where coures.cno = score.cno;


    16.查询所有学生的sname.cname和degree列。

    sname -> student
    cname -> coures
    degree -> score

    select sname,cname,degree from student,coures,score
    where student.sno=score.sno
    and coures.cno=score.cno;


    17.查询‘95031’班学生每门课的平均分

    获取95031班的数生数据
    select * from student where class='95031';

    找到95031班的成绩
    select * from score where sno in(select sno from student where class='95031');

    算平均成绩
    select cno,avg(degree)
    from score
    where sno in (select sno from student where class='95031')
    group by cno;


    18.查询选修‘3-105’课程的成绩高于‘109’号同学‘3-105’成绩的所有同学的记录。

    select degree from score where sno='109' and cno='3-105';


# sequelize

## 学习任务

1. 安装和配置egg-sequelize
2. 在controller中使用sequelize创建班级表
3. 在controller中使用sequelize创建学生表
4. 在页面中查询班级数据
5. 在页面中查询学生数据，联查所在班级
6. 创建用户表，完成登录验证
7. 了解cookie和session
8. 使用中间件判断登录状态

## sequelize文档

[中文文档](https://github.com/demopark/sequelize-docs-Zh-CN)

### 安装egg-sequelize

``` bash
# 下载依赖，安装egg-sequelize和mysql2
npm install --save egg-sequelize mysql2
```

### 在egg项目中配置egg-sequelize

``` js
// config/plugin.js
exports.sequelize = {
    enable: true,
    package: 'egg-sequelize'
}
```

``` js
// config/config.default.js
  config.sequelize = {
    dialect: 'mysql',
    database: 'army',  //数据库名
    host: 'localhost',
    port: '3306',
    username: 'root',  //用户名
    password: '',      //密码
    operatorsAliases: false,
  }
```

``` js
// 根目录 app.js
module.exports = app => {
    app.beforeStart(async function () {
        // await app.model.sync({ force: true }); // 开发环境使用，会删除数据表
        await app.model.sync({});
    });
};
```

### 编写数据模型

``` js
// app/model/clazz.js
module.exports = app => {
    const {
        STRING
    } = app.Sequelize;

    const Clazz = app.model.define('clazz', {  //sequelize会自动创建主键
        name: STRING,
    })

    return Clazz;
}
```

``` js
// app/model/students.js
module.exports = app => {
    const {
        STRING
    } = app.Sequelize;

    const Students = app.model.define('students', {
        name: STRING,
    })

    Students.associate = function () {
        app.model.Students.belongsTo(app.model.Clazz, {  //设置外键
            foreignKey: 'clazz_id',
            as: 'clazz'
        })
    }

    return Students;
}
```

### controller获取数据
``` js
// app/controller/clazz.js
'use strict';

const Controller = require('egg').Controller;

class ClazzController extends Controller {
    //查询班级列表
    async index() {  
        const clazzList = await this.app.model.Clazz.findAll();
        await this.ctx.render('clazz_list', {
            clazzList: clazzList
        })
    }

    //添加班级的页面
    async insertClazz(){  
        await this.ctx.render('create_clazz.html')
    }

    //在数据库中添加班级
    async create() {
        const body = this.ctx.request.body;
        const clazz = {
            name:body.name
        }
        await this.app.model.Clazz.create(clazz);
        this.ctx.redirect("/clazz")
    }

    //通过id在数据库中删除班级
    async destroy() {
        const id = this.ctx.request.body.clazz_id;
        const student = await this.app.model.Clazz.findOne({
            where: {
                id: id
            }
        });
        student.destroy();
        this.ctx.redirect("/clazz")
    }
}

module.exports = ClazzController;

```
``` js
// app/controller/students.js
'use strict';

const Controller = require('egg').Controller;

class StudentsController extends Controller {
    // 联查学生信息
    async index() {
        const studentList = await this.app.model.Students.findAll({
            include:[{  //联查班级的数据
                model:this.app.model.Clazz,
                as:'clazz'
            }]
        });
        await this.ctx.render('student_list.html', {
            studentList: studentList
        })
    }

    //添加学生的页面
    async insertStudent() {
        const clazzList = await this.app.model.Clazz.findAll();
        await this.ctx.render('create_student.html', {
            clazzList
        })
    }

    // 在数据库中添加学生
    async create(){
        const body = this.ctx.request.body;
        const student = {
            name:body.name,
            clazz_id:body.clazz_id
        }
        await this.app.model.Students.create(student);
        this.ctx.redirect("/students")
    }

    // 通过id删除学生信息
    async destroy(){
        const id = this.ctx.request.body.student_id;
        const student = await this.app.model.Students.findOne({
            where:{
                id:id
            }
        });
        student.destroy();
        this.ctx.redirect("/students")
    }
}

module.exports = StudentsController;

```

### 设置session

``` js
if(user.username="admin" && user.password == "123456"){
   this.ctx.session.user = user;  //设置session
   this.ctx.redirect("/")
}else{
   this.ctx.body = "用户名或密码错误！"
}
```

### 清除session

``` js
delete this.ctx.session.user  //删除session中的用户，取消用户登录状态
```

### 中间件

``` js
// app/middleware/checklogin.js
module.exports = () => {
    return async function (ctx, next) {
        if (ctx.session.user) { //如果session.user有用户信息，继续访问，如果没有，跳转至登录页
            await next();
        } else {
            await ctx.redirect("/login")
        }
    }
}
```

### 使用中间件拦截路由

``` js
// app/router.js
module.exports = app => {
  const { router, controller } = app;
  //需要登录的页面，路由添加中间件拦截，如果未登录，中间件会跳转至登录页。
  router.get('/', app.middleware.checklogin() ,controller.home.index);
  router.get('/login', controller.user.index);
  router.post('/login', controller.user.login);
  router.post('/logout', app.middleware.checklogin(), controller.user.logout);
};

```



