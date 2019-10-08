import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provider/ProductDetailProd.dart';

import '../../../model/ProductDetailModel.dart';

//详情页顶部组件
class DetailHeader extends StatelessWidget {
  const DetailHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<ProductDetailProd>( //从状态管理中获取数据
      builder: (context, child, productDetailProd){
        var productDetail = Provide.value<ProductDetailProd>(context).productDetailModel;
        if(productDetail != null){
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  _productImage(productDetail.image1),   //商品图片
                  _productName(productDetail.pruductName), //商品名称
                  _productNum(productDetail.pruductISerialNumber), //商品编号
                  _productPrice(productDetail.presentPrice, productDetail.oriPrice),
                ],
              ),
            );
        }else{
          return Text("正在加载..");
        }
      },
    );
  }

  //定义返回商品图片的方法
  Widget _productImage(String imageUrl){
    return Image.network(
      imageUrl,
      width: ScreenUtil().setWidth(740),
    );
  }

  //定义返回商品名称的方法
  Widget _productName(String name){
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  //定义返回商品编号的方法
  Widget _productNum(String num){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        '编号: ${num}',
        style: TextStyle(
          color: Colors.black26,
        ),
      ),
    );
  }

  //返回商品价格组件
  Widget _productPrice(double newPrince, double oldPrice){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 15),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
           Text(
            "¥ ${newPrince}",
            style: TextStyle(
              color: Color(0xFF8C7BFD),
              fontSize: ScreenUtil().setSp(35),
            ),
          ),
          SizedBox(width: 20,),
          Text(
            '￥ ${oldPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }


}