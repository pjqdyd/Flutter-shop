import 'package:flutter/material.dart';

//商品详情页
class DetailsPage extends StatelessWidget {

  final Map arguments;
  DetailsPage({this.arguments}); //构造方法接收参数

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(arguments['productId']),
    );
  }
}