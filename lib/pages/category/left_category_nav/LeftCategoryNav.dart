import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../service/serviceMethod.dart' as HttpMethod;

import '../../../model/CategoryDataModel.dart'; //分类数据模型
import '../../../model/ProductDataModel.dart';  //商品数据模型

import 'package:provide/provide.dart';      //引入使用状态管理
import '../../../provider/SubCategoryProd.dart';
import '../../../provider/ProductListProd.dart';


// 左侧分类导航组件
class LeftCategoryNav extends StatefulWidget {
  List<CategoryDataModle> categoryModleList; //定义接收分类数据对象集合
  LeftCategoryNav({this.categoryModleList});
  _LeftCategoryNavState createState() => _LeftCategoryNavState(this.categoryModleList);
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
   var currentIndex = 0;
   List<CategoryDataModle> categoryModleList;
  _LeftCategoryNavState(this.categoryModleList);

  @override
  void initState() { 
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       width: ScreenUtil().setWidth(180),
       decoration: BoxDecoration(
         border: Border(right: BorderSide(width: 1, color: Colors.black12),),
       ),
       child: ListView.builder( //分类列表
         itemCount: categoryModleList.length,
         itemBuilder: (context, index){
           return _itemBox(index, context);
         },
       ),
    );
  }

  //每一项分类盒子
  Widget _itemBox(int index, BuildContext context){
    bool isActive = false;
    isActive = (index == currentIndex) ? true: false;
    return InkWell(
      onTap: (){
        setState(() {
         currentIndex = index; 
        });
        var subCategoryList = categoryModleList[index].subCategoryDataList; //获取当前点击的子分类集合
        var categoryId = categoryModleList[index].mallCategoryId;           //获取当前点击分类的id
        //赋值给状态管理
        Provide.value<SubCategoryProd>(context).setSubCategoryList(subCategoryList);
        //获取对应商品的列表数据
        _getProductList(categoryId: categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: isActive ? Color.fromRGBO(104, 87, 229, 0.1) : Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12),),
        ),
        child: Text(this.categoryModleList[index].mallCategoryName), //分类名称
      ),
    );
  }

  //定义获取商品数据, 并保存数据到状态管理的方法
  void _getProductList({String categoryId = "0001"}) async{
    var param = {
      'categoryId': categoryId,
      'categorySubId': '001',
      'page': 1
    };
    await HttpMethod.getCategoryPageProducts(params: param).then((resData){
       List<dynamic> productList = resData['data']; //获取商品列表集合
       List<ProductDataModel> list = [];
      //将json数据商品还原成商品Model对象, 并存入list集合中
      productList.forEach((item){
        list.add(new ProductDataModel.fromJson(item));
      });
      Provide.value<ProductListProd>(context).setProductList(list); //存数据到状态管理的
    });

  }

}