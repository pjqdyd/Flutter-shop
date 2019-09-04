import 'package:flutter/material.dart';
import '../../service/serviceMethod.dart'; //http请求方法

//import 'dart:convert';             //json格式数据转换
import 'swiper/HomeSwiper.dart';     //轮播组件
import 'navigator/HomeNavIcons.dart';//导航图标组件
import 'adbanner/HomeAdBanner.dart'; //广告图片组件

//首页页面
class HomePage extends StatefulWidget {

  Map arguments; //定义接收的参数map集合
  HomePage({this.arguments});
  _HomePageState createState() => _HomePageState(arguments: this.arguments);

}

class _HomePageState extends State<HomePage> {
  Map arguments;
  _HomePageState({this.arguments}); //接收构造参数并赋值

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Cool店"),
         ),
         body: FutureBuilder( //异步渲染组件
           future: getHomePageContent(), //调用异步方法(初始首页数据)
           builder: (context, snapshot){
             if(snapshot.hasData){
               //var resData = json.decode(snapshot.data.toString()); //不用转换,默认json格式
               var resData = snapshot.data;
               List swiperList = resData['data']['swiperList'];   //轮播数据
               List navIconList = resData['data']['navIconList']; //导航分类图标数据
               String adImageUrl = resData['data']['adImageUrl']; //广告图标url 
               String adJumpAddress = resData['data']['adJumpAddress']; //点击广告跳转的地址

               return Column(
                 children: <Widget>[
                   HomeSwiper(swiperDataList: swiperList),
                   HomeNavIcons(navIconDataList: navIconList),
                   HomeAdBanner(adImageUrl: adImageUrl, jumpAddress: adJumpAddress)
                 ],
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
}

/**
 * 
 */