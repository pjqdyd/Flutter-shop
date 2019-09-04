import 'package:flutter/material.dart';

//首页广告Banner图片
class HomeAdBanner extends StatelessWidget {

  final String adImageUrl; //广告图片的地址

  HomeAdBanner({Key key, this.adImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.adImageUrl),
    );
  }
}