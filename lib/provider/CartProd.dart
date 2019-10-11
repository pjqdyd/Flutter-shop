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
  double allPrice = 0;                       //选中商品总价格
  int allProductCount = 0;                   //所有选中商品的数量
  bool isAllCheck = true;                    //是否全选中

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
    allPrice = 0;
    allProductCount = 0;
    //遍历购物车集合,
    tempList.forEach((item){
      if(item['productId'] == productId){ //检测是否有重复
        tempList[index]['count'] = item['count'] + 1; //重复的商品数量加1
        cartDataList[index].count++;                  //重复的商品数量加1
        isExist = true;
      }
      if(item['isCheck']){ //是否选中
        allPrice += (cartDataList[index].price * cartDataList[index].count);
        allProductCount += cartDataList[index].count;
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
        'image': image,
        'isCheck': true
      };
      allPrice += (count * price);
      allProductCount += count;
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
   * 删除单个商品的方法
   */
  void deleteOneCartProduct(String productId) async {
    //获取持久化对象
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartDataListStr = prefs.getString('cartInfo'); //获取购物车商品列表字符串集合
    //转换成集合
    List<Map> tempList = (json.decode(cartDataListStr.toString()) as List).cast();
    int tempIndex = 0;
    int deleteIndex = 0;
    tempList.forEach((item){
      if(item['productId'] == productId){
        deleteIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(deleteIndex); //删除这个商品
    cartDataListStr = json.encode(tempList).toString(); //重新保存到本地
    prefs.setString('cartInfo', cartDataListStr);

    await getCartData(); //重新更新下ui的数据
  }

  /**
   * 清空购物车的方法
   */
  void removeCartData() async {
    //获取持久化对象
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    cartDataList = [];
    allPrice = 0;
    allProductCount = 0;
    print("清空完成---------------------");
    notifyListeners();
  }

  /** 
   * 获取本地持久化的数据, 添加到cartDataList中, 并初始总价格和商品数量
  */
  void getCartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartDataListStr = prefs.getString('cartInfo');
    cartDataList = [];
    allPrice = 0;
    allProductCount = 0;
    isAllCheck = true;
    if(cartDataListStr != null){
      List<Map> tempList = (json.decode(cartDataListStr.toString()) as List).cast();
      tempList.forEach((item){
        if(item['isCheck']){ //如果是选中的商品
          allPrice += (item['count']*item['price']); //总价等于数量*价格
          allProductCount += item['count'];          //总商品数量
        }else{
          isAllCheck = false;
        }
        cartDataList.add(CartDataModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  /**
   * 改变选中商品状态的方法
   */
  void setCheckState(CartDataModel cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartDataListStr = prefs.getString('cartInfo');
    //先取出购物车商品列表数据
    List<Map> tempList = (json.decode(cartDataListStr.toString()) as List).cast();
    int tempIndex = 0;
    int checkIndex = 0;
    tempList.forEach((item){
      if(item['productId']  == cartItem.productId){
        checkIndex = tempIndex;  //记录要选中/取消选中的商品下标
      }
      tempIndex++;
    });
    tempList[checkIndex] = cartItem.toJson(); //赋值改变商品的选中状态
    cartDataListStr = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartDataListStr); //再重新持久化

    await getCartData(); //重新获取数据
  }


  /**
   * 点击全选按钮的操作
   */
  void setAllCheckState(bool isAllCheck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartDataListStr = prefs.getString('cartInfo');
    //先取出购物车商品列表数据
    List<Map> tempList = (json.decode(cartDataListStr.toString()) as List).cast();
    List<Map> newList = [];
    tempList.forEach((item){
      var newItem = item;
      newItem['isCheck'] = isAllCheck;
      newList.add(newItem);   //添加修改选中状态的商品到新的集合中
    });
    cartDataListStr = json.encode(newList).toString();
    prefs.setString('cartInfo', cartDataListStr); //重新持久化
    await getCartData(); //重新获取数据

  }

  /**
   * 商品数量的加减
   */
  void addOrReduceProductCount(CartDataModel cartItem, String addOrReduce) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartDataListStr = prefs.getString('cartInfo');
    //先取出购物车商品列表数据
    List<Map> tempList = (json.decode(cartDataListStr.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0; //要改变商品数量的下标
    tempList.forEach((item){
      if(item['productId'] == cartItem.productId){
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    if(addOrReduce == 'add'){
      cartItem.count++;
    }else if(cartItem.count > 1 && addOrReduce == 'reduce'){
      cartItem.count--;
    }else{return;}
    tempList[changeIndex] = cartItem.toJson();
    cartDataListStr = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartDataListStr); //重新持久化
    await getCartData();    //重新获取数据
  }

}