import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {

  final arguments;

  MemberPage({this.arguments}); //构造方法接收参数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("会员"),
      ),
    );
  }
}