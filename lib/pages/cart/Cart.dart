import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//购物车页面
class CartPage extends StatefulWidget {
  Map arguments;
  CartPage({this.arguments});

  _CartPageState createState() => _CartPageState(arguments: this.arguments);
}

class _CartPageState extends State<CartPage> {
  Map arguments; //路由接收的参数
  _CartPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }

}