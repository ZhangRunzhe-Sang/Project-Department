### vue-resource  和 服务器创建连接  (重点)
```
通用接口代码: 'http://jsonplaceholder.typicode.com/users'
```

## 如何创建egg脚手架
```
$ npm i egg-init -g

> 创建文件夹 'egg-name' 定义文件夹的名称
$ egg-init egg-name --type=simple

> 进入文件夹
$ cd egg-name
```

## 配置模板引擎

```
1. npm i egg-view-ejs --save
```

### 开启插件

```
2. 找到 (app_rout)/config/pulgin.js

exports.ejs = {
  enble : ture,
  package : 'egg-view-nunjucks',
};
```

```
3. 找到 (app_rout)/config/config.default.js

//添加 view 配置
config.view = {
  defaultiViewEngine: 'nunjucks',
  mapping:{
    '.tpl' : 'nunjucks',
  }
}
```


``` js ```
<ul>
    {% for item in list %}
    <li>
      <a href="{{item.url}}">{{item.title}}</a>
    </li>
    {% endfor %}
  </ul>
