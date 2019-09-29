import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//右侧顶部的子分类导航组件
class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {

  List list = ['22','32','345'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12),),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index){
          return _itemBox(list[index]);
        },
      ),
    );
  }

  //每个分类盒子
  Widget _itemBox(String item){
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item,
          style: TextStyle(fontSize: ScreenUtil().setSp(28),),
        ),
      ),
    );
  }

}