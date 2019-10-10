import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//购物车底部栏组件
class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _selectAllBtn(),
          _allPriceArea(),
          _goButton(),
        ],
      ),
    );
  }

  //全选按钮
  Widget _selectAllBtn(){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            activeColor: Color(0xFF8C7BFD),
            onChanged: (bool val){},
          ),
          Text("全选"),
        ],
      ),
    );
  }

  //总价盒子
  Widget _allPriceArea(){
    return Container(
      width: ScreenUtil().setWidth(410),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(260),
                alignment: Alignment.centerRight,
                child: Text(
                  "合计:",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(150),
                alignment: Alignment.centerLeft,
                child: Text(
                  "¥ 2003",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.red
                  ),
                ),
              ),
            ],
          ),

          Container(
            width: ScreenUtil().setWidth(400),
            alignment: Alignment.centerRight,
            child: Text(
              '满50免减100,特价优惠',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //结算按钮
  Widget _goButton(){
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration:BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            '结算(3)',
            style: TextStyle( color: Colors.white, ),
          ),
        ),
        onTap: (){},
      ),
    );
  }
}