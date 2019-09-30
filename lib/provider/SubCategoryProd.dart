import 'package:flutter/material.dart';

import '../model/CategoryDataModel.dart';

//子分类的状态管理对象(提供者部件)
class SubCategoryProd with ChangeNotifier {
  
  //子分类的数据
  List<SubCategoryData> subCategoryList = [];

  //设置数据的方法
  // void setSubCategoryList(List<SubCategoryData> list){
  //   subCategoryList = list;
  //   notifyListeners();
  // }

  //设置数据的方法,增加一个子分类对象('全部')
  void setSubCategoryList(List<SubCategoryData> list){

    SubCategoryData scAll = SubCategoryData();//增加一个子分类对象('全部')
    scAll.mallSubId = '00';
    scAll.mallCategoryId = '00';
    scAll.comments = null;
    scAll.mallSubName = "全部";
    subCategoryList = [scAll];

    subCategoryList.addAll(list);
    notifyListeners();
  }

}