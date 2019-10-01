import 'package:flutter/material.dart';

import 'package:provide/provide.dart'; //状态管理部件
import '../../provider/SubCategoryProd.dart';

import '../../service/serviceMethod.dart' as HttpMethod; //Http请求方法
import '../../model/CategoryDataModel.dart';            //分类的数据模型

import 'left_category_nav/LeftCategoryNav.dart';   //左边分类导航组件
import 'right_category_nav/RightCategoryNav.dart'; //右侧顶部子分类导航
import 'category_products/CategoryProducts.dart';  //分类页商品列表组件



//分类页面
class CategoryPage extends StatefulWidget {
  Map arguments; //定义接收的路由跳转参数map集合
  CategoryPage({this.arguments});
  _CategoryPageState createState() => _CategoryPageState(arguments: this.arguments);
}

class _CategoryPageState extends State<CategoryPage> {
  Map arguments; //路由跳转参数map集合
  _CategoryPageState({this.arguments});
  List<CategoryDataModle> _categoryModleList = []; //定义分类数据模型对象集合

  @override
  void initState() { 
    super.initState();
    _getCategoryData(); //初始加载分类页数据
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
        appBar: AppBar(title: Text("商品分类"),),
        body: Row(
            children: <Widget>[
              LeftCategoryNav(categoryModleList: this._categoryModleList,),

              Column(
                children: <Widget>[
                  RightCategoryNav(),
                  CategoryProducts(),
                ],
              ),

            ],
          ),
        ),
    );
  }

  //加载分类页的数据
  void _getCategoryData() async{
     await HttpMethod.getCategoryPageContent().then((resData){
      List<dynamic> categoryList = resData['data'];   //分类页的分类数据集合
      //遍历分类数据, 将每个分类item的json数据还原成CategoryDataModle分类数据模型对象, 并添加到集合中
      categoryList.forEach((item){
        setState(() {
          this._categoryModleList.add(new CategoryDataModle.fromJson(item)); 
        });
      });
      //把初始的第一个子分类数据,添加到状态管理中
      Provide.value<SubCategoryProd>(context).setSubCategoryList(this._categoryModleList[0].subCategoryDataList);
    });
  }

}