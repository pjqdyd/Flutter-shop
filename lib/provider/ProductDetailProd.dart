import 'package:flutter/foundation.dart';

import '../model/ProductDetailModel.dart';
import '../service/serviceMethod.dart' as HttpMethod;

//商品详情页状态管理
class ProductDetailProd with ChangeNotifier{

  //商品详情数据
  ProductDetailModel productDetailModel = null;

  //当前激活的选项卡
  bool isLActive = true;    //详情选项卡
  bool isRActive =  false;  //评论选项卡

  //从后台获取商品数据
  void getProductDetailInfo(String productId){
    HttpMethod.getProductDetailInfo(params: {'productId': productId}).then((resData){
      //将json数据还原成model对象
      this.productDetailModel = ProductDetailModel.fromJson(resData['data']);
      notifyListeners();
    });
  }

  //选项卡切换的方法
  void setTabbarActive(String changeState){
    if(changeState == 'left'){
      isLActive = true;
      isRActive = false;
    }else{
       isLActive = false;
      isRActive = true;
    }
  }
  notifyListeners();
}