import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../../../provider/ProductDetailProd.dart';

//详情页选项卡
class DetailTabbar extends StatelessWidget {
  const DetailTabbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1180),
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[

            TabBar(
              labelColor: Color(0xFF8C7BFD),
              unselectedLabelColor: Colors.black,
              indicatorWeight: 1,
              tabs: <Widget>[
                Tab(text: '详情'),
                Tab(text: '评论'),
              ],
              onTap: (index){
                print(index.toString());
              },
            ),

            Expanded(
              child: TabBarView(
                children: <Widget>[
                  _productInfo(),    //商品详情
                  _productComments(),//商品评论
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }


  //商品详情组件
  Widget _productInfo(){
    return Text("1");
  }

  //商品评论组件
  Widget _productComments(){
    return Text("2");
  }
}
