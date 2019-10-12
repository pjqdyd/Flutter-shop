# _![app](https://upload-images.jianshu.io/upload_images/14511997-ac28a04d6978e0f2.png)_  Cool店 使用Flutter 开发的移动端电商APP应用.

### 简介:
>此项目是根据 [Flutter实战-移动电商](https://www.jspang.com/posts/2019/03/01/flutter-shop.html) 学习完成, app主题色ui更改了, 数据则使用了Mock数据;

### 开发环境:
  > Flutter v1.7.8+hotfix.<br>
  >参考: [Fluter中文文档](https://flutterchina.club/get-started/install/).

### 项目结构:
```
lib
 ├─config               配置文件目录, 配置serviceUrl
 ├─model                各个页面的数据模型实体类对象
 ├─pages                页面组件的存放目录
 ├─provider             provider状态管理
 ├─routes               路由配置文件目录
 ├─service              全局http请求方法目录
 └─main.dart            main.dart入口主类

```

### 项目使用的插件:

 |:-------------------- |:--------------------:|:-------------------:|
 |        编译     |      √通过            |    √通过                                           
 |        运行     |      √通过            |    √通过                                      
 |    流畅性能     |      较流畅           |     一般                               
 |    登录功能     |  可用微信/QQ弹窗授权   |                          
 |    定位功能     |      支持             |    支持                                          
 |   功能完善性    |     较完善             |    不完善                 




### 页面展示:

<div align="center">
   <img src="./screenshot/home.jpg" height="330" width="170" >

   <img src="./screenshot/category.jpg" height="330" width="170" >

   <img src="./screenshot/cart.jpg" height="330" width="170" >

   <img src="./screenshot/member.jpg" height="330" width="170" >

   <img src="./screenshot/detail.jpg" height="330" width="170" >
 </div>


### 如何运行:
   1. 连接好设备后(安卓模拟器), 在项目目录下运行`flutter run`即可.
   
   (目前项目初始化..)
