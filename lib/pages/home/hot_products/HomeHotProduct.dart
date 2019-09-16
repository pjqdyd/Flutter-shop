import 'package:flutter/material.dart';
import "../../../service/serviceMethod.dart"; //http请求方法

//首页热门商品组件
class HomeHotProduct extends StatefulWidget {
  HomeHotProduct({Key key}) : super(key: key);
  _HomeHotProductState createState() => _HomeHotProductState();
}

class _HomeHotProductState extends State<HomeHotProduct> {

  @override
  void initState() { 
    super.initState();
    getHomeHotProduct(params: {'page': 1, 'size': 5}).then((val){ //调用方法请求数据
      print(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }
}