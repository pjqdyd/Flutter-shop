import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页热门商品标题
class HomeHotTitle extends StatelessWidget {
  const HomeHotTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/icon/hot.png', 
            width: 28,
            height: 28,),
          Text("  热门商品")
        ],
      ),
    );
  }
}