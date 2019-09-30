import 'package:flutter/material.dart';
import 'routes/Routes.dart';
import 'package:provide/provide.dart';    //provide状态管理
import './provider/SubCategoryProd.dart'; //引入子分类数据状态提供部件

void main(){
  var providers = Providers();

  providers
  ..provide(Provider<SubCategoryProd>.value(SubCategoryProd()));
  runApp(ProviderNode(child: MyApp(), providers: providers,));
}

//MyApp组件
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug显示
      theme: ThemeData(                  //主题色
          primaryColor: Color.fromRGBO(104, 87, 229, 1)
      ),
      //home: IndexPage(),
      initialRoute: "/", //初始化时加载的路由(IndexPage()页面)
      onGenerateRoute: onGenerateRoute //调用Routes.dart中的可传参数方法
    );
  }
}