import 'package:flutter/material.dart';

import '../../../service/serviceMethod.dart' as HttpMethod;

//分类页的商品列表组件
class CategoryProducts extends StatefulWidget {
  CategoryProducts({Key key}) : super(key: key);

  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  
  @override
  void initState() { 
    super.initState();
    _getProductList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }

  //定义获取商品数据的方法
  void _getProductList() async{

    var param = {
      'categoryId': '001',
      'categorySubId': '001',
      'page': '1'
    };

    await HttpMethod.getCategoryPageProducts(params: param).then((resData){
      print(resData.data);
    });

  }
}