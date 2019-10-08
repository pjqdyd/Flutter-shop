import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../provider/ProductDetailProd.dart';

import './detail_header/DetailHeader.dart';   //商品详情头部
import './detail_explain/DetailExplain.dart'; //商品解释组件
import './detail_tabbar/DetailTabbar.dart';   //商品页选项卡组件


//商品详情页
class DetailsPage extends StatelessWidget {

  final Map arguments;
  DetailsPage({this.arguments}); //构造方法接收参数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //返回按钮
          icon: Icon(Icons.arrow_back),
          onPressed: (){ Navigator.of(context).pop(); },
        ),
        title: Text("商品详情"),
      ),
      body: FutureBuilder(
        future: _getProductDetail(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Container(
              width: ScreenUtil().setWidth(750),
              child: ListView(
                children: <Widget>[
                  DetailHeader(),  //商品详情头部组件
                  DetailExplain(), //商品详情解释信息组件
                  DetailTabbar(),  //商品页选项卡组件
                ],
              ),
            );
          }else{
            return Text("加载中..");
          }
        },
      ),
    );
  }

  //异步获取商品详情的方法
  Future _getProductDetail(BuildContext context) async{
    await Provide.value<ProductDetailProd>(context).getProductDetailInfo(arguments['productId']);
    return ""; //因为是通过状态管理来渲染数据, 所以这里无需返回
  }
}