import 'package:flutter/material.dart';

//会员页订单标题组件
class MemberOrderTitle extends StatelessWidget {
  const MemberOrderTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black26,),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text("我的订单"),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}