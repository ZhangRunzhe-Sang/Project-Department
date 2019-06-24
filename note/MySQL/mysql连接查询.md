###sql 的四种连接

####内连接
inner  join 或者 join


####外连接
> 1. 左连接 left join 或者 left outer join 

> 2. 右连接 right join 或者 right outer join

> 3. 完全外连接 full join 或者 full outer join

1. inner join 查询 (内连接)
> select * from XX inner join XX on XX.XX=XX.XX;
```
内联查询，其实就是两张表中的数据，通过某个字段相对，查询出相关记录数据
```
> select * from XX join XX on XX.XX=XX.XX;

2. left join (左外连接)
> select * from XX left join XX on XX.XX=XX.XX;
```
左外连接，会把左边里面的所有数据取出来，而右边表中的数据，如果有相等的，就显示出来  如果没有，就会补 Null
```
> select * from XX left outer join XX on XX.XX=XX.XX;

3. right join (右外连接)
> select * from XX right join XX on XX.XX=XX.XX;
```
右外连接，会把右边里面的所有数据取出来，而左边表中的数据，如果有相等的，就显示出来  如果没有，就会补 Null
```
> select * from XX right outer join XX on XX.XX=XX.XX;

4. full join (全外连接)
mysql 不支持 full join

select * from XX left join XX on XX.XX=XX.XX
union
select * from XX right join XX on XX.XX=XX.XX;