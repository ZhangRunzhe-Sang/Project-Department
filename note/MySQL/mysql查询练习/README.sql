-- 学生表
-- student
-- ```信息```
-- 学号
-- 姓名
-- 性别
-- 出生年月日
-- 所在班级

create table student(
    sno varchar(20) primary key,
    sname varchar(20) not null,
    ssex varchar(10) not null,
    sbirthday datetime,
    class varchar(20)
);

-- 教师表
-- teacher
-- ```信息```
-- 教师编号
-- 教师名字
-- 教师性别
-- 出生年月日
-- 职称
-- 所在部门

create table teacher(
    tno varchar(20) primary key,
    tname varchar(20) not null,
    tssex varchar(10) not null,
    tbirthday datetime,
    prof varchar(20) not null,
    depart varchar(20) not null
);

-- 课程表
-- course
-- ```信息```
-- 课程号
-- 课程名称
-- 教师编号

create table course(
    cno varchar(20) primary key,
    cname varchar(20) not null,
    tno varchar(20) not null,
    foreign key(tno) references teacher(tno)
);

-- 成绩表
-- score
-- ```信息```
-- 学号
-- 课程号
-- 成绩

create table score(
    sno varchar(20),
    cno varchar(20) not null,
    degree decimal,
    foreign key(sno) references student(sno),
    foreign key(cno) references course(cno),
    primary key(sno, cno)
);


--往数据表中添加数据
---添加学生信息
insert into student values('101','曾华','男','1977-09-01','95033');
insert into student values('102','匡明','男','1975-10-02','95031');
insert into student values('103','王丽','女','1976-01-23','95033');
insert into student values('104','李军','男','1076-02-20','95033');
insert into student values('105','王芳','女','1975-02-10','95031');
insert into student values('106','陆君','男','1974-06-03','95031');

---添加教师表
insert into teacher values('804','李成','男','1958-12-02','副教授','计算机系');
insert into teacher values('856','张旭','男','1969-03-12','讲师','电子工程系');
insert into teacher values('825','王萍','女','1972-05-05','助教','计算机系');
insert into teacher values('831','刘冰','女','1977-08-14','助教','电子工程系');


---添加课程表
insert into course values('3-105','计算机导论','825');
insert into course values('3-245','操作系统','804');
insert into course values('6-166','数字电路','856');
insert into course values('9-888','高等数学','831');

---添加成绩表
insert into score values('103','3-105','92');
insert into score values('103','3-245','86');
insert into score values('103','6-166','85');
insert into score values('105','3-105','88');
insert into score values('105','3-245','75');
insert into score values('105','6-166','79');


--查询练习：

---1. 查询student表的所有记录
    select * from student;

---2. 查询student表中的所有记录的 sname、ssex 和 class 列
    select sname, ssex, class from student;

---3. 查询教师所有的单位即不重复的depart列
-- distinct 排除重复
    select distinct depart from teacher;

---4. 查询score表中成绩在60到80之间的所有记录
-- 查询区间 between ... and ...
    select * from score where degree between 60 and 80;

-- 运算符比较 
    select * from score where degree > 60 and degree < 80;

---5. 查询score表中成绩为85、86或88的记录
-- 表示或者关系的查询 in
    select * from score where degree in(85, 86, 88);

---6. 查询student表中 '95031' 班或性别为 '女' 的同学记录
-- 两个不同的字段 or 表示或者
    select * from student where class='95031' or ssex='女';

---7. 以class降序查询student表的所有记录
-- 升序（asc） 降序（desc）
    select * from student order by class desc;

-- asc 升序
    select * from student order by class;

---8. 以cno升序、degree降序查询score表的所有记录
    select * from score order by cno asc,degree desc;

---9. 查询 '95031' 班的学生人数
-- 统计 count
    select count(*) from student where class='95031';

---10. 查询score表中的最高分的学生学号和课程号 (子查询或排序)
    select sno,cno from score where  degree=(select max(degree) from score);
--1. 找到最高分
    select max(degree) from score;
--2. 找到最高分的 sno 和 cno
    select sno,cno from score where degree;


--排序的做法
    select sno,cno,degree from * score order by degree desc limit 0,1;
--limit 第一个数字表示从多少开始  ， 第二个数字表示查多少条

---11. 查询每门课的平均成绩
--avg()
--group by 分组
    select cno,avg(degree) from score group by cno;

---12. 查询score表中至少有2名学生选修的并以3开头的课程的平均分数

    select cno,avg(degree),count(*) from score group by cno 
    having count(cno)>=2 and cno like '3%';

---13. 查询分数大于70，小于90的sno列
    select sno,degree from score where degree between 70 and 90;

---14. 查询所有学生的 sname、cno 和 degree 列  (多表查询)
    select sname,cno,degree from student,score
    where student.sno=score.sno;

---15. 查询所有学生的sno、cname和degree列
    select sno,cname,degree from course,score
    where course.cno = score.cno;

---16. 查询所有学生的sname、cname和degree列
-- sname -> student
-- cname -> course
-- degree -> score

    select sname,cname,degree from student,course,score
    where student.sno=score.sno
    and course.cno=score.cno;

---17. 查询‘95031’班学生每门课的平均分
    select cno,avg(degree)
    from score
    where sno in (select sno from student where class='95031')
    group by cno;

---18. 查询选修‘3-105’课程的成绩高于‘109’号同学‘3-105’成绩的所有同学的记录
    select * from score where  cno='3-105' and degree>(select degree from score where sno='109' and cno='3-105');

---19. 查询成绩高于学号'109'、课程号为'3-105'的成绩的所有记录
    select * from score where degree>(select degree from score where sno='109' and cno='3-105');

---20. 查询和学号为106、101的同学同年出生的所有学生的sno、sname和sbirthday列
    select * from student where sno in (101,106); --先查询这两个人
    select year(sbirthday) from student where sno in (101,106); --查询这两个人的年份
    select * from student where year(sbirthday) in (select year(sbirthday) from student where sno in (101,106));
    --以这两个人的年份为条件查询这两个人的sno、sname

---21. 查询'张旭'教师任课的学生成绩
    select tno from teacher where tname = '张旭';
    select cno from course where tno=(select tno from teacher where tname='张旭');
    select * from score where cno=(select cno from course where tno=(select tno from teacher where tname='张旭'));

---22. 查询选修某课程的同学人数多于5人的教师姓名
    select cno from score group by cno having count(*)>5;
    select tno from course where cno=(select cno from score group by cno having count(*)>5);
    select tname from teacher where tno=(select tno from course where cno=(select cno from score group by cno having count(*)>5));

---23. 查询95033班和95031班全体学生的记录
    select * from student where class in ('95031','95033');

---24. 查询存在有85分以上成绩的课程cno
    select cno,degree from score where degree>85;

---25. 查询出'计算机系'教师所有课程的成绩表
    select * from teacher where depart='计算机系';
    select * from course where tno in (select tno from teacher where depart='计算机系');
    select * from score where cno in ( select cno from course where tno in (select tno from teacher where depart='计算机系'));

---26. 查询'计算机系'与'电子工程系'不同职称的教师的tname和prof
--union 求并集
    select prof from teacher where depart='电子工程系';

    select * from teacher where depart='计算机系' and prof not in(select prof from teacher where depart='电子工程系')
    union  
    select * from teacher where depart='电子工程系' and prof not in(select prof from teacher where depart='计算机系');

---27. 查询选修编号为'3-105'课程且成绩至少高于选修编号为'3-245'的同学的cno、sno和degree，并按degree从高到低次序排序 
    select * from score where cno='3-245';
    select * from score where cno='3-105';

--至少？ 大于其中至少一个  any
    select * from score where cno='3-105'
    and degree > any(select degree from score where cno='3-245')
    order by degree desc;

---28. 查询选修编号为'3-105'且成绩高于选修编号为'3-245'课程的同学的cno、sno、和degree
-- all 表示所有的关系
    select * from score where cno='3-105'
    and degree > all(select degree from score where cno='3-245');

---29. 查询所有教师和同学的name、sex、和birthday
--别名 as
    select tname as name, tssex as sex, tbirthday as birthday from teacher
    union
    select sname, ssex, sbirthday from student;

---30. 查询所有'女'教师和'女'同学的name、sex、和birthday
    select tname as name, tssex as sex, tbirthday as birthday from teacher where tssex='女'
    union
    select sname, ssex, sbirthday from student where ssex='女';

---31. 查询成绩比该课程表平均成绩低的同学的成绩表
    select cno,avg(degree) from score group by cno;  --查看每门课程的平均成绩
    select * from score a where degree < (select avg(degree) from score b where a.cno=b.cno);

---32. 查询所有任课教师的tname和depart
-- 课程表中安排了课程
    select * from course;

    select tname,depart from teacher where tno in (select tno from course);

---33. 查询至少有2名男生的班号
    select * from student;
    select class from student where ssex='男' group by class having count(*)>1;

---34. 查询student表中不姓'王'的同学记录
-- not like  不像
    select * from student where sname not like '王%';

---35. 查询student表中每个学生的姓名和年龄
--年龄=当前年份-出生年份
    select year(now());
    select year(sbirthday) from student; --查询学生的出生年龄
    select sname,year(now())-year(sbirthday) as '年龄' from student;

---36. 查询student表中最大和最小的sbirthday日期值
    select sbirthday from student order by sbirthday;

--max(最大) min(最小)
    select max(sbirthday) as '最大',min(sbirthday) as '最小' from student;

---37. 以班号和年龄从小到大的顺序查询student表中的全部记录
    select *from student order by class desc, sbirthday;

---38. 查询'男'教师及其所上的课程
--先查到男教师
    select * from teacher where tssex='男';

    select * from course where tno in (select tno from teacher where tssex='男');

---39. 查询最高分同学的sno、cno和degree列
    select max(degree) from score;

    select * from score where degree=(select max(degree) from score);

---40. 查询和'李军'同性别的所有同学的sname
    select ssex from student where sname='李军';
    select sname from student where ssex=(select ssex from student where sname='李军');

---41. 查询和'李军'同性别并同班的同学sname
    select sname from student
    where ssex=(select ssex from student where sname='李军')
    and class=(select class from student where sname='李军');
