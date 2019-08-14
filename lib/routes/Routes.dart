import 'package:flutter/material.dart';
import '../pages/Index.dart';

 //定义常量命名路由
  final routers = {
    //'/search': (context, {arguments}) => SearchPage(arguments: arguments),
    '/': (context) => IndexPage(), //主页
  };

  //监听路由实现命名路由可传参数的方法 (固定写法,直接复制即可)
  var onGenerateRoute = (RouteSettings settings){
      //统一处理
      final String name = settings.name;
      final Function pageContentBuilder = routers[name]; //获取返回路由的构建方法
      if(pageContentBuilder != null){
        if(settings.arguments != null){ //参数不为空
          final Route route = MaterialPageRoute(builder: (context) =>
          pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
          final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
            return route;
        }
      }
};
