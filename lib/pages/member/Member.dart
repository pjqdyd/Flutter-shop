import 'package:flutter/material.dart';

import './member_header/MemberHeader.dart'; //会员页头部组件
import './member_order_title/MemberOrderTitle.dart'; //会员页我的订单标题组件


class MemberPage extends StatelessWidget {

  final arguments;

  MemberPage({this.arguments}); //构造方法接收参数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: ListView(
        children: <Widget>[
          MemberHeader(),
          MemberOrderTitle(),
        ],
      ),
    );
  }
}