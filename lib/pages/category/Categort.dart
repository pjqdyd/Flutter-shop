import 'package:flutter/material.dart';

//分类页面
class CategoryPage extends StatelessWidget {

  final arguments;

  CategoryPage({this.arguments}); //构造方法,接收参数对象

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("分类"),
      ),
    );
  }
}