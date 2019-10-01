import 'package:flutter/material.dart';

import '../../../service/serviceMethod.dart' as HttpMethod;

import '../../../model/ProductDataModel.dart';  //商品数据模型

//分类页的商品列表组件
class CategoryProducts extends StatefulWidget {
  CategoryProducts({Key key}) : super(key: key);

  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {

  List<ProductDataModel> productModelList = []; //定义商品模型对象集合

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
      'page': 1
    };

    await HttpMethod.getCategoryPageProducts(params: param).then((resData){
       List<dynamic> productList = resData['data']; //获取商品列表集合

      //将json数据商品还原成商品Model对象, 并存入productModelList集合中
      productList.forEach((item){
        setState(() {
         this.productModelList.add(new ProductDataModel.fromJson(item));
        });
      });

      print(this.productModelList[0].goodsName);
      print(this.productModelList[0].presentPrice);

    });

  }
}