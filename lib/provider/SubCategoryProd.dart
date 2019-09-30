import 'package:flutter/material.dart';

import '../model/CategoryDataModel.dart';

//子分类的状态管理对象(提供者部件)
class SubCategoryProd with ChangeNotifier {
  
  //子分类的数据
  List<SubCategoryData> subCategoryList = [];

  //设置数据的方法
  void setSubCategoryList(List<SubCategoryData> list){
    subCategoryList = list;
    notifyListeners();
  }

}