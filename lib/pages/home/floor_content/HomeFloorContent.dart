import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页商品楼层内容组件
class HomeFloorContent extends StatelessWidget {

  final List floorProductDataList; //楼层商品数据

  HomeFloorContent({Key key, this.floorProductDataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherRow()
        ],
      ),
    );
  }

  //单个商品组件
  Widget _productItem(Map product){
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(361),
        height: ScreenUtil().setHeight(250),
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(2),
         image: DecorationImage(image:  NetworkImage(product['image']),fit: BoxFit.cover,),
        ),
        //child: Image.network(product['image'], fit: BoxFit.cover,),
      ),
      onTap: (){},
    );
  }

  //第一行商品组
  Widget _firstRow(){
    return Row(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(506),
          child: _productItem(floorProductDataList[0]),
        ),
        Column(
          children: <Widget>[
            _productItem(floorProductDataList[1]),
            _productItem(floorProductDataList[2]),
          ],
        )
      ],
    );
  }

  //下面其他商品组
  Widget _otherRow(){
    return Wrap( //流布局
      //spacing: 2, //子组件主轴方向的间距
      //alignment: WrapAlignment.center, //主轴上的对齐方式
      //runSpacing: 2, //纵轴的间距
      //runAlignment: WrapAlignment.end, //纵轴的对齐方式
      direction: Axis.horizontal, //水平排列
      children: _getOtherList(),
    );
  }

  //定义返回其他商品组的方法
  List<Widget> _getOtherList(){

    List<Widget> otherList = new List();
    int length = floorProductDataList.length;
    //从第3个商品开始, 就是其他商品
    for(int i = 3; i < length; i++){
      otherList.add(_productItem(floorProductDataList[i]));
    }
    return otherList;
  }

}