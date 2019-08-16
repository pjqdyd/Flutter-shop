import 'package:flutter/material.dart';

//首页页面
class HomePage extends StatelessWidget {

  final arguments;

  HomePage({this.arguments}); //构造方法接收参数对象

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("首页"),
      ),
    );
  }
}