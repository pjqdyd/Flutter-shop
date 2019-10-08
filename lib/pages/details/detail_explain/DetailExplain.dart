import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//商品详情页商品解释组件
class DetailExplain extends StatelessWidget {
  const DetailExplain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 15),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(60),
      alignment: Alignment.centerLeft,
      child: _productTips(),
    );
  }

  //返回商品提示组件
  Widget _productTips(){
    return Text(
        "说明: > 精品保证 > 及时送达",
        style: TextStyle(
          color: Color(0xFF8C7BFD),
          fontSize: ScreenUtil().setSp(30),
        ),
    );
  }
}