import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';   //上拉加载下拉刷新插件
import 'package:flutter_easyrefresh/material_header.dart'; //下拉刷新头部
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart'; //上拉加载底部
import 'package:fluttertoast/fluttertoast.dart';               //Toast通知提示插件


import '../../service/serviceMethod.dart' as HttpMethod; //http请求方法

//import 'dart:convert';             //json格式数据转换
import 'swiper/HomeSwiper.dart';     //轮播组件
import 'navigator/HomeNavIcons.dart';//导航图标组件
import 'adbanner/HomeAdBanner.dart'; //广告图片组件
import 'recommend/HomeRecommend.dart'; //推荐商品组件
import 'floor_title/HomeFloorTitle.dart'; //商品楼层标题组件
import 'floor_content/HomeFloorContent.dart'; //商品楼层内容组件
import 'hot_title/HomeHotTitle.dart';      //热门商品标题组件
import 'hot_products/HomeHotProduct.dart'; //热门商品组件


//首页页面
class HomePage extends StatefulWidget {

  Map arguments; //定义接收的路由跳转参数map集合
  HomePage({this.arguments});
  _HomePageState createState() => _HomePageState(arguments: this.arguments);

}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  int page = 1; //热门商品的页数
  List<Map> hotProductList = []; //热门商品数据集合

  Map arguments; //路由跳转参数map集合
  _HomePageState({this.arguments}); //接收构造参数并赋值

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Cool店"),
         ),
         body: FutureBuilder( //异步渲染组件
           future: HttpMethod.getHomePageContent(), //调用异步方法(初始首页数据)
           builder: (context, snapshot){
             if(snapshot.hasData){
               //var resData = json.decode(snapshot.data.toString()); //不用转换,默认json格式
               var resData = snapshot.data;
               List swiperList = resData['data']['swiperList'];   //轮播数据
               List navIconList = resData['data']['navIconList']; //导航分类图标数据
               String adImageUrl = resData['data']['adImageUrl']; //广告图标url 
               String adJumpAddress = resData['data']['adJumpAddress']; //点击广告跳转的地址
               List recommendList = resData['data']['recommendList'];   //推荐商品数据
               String ftImageUrl = resData['data']['ftImageUrl'];       //商品楼层标题图片地址
               List<Map> floorProductList = (resData['data']['floorProductList'] as List).cast(); //商品楼层商品数据

               return EasyRefresh(
                 header: MaterialHeader(),
                 footer: BezierBounceFooter(backgroundColor: Color(0xFF8C7BFD),), //16 argb进制色 #FF8C7BFD
                 child: ListView(
                  children: <Widget>[
                    HomeSwiper(swiperDataList: swiperList),
                    HomeNavIcons(navIconDataList: navIconList),
                    HomeAdBanner(adImageUrl: adImageUrl, jumpAddress: adJumpAddress),
                    HomeRecommend(recommendDataList: recommendList),
                    HomeFloorTitle(ftImageUrl: ftImageUrl),
                    HomeFloorContent(floorProductDataList: floorProductList),
                    HomeHotTitle(),
                    HomeHotProduct(hotProductList),
                  ],
                ),
                onRefresh: () async {}, //下拉刷新
                onLoad: () async {      //上拉加载
                  print("下拉加载中..");
                  this._getHotProduct();  //加载一页数据
                },
               );
             }else{
               return Center(
                 child: Text('加载中..'),
               );
             }
           },
         )
       ),
    );
  }

  //定义获取热门商品数据的方法
  void _getHotProduct() async{
      if(this.page > 3){ //没有数据了
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
      await HttpMethod.getHomeHotProduct(params: {'page': this.page, 'size': 5}).then((data){
      //新的商品数据
      List<Map> newHotProductList = (data['data']['hotProductDataList'] as List).cast();
      setState(() {
       this.hotProductList.addAll(newHotProductList); //添加拼接一页商品数据 
       this.page++;
      });
    });
  }

}
