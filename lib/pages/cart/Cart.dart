import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';

import '../../provider/CartProd.dart';
import '../../model/CartDataModel.dart';

import './cart_item/CartItem.dart';     //购物车单个商品组件
import './cart_bottom/CartBottom.dart'; //购物车底部栏组件



//购物车页面
class CartPage extends StatelessWidget {
  Map arguments;
  CartPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: FutureBuilder( //异步渲染购物车数据
        future: _getCartDataInfo(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<CartDataModel> cartDataList = Provide.value<CartProd>(context).cartDataList;
            return Stack(
              children: <Widget>[

                Provide<CartProd>(
                  builder: (context, child, cartProd){
                    cartDataList = cartProd.cartDataList; //重新获取一下商品列表数据
                    return ListView.builder( //购物车商品列表
                      itemCount: cartDataList.length,
                      itemBuilder: (context, index){
                        return CartItem(cartDataModel: cartDataList[index],);
                      },
                    );
                  },
                ),

                Positioned(  //底部栏
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                ),
              ],
            );
          }else{
            return Text("正在加载");
          }
        },
      ),
    );
  }

  //异步初始购物车数据的方法
  Future<String> _getCartDataInfo(BuildContext context) async {
    await Provide.value<CartProd>(context).getCartData();
    return " ";
  }
}