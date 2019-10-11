import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../service/serviceMethod.dart' as HttpMethod;

import 'package:provide/provide.dart';   //引入使用状态管理
import '../../../provider/ProductListProd.dart';
import '../../../provider/SubCategoryProd.dart';

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
        return Expanded(
          child: Container(
            width: ScreenUtil().setWidth(570),
            child: EasyRefresh( //上拉加载组件
              footer: BallPulseFooter(color: Color(0xFF8C7BFD),),
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index){
                  return InkWell(
                    child: _itemBox(productList[index]),
                    onTap: (){},
                  );
                },
              ),
              onLoad: () async {
                print("上拉加载商品");
                _getProductList(); //加载一页商品数据
                Provide.value<SubCategoryProd>(context).setPage(); //page++
              },
            ),
          ),
        );
      },
    );
  }

  //定义返回每个商品盒子的方法
  Widget _itemBox(ProductDataModel product){
    return ListTile(
      leading: Image.network(product.image, fit: BoxFit.cover,),
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

  //定义获取商品数据, 并保存数据到状态管理的方法
  void _getProductList() async{
    var provide = Provide.value<SubCategoryProd>(context); //从状态管理中获取数据
    if(provide.page > 3){//没有数据了
      Fluttertoast.showToast(
        msg: "没有数据了",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color.fromRGBO(104, 87, 229, 0.8),
        textColor: Colors.white,
        fontSize: 16,
      );
      return null;
    }
    var param = {
      'categoryId': provide.categoryId,
      'categorySubId': provide.subCategoryId,
      'page': provide.page
    };
    await HttpMethod.getCategoryPageProducts(params: param).then((resData){
       List<dynamic> productList = resData['data']; //获取商品列表集合
       List<ProductDataModel> list = [];
      //将json数据商品还原成商品Model对象, 并存入list集合中
      productList.forEach((item){
        list.add(new ProductDataModel.fromJson(item));
      });
      Provide.value<ProductListProd>(context).setAddProductList(list); //添加一页数据到状态管理
    });

  }

}