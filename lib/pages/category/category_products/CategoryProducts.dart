import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provide/provide.dart';   //引入使用状态管理
import '../../../provider/ProductListProd.dart';

import '../../../model/ProductDataModel.dart';  //商品数据模型

//分类页的商品列表组件
class CategoryProducts extends StatefulWidget {
  CategoryProducts({Key key}) : super(key: key);

  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {

  @override
  Widget build(BuildContext context) {
    return Provide<ProductListProd>(
      builder: (context, child, productListProd){
        var productList = productListProd.productList;  //获取状态管理的商品列表数据
        return Container(
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(960),
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index){
              return InkWell(
                child: _itemBox(productList[index]),
                onTap: (){},
              );
            },
          ),
        );
      },
    );
  }

  //定义返回每个商品盒子的方法
  Widget _itemBox(ProductDataModel product){
    return ListTile(
      leading: Image.network(product.image),
      title: Text(
        product.goodsName,
        style: TextStyle(fontSize: ScreenUtil().setSp(32),),
      ),
      subtitle: Row(
        children: <Widget>[
          Text(
            '价格: ￥${product.presentPrice}',
            style: TextStyle(
              color: Color.fromRGBO(104, 87, 229, 0.8),
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          SizedBox(width: 20,),
          Text(
            '￥${product.oriPrice}',
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