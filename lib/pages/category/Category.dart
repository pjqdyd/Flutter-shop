import 'package:flutter/material.dart';
import '../../service/serviceMethod.dart' as HttpMethod; //Http请求方法
import '../../model/CategoryDataModel.dart'; //分类页的数据模型

//分类页面
class CategoryPage extends StatefulWidget {

  Map arguments; //定义接收的路由跳转参数map集合
  CategoryPage({this.arguments});
  _CategoryPageState createState() => _CategoryPageState(arguments: this.arguments);
}

class _CategoryPageState extends State<CategoryPage> {

  Map arguments; //路由跳转参数map集合
  _CategoryPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    _getCategoryData();
    return Container(
       child: Text('分类'),
    );
  }

  //加载分类页的数据
  void _getCategoryData(){
    HttpMethod.getCategoryPageContent().then((resData){

      List<dynamic> categoryList = resData['data'];   //分类页的分类数据集合
      List<CategoryDataModle> categoryModleList = []; //定义分类数据模型对象集合

      //遍历分类数据, 将每个分类item的json数据还原成CategoryDataModle分类数据模型对象
      categoryList.forEach((item){
        categoryModleList.add(new CategoryDataModle.fromJson(item));
      });

      print(categoryModleList[0].mallCategoryName);
    });
  }

}