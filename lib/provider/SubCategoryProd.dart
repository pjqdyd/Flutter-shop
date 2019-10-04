import 'package:flutter/material.dart';

import '../model/CategoryDataModel.dart';

//子分类的状态管理对象(提供者部件)
class SubCategoryProd with ChangeNotifier {
  
  //公用数据
  List<SubCategoryData> subCategoryList = []; //子分类的数据
  int subCategoryIndex = 0;                   //当前激活子的分类的下标
  String categoryId = "0001";                 //当前左边分类的id
  String subCategoryId = "01";                //当前右边子分类的id
  int page = 1;                               //当前商品列表的页数

  //设置数据的方法
  // void setSubCategoryList(List<SubCategoryData> list){
  //   subCategoryList = list;
  //   notifyListeners();
  // }

  //设置子分类列表数据的方法,增加一个子分类对象('全部')
  void setSubCategoryList(List<SubCategoryData> list, String cateId){
    categoryId = cateId;     //设置点击的左边分类的id
    subCategoryIndex = 0;    //切换了左边分类,改变子分类,将激活的子分类归为0,即全部
    page = 1;                //商品列表的页数归为1

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
  void setSubCategoryIndex(int index, String subId){
    subCategoryIndex = index;
    subCategoryId = subId;
    page = 1;
    notifyListeners();
  }

  //设置商品页数的方法
  void setPage(){
    page++;
  }
}