import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/cart/test/Test.dart';

class CartPage extends StatelessWidget {

  final arguments;

  CartPage({this.arguments}); //构造器,接收参数对象

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        //child: Text("购物车"),
        child: Test(),
      ),
    );
  }
}