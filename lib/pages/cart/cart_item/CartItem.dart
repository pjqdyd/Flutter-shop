import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../../model/CartDataModel.dart';
import '../../../provider/CartProd.dart';

import '../cart_count/CartCount.dart';  //商品计数组件

//购物车商品列表单个item组件
class CartItem extends StatelessWidget {

  //定义接收购物车商品数据
  final CartDataModel cartDataModel;

  CartItem({this.cartDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBt(cartDataModel, context),
          _productImage(cartDataModel),
          _productName(cartDataModel),
          _productPrice(cartDataModel, context),
        ],
      ),
    );
  }

  //选框按钮
  Widget _cartCheckBt(CartDataModel cartItem, BuildContext context){
    return Container(
      child: Checkbox(
        value: cartItem.isCheck,
        activeColor: Color(0xFF8C7BFD),
        onChanged: (bool val){

        },
      ),
    );
  }

  //商品图片
  Widget _productImage(CartDataModel cartItem){
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Image.network(cartItem.image, fit: BoxFit.cover,),
    );
  }

  //商品名称, 数量
  Widget _productName(CartDataModel cartItem){
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(cartItem.productName),
          CartCount(),
        ],
      ),
    );
  }

  //商品价格
  Widget _productPrice(CartDataModel cartItem, BuildContext context){
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(150),
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('¥${cartItem.price}'),
          Container(
            child: InkWell(
              child: Icon( //删除按钮
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
              onTap: (){
                //删除单个商品
                Provide.value<CartProd>(context).deleteOneCartProduct(cartItem.productId);
              },
            ),
          ),
        ],
      ),
    );
  }



  
}