import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/CartDataModel.dart';

/**
 * 购物车页的状态管理
 */
class CartProd with ChangeNotifier{

  String cartDataListStr = "[]";         //字符串的购物车集合(方便存储的)
  List<CartDataModel> cartDataList = []; //List购物车集合(方便ui展示的)

  /**
   * 持久保存购物车数据的方法(真实情况要查询一次后端数据库)
   */
  void saveCartData(productId, productName, count, price, image) async {
    //初始一个持久化对象
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取本地购物车字符串集合数据
    cartDataListStr = prefs.getString('cartInfo');
    //字符串集合转换为List集合对象
    var temp = cartDataListStr == null ? []: json.decode(cartDataListStr.toString());
    List<Map> tempList = (temp as List).cast();

    bool isExist = false; //是否重复
    int index = 0;        //索引
    //遍历购物车集合, 检测是否有重复
    tempList.forEach((item){
      if(item['productId'] == productId){
        tempList[index]['count'] = item['count'] + 1; //重复的商品数量加1
        cartDataList[index].count++;                  //重复的商品数量加1
        isExist = true;
      }
      index++;
    });

    //如果没有重复的, 往集合中新添加一个商品
    if(!isExist){
      Map<String, dynamic> newProduct = {
        'productId': productId,
        'productName': productName,
        'count': count,
        'price': price,
        'image': image 
      };
      tempList.add(newProduct);
      cartDataList.add(CartDataModel.fromJson(newProduct));
    }

    //再转回json字符串集合存入本地
    cartDataListStr = json.encode(tempList).toString();
    print(cartDataListStr);
    prefs.setString('cartInfo', cartDataListStr);

    notifyListeners();
  }

  /**
   * 清空购物车的方法
   */
  void removeCartData() async {
    //获取持久化对象
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    cartDataList = [];
    print("清空完成---------------------");
    notifyListeners();
  }

  /** 
   * 获取本地持久化的数据, 添加到cartDataList中
  */
  void getCartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartDataListStr = prefs.getString('cartInfo');
    cartDataList = [];
    if(cartDataListStr != null){
      List<Map> tempList = (json.decode(cartDataListStr.toString()) as List).cast();
      tempList.forEach((item){
        cartDataList.add(CartDataModel.fromJson(item));
      });
    }
    notifyListeners();
  }


}