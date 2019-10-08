import 'package:flutter/foundation.dart';

import '../model/ProductDetailModel.dart';
import '../service/serviceMethod.dart' as HttpMethod;

//商品详情页状态管理
class ProductDetailProd with ChangeNotifier{

  //商品详情数据
  ProductDetailModel productDetailModel = null;

  //从后台获取商品数据
  void getProductDetailInfo(String productId) async {
    await HttpMethod.getProductDetailInfo(params: {'productId': productId}).then((resData){
      //将json数据还原成model对象
      this.productDetailModel = ProductDetailModel.fromJson(resData['data']);
      notifyListeners();
    });
  }

}