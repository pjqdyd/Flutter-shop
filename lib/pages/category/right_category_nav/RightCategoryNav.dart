import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/CategoryDataModel.dart';

import 'package:provide/provide.dart'; //引入状态管理组件
import '../../../provider/SubCategoryProd.dart'; 

//右侧顶部的子分类导航组件
class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {

  @override
  Widget build(BuildContext context) {
    return Provide<SubCategoryProd>(
      builder: (context,child, subCategoryProd){
        var subCateList = subCategoryProd.subCategoryList; //获取状态管理的数据
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width: 1, color: Colors.black12),),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subCateList.length,
            itemBuilder: (context, index){
              return _itemBox(subCateList[index], index);
            },
          ),
        );
      },
    );
  }

  //每个分类盒子, index是当前分类的下标
  Widget _itemBox(SubCategoryData item, int index){
    bool isActive = false;
    int activeIndex = Provide.value<SubCategoryProd>(context).subCategoryIndex;
    isActive = (index  == activeIndex) ? true : false;
    return InkWell(
      onTap: (){
        //点击后更改激活的下标为当前下标
        Provide.value<SubCategoryProd>(context).setSubCategoryIndex(index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28), 
            color: isActive ? Color.fromRGBO(104, 87, 229, 1) : Colors.black),
        ),
      ),
    );
  }

}