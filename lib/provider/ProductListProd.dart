import 'package:flutter/material.dart';
import '../model/ProductDataModel.dart';

//分类页商品列表的状态管理对象
class ProductListProd with ChangeNotifier{

  //商品的数据
  List<ProductDataModel> productList = [];

  //修改数据的方法
  void setProductList(List<ProductDataModel> list){
    this.productList = list;
    notifyListeners();
  }

  //添加数据的方法
  void setAddProductList(List<ProductDataModel> list){
    this.productList.addAll(list);
    notifyListeners();
  }

}