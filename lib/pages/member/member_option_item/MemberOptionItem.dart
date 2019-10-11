import 'package:flutter/material.dart';

//会员页通用选项栏
class MemberOptionItem extends StatelessWidget {
  const MemberOptionItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          _optionItem("领取优惠劵", Icon(Icons.shopping_basket)),
          _optionItem("地址管理", Icon(Icons.location_city)),
          _optionItem("客服电话", Icon(Icons.phone)),
          _optionItem("关于我们", Icon(Icons.info)),
        ],
      ),
    );
  }

  //返回通用选项的方法
  Widget _optionItem(String title, Icon icon){
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12,)
          ),
        ),
        child: ListTile(
          leading: icon,
          title: Text("${title}"),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
      onTap: (){},
    );
  }
}