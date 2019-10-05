import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//首页热门商品组件
class HomeHotProduct extends StatefulWidget {
  List<Map> hotProductList; //热门商品数据
  HomeHotProduct(this.hotProductList ,{Key key});

  _HomeHotProductState createState() => _HomeHotProductState(hotProductList: this.hotProductList);
}

class _HomeHotProductState extends State<HomeHotProduct> {

  List<Map> hotProductList; //热门商品数据
  _HomeHotProductState({this.hotProductList}); //接收参数并赋值

  @override
  Widget build(BuildContext context) {
    return Container(
       child: _wrapHotProducts(), //热门商品网格布局组件
    );
  }

  //定义返回热门商品流式布局组件的方法
  Widget _wrapHotProducts(){
    if(hotProductList.length > 0){
      //将数组收集为组件
      List<Widget> hotProductWidgetList = hotProductList.map((val){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, "/details", arguments: {'productId': "${val['id']}"});
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white24,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 3),
            child: Column(
              children: <Widget>[
                Image.network( //商品图片
                  val['image'],
                  width: ScreenUtil().setWidth(370),  
                  height: ScreenUtil().setWidth(380),
                  fit: BoxFit.cover,
                ),
                Container(  //商品名称
                  alignment: Alignment.centerLeft,
                  child: Text(
                      val['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setSp(26),),
                    ),
                ),
                Row( //商品价格
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('￥${val['newPrice']}'),
                    Text(
                      '￥${val['oldPrice']}',
                      style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      //返回网格布局组件
      return Wrap(
        spacing: 2,
        alignment: WrapAlignment.spaceEvenly,
        children: hotProductWidgetList,
      );

    }else{
      return Text('没有数据');
    }
  }
}