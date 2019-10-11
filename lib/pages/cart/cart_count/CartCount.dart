import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../../provider/CartProd.dart';
import '../../../model/CartDataModel.dart';


//购物车商品数量组件
class CartCount extends StatelessWidget {
  CartDataModel cartDataModel;
  CartCount(this.cartDataModel);

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
          _reduceBtn(context),
          _countNumArea(context),
          _addBtn(context),
        ],
      ),
    );
  }

  //减少按钮
  Widget _reduceBtn(BuildContext context){
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setWidth(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: cartDataModel.count > 1 ? Colors.white : Colors.black12,
          border: Border(right: BorderSide(width: 1, color: Colors.black12,),),
        ),
        child: cartDataModel.count > 1 ? Text("-") : Text(" "),
      ),
      onTap: (){
        Provide.value<CartProd>(context).addOrReduceProductCount(cartDataModel, 'reduce');
      },
    );
  }

  //加号按钮
  Widget _addBtn(BuildContext context){
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
      onTap: (){
        Provide.value<CartProd>(context).addOrReduceProductCount(cartDataModel, 'add');
      },
    );
  }

  //中间数字显示组件
  Widget _countNumArea(BuildContext context){
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text("${cartDataModel.count}"),
    );
  }


} 