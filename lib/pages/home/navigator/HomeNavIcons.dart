import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页导航分类图标(GridView布局)
class HomeNavIcons extends StatelessWidget {

  final List navIconDataList; //图标数据集合

  HomeNavIcons({this.navIconDataList});

  //返回一个图标分类块Column的方法
  Widget _getGridViewItem(BuildContext context, item){
    return InkWell(
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(128),), //图标
          Text(item['categoryName'], style: TextStyle(fontSize: ScreenUtil().setSp(24)),), //名称
        ],
      ),
      onTap: (){
        print("点击了图标-${item['categoryName']}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(360),
      padding: EdgeInsets.all(3.0),
      child: GridView.count( //网格布局
        crossAxisCount: 4,   //每行4个
        padding: EdgeInsets.all(3.0),
        children: navIconDataList.map((item){ //遍历图标数据
          return _getGridViewItem(context, item);
        }).toList(),
      ),
    );
  }
}