import 'package:flutter/material.dart';

import '../model/CategoryDataModel.dart';

//子分类的状态管理对象(提供者部件)
class SubCategoryProd with ChangeNotifier {
  
  //子分类的数据
  List<SubCategoryData> subCategoryList = [];
  //当前激活子的分类的下标
  int subCategoryIndex = 0;

  //设置数据的方法
  // void setSubCategoryList(List<SubCategoryData> list){
  //   subCategoryList = list;
  //   notifyListeners();
  // }

  //设置子分类列表数据的方法,增加一个子分类对象('全部')
  void setSubCategoryList(List<SubCategoryData> list){
    subCategoryIndex = 0;//切换了左边分类,改变子分类,将激活的子分类归为0,即全部

    SubCategoryData scAll = SubCategoryData();//增加一个子分类对象('全部')
    scAll.mallSubId = '00';
    scAll.mallCategoryId = '00';
    scAll.comments = null;
    scAll.mallSubName = "全部";
    subCategoryList = [scAll];

    subCategoryList.addAll(list);
    notifyListeners();
  }

  //设置激活子分类的方法
  void setSubCategoryIndex(int index){
    subCategoryIndex = index;
    notifyListeners();
  }

}