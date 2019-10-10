import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//购物车商品数量组件
class CartCount extends StatelessWidget {
  const CartCount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12,),
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(),
          _countNumArea(),
          _addBtn(),
        ],
      ),
    );
  }

  //减少按钮
  Widget _reduceBtn(){
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setWidth(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(width: 1, color: Colors.black12,),),
        ),
        child: Text("-"),
      ),
      onTap: (){},
    );
  }

  //加号按钮
  Widget _addBtn(){
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setWidth(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 1, color: Colors.black12,),),
        ),
        child: Text("+"),
      ),
      onTap: (){},
    );
  }

  //中间数字显示组件
  Widget _countNumArea(){
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text("1"),
    );
  }


} 