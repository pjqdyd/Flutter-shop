import 'package:flutter/material.dart';

//首页商品楼层标题组件
class HomeFloorTitle extends StatelessWidget {

  final String ftImageUrl; //楼层标题组件图片地址

  HomeFloorTitle({Key key, this.ftImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Image.network(ftImageUrl),
    );
  }
}