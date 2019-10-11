import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provide/provide.dart'; //引入使用状态管理
import '../../../provider/CartProd.dart';

//购物车底部栏组件
class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Provide<CartProd>( //使用状态管理的数据
        builder: (context, child, cartProd){
          return  Row(
            children: <Widget>[
              _selectAllBtn(context),
              _allPriceArea(context),
              _goButton(context),
            ],
          );
        },
      ),
    );
  }

  //全选按钮
  Widget _selectAllBtn(BuildContext context){
    //获取是否全选
    bool isAllCheck = Provide.value<CartProd>(context).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Color(0xFF8C7BFD),
            onChanged: (bool val){
              //全选商品
              Provide.value<CartProd>(context).setAllCheckState(val);
            },
          ),
          Text("全选"),
        ],
      ),
    );
  }

  //总价盒子
  Widget _allPriceArea(BuildContext context){
    double allPrice = Provide.value<CartProd>(context).allPrice;
    return Container(
      width: ScreenUtil().setWidth(400),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(240),
                alignment: Alignment.centerRight,
                child: Text(
                  "合计:",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(160),
                alignment: Alignment.centerLeft,
                child: Text(
                  "¥${allPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.red
                  ),
                ),
              ),
            ],
          ),

          Container(
            width: ScreenUtil().setWidth(390),
            alignment: Alignment.centerRight,
            child: Text(
              '满50免减100,特价优惠',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //结算按钮
  Widget _goButton(BuildContext context){
    int allProductCount = Provide.value<CartProd>(context).allProductCount;
    return Container(
      width: ScreenUtil().setWidth(180),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration:BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            '结算(${allProductCount})',
            style: TextStyle( color: Colors.white, ),
          ),
        ),
        onTap: (){},
      ),
    );
  }
}