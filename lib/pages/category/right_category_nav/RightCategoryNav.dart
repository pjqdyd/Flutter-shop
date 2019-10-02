import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/CategoryDataModel.dart';

import '../../../service/serviceMethod.dart' as HttpMethod;
import '../../../model/ProductDataModel.dart';  //商品数据模型

import 'package:provide/provide.dart'; //引入状态管理组件
import '../../../provider/SubCategoryProd.dart'; 
import '../../../provider/ProductListProd.dart';

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
        _getProductList(item.mallSubId); //获取当前子分类的商品数据
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

  //定义获取商品数据, 并保存数据到状态管理的方法
  void _getProductList(String subCategoryId) async{
    var param = {
      'categoryId': Provide.value<SubCategoryProd>(context).categoryId,
      'categorySubId': subCategoryId,
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