import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/CategoryDataModel.dart';

import 'package:provide/provide.dart';      //引入使用状态管理
import '../../../provider/SubCategoryProd.dart';


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
        //获取当前点击的子分类集合
        var subCategoryList = categoryModleList[index].subCategoryDataList;
        //赋值给状态管理
        Provide.value<SubCategoryProd>(context).setSubCategoryList(subCategoryList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: isActive ? Colors.black12 : Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12),),
        ),
        child: Text(this.categoryModleList[index].mallCategoryName), //分类名称
      ),
    );
  }

}