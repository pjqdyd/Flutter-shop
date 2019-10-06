import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import '../../provider/ProductDetailProd.dart';

//商品详情页
class DetailsPage extends StatelessWidget {

  final Map arguments;
  DetailsPage({this.arguments}); //构造方法接收参数

  @override
  Widget build(BuildContext context) {
    _getTest(context);
    return Container(
      child: Text(arguments['productId']),
    );
  }

  void _getTest(BuildContext context) async{
    await Provide.value<ProductDetailProd>(context).getProductDetailInfo(arguments['productId']);
    print("ok");
  }
}