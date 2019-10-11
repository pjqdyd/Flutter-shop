import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//会员中心页头部组件
class MemberHeader extends StatelessWidget {
  const MemberHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(400),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg/bg.jpg"),
            fit: BoxFit.cover,
          ),
      ),
      child: Column(
        children: <Widget>[
          Container( //用户头像
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(150),
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network("https://upload-images.jianshu.io/upload_images/14511997-f98df143a7bb5a83.png"),
            ),
          ),
          Container( //用户昵称
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "pjqdyd",
              style: TextStyle(
                color: Color(0xFF8C7BFD),
                fontSize: ScreenUtil().setSp(36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}