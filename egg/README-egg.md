### vue-resource  和 服务器创建连接  (重点)
```
通用接口代码: 'http://jsonplaceholder.typicode.com/users'
```

## 如何创建egg脚手架
```
第一步 npm i egg-init -g 下载一个全局依赖
第二步 egg-init dome01 --type=simple 创建egg文件名字叫dome01
第三步 cd dome01 进入创建的dome01里面
第四步 npm i  下载以来 运行项目
```

``` js ```
<ul>
    {% for item in list %}
    <li>
      <a href="{{item.url}}">{{item.title}}</a>
    </li>
    {% endfor %}
  </ul>
