import 'package:flutter/material.dart';
import 'routes/Routes.dart';
import 'package:provide/provide.dart';    //provide状态管理
import './provider/SubCategoryProd.dart'; //引入子分类数据状态提供部件
import './provider/ProductListProd.dart'; //引入商品列表数据状态部件
import './provider/ProductDetailProd.dart'; //引入商品详情数据状态部件
import './provider/CartProd.dart';          //引入购物车数据状态布局

void main(){
  var providers = Providers();

  providers
  ..provide(Provider<SubCategoryProd>.value(SubCategoryProd()))
  ..provide(Provider<ProductListProd>.value(ProductListProd()))
  ..provide(Provider<ProductDetailProd>.value(ProductDetailProd()))
  ..provide(Provider<CartProd>.value(CartProd()));
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