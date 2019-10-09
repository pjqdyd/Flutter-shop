import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//详情页底部按钮组件
class DetailBottom extends StatelessWidget {
  const DetailBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(104, 87, 229, 0.5), offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 3.0),
        ],
      ),
      child: Row(
        children: <Widget>[

          InkWell( //购物车图标
            child: Container(
              width: ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Color(0xFF8C7BFD),
              ),
            ),
            onTap: (){},
          ),

          InkWell( //加入购物车按钮
            child: Container(
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              color: Color(0xFF8C7BFD),
              child: Text(
                "加入购物车",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28),
                ),
              )
            ),
            onTap: (){},
          ),

           InkWell( //立即购买按钮
            child: Container(
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              color: Colors.orange,
              child: Text(
                "立即购买",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28),
                ),
              )
            ),
            onTap: (){},
          ),


        ],
      ),
    );
  }
}