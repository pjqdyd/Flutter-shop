import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页商品推荐组件
class HomeRecommend extends StatelessWidget {

  final List recommendDataList; //推荐商品数据

  HomeRecommend({Key key, this.recommendDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(270),
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          _titleWidget(), //推荐标题
          _productListX() //商品列表
        ],
      ),
    );
  }

  //推荐标题组件
  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(7, 0, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12),),
      ),
      child: Text("商品推荐"),
    );
  }

  //商品单独项组件, index商品数据的下标
  Widget _productItem(index, context){
    return InkWell(
      child: Container(
        height: ScreenUtil().setHeight(210),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 1, color: Colors.black12),),
        ),
        child: Column(
          children: <Widget>[
            Image.network( //商品图片
              this.recommendDataList[index]['image'],
              height:  ScreenUtil().setHeight(140),
              fit: BoxFit.fill,
            ), 
            Text("¥ ${recommendDataList[index]['price']}",),        //价格
          ],
        ),
      ),
      onTap: (){
        Navigator.pushNamed(context, "/details", arguments: {'productId': "${recommendDataList[index]['productId']}"});
      },
    );
  }

  //横向商品列表
  Widget _productListX(){
    return Container(
      height: ScreenUtil().setHeight(210),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendDataList.length,
        itemBuilder: (context, index){
          return _productItem(index, context);
        },
      ),
    );
  }

}