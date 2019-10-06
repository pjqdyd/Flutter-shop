import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页轮播组件
class HomeSwiper extends StatelessWidget {

  final List swiperDataList; //轮播的数据

  HomeSwiper({this.swiperDataList});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            child: Image.network("${swiperDataList[index]['image']}", fit: BoxFit.fill,),
            onTap: (){ //点击跳转到详情页
              Navigator.pushNamed(context, "/details", arguments: {'productId': "${swiperDataList[index]['productId']}"});
            },
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}