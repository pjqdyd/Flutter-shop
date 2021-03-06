import 'package:flutter/material.dart';

import './member_header/MemberHeader.dart';          //会员页头部组件
import './member_order_title/MemberOrderTitle.dart'; //会员页我的订单标题组件
import './member_order_types/MemberOrderTypes.dart'; //会员页订单类型栏组件
import './member_option_item/MemberOptionItem.dart'; //会员页底部选项列



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
          MemberOrderTypes(),
          MemberOptionItem(),
        ],
      ),
    );
  }
}