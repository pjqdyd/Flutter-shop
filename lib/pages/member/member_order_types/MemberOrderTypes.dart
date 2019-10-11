import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//会员页订单类型组件
class MemberOrderTypes extends StatelessWidget {
  const MemberOrderTypes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Row(
        children: <Widget>[

          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.query_builder,
                    size: 28,
                  ),
                  Text("待付款")
                ],
              ),
            ),
            onTap: (){},
          ),

          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.party_mode,
                    size: 28,
                  ),
                  Text("待发货")
                ],
              ),
            ),
            onTap: (){},
          ),

          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.directions_car,
                    size: 28,
                  ),
                  Text("待收货")
                ],
              ),
            ),
            onTap: (){},
          ),

          InkWell(
            child:  Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.content_paste,
                    size: 28,
                  ),
                  Text("待评价")
                ],
              ),
            ),
            onTap: (){},
          ),

        ],
      ),
    );
  }
}