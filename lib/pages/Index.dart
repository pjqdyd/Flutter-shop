import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category/Categort.dart';
import 'home/Home.dart';
import 'cart/Cart.dart';
import 'member/Member.dart';

//主页组件
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  
  int _currentIndex = 0; //当前底部Tab栏下标
  final List _tabBodies = [ //对应底部栏的组件集合
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Cool店"),
      // ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: this._tabBodies[this._currentIndex], //显示当前下标的组件
      bottomNavigationBar: BottomNavigationBar( //底部Tab栏
        iconSize: 25.0,
        currentIndex: this._currentIndex,
        type: BottomNavigationBarType.fixed, //超过3个就要设置
        selectedFontSize: 11,
        unselectedFontSize: 10,
        onTap: (int index) { //点击改变激活的下标
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心"))
        ],
      ),
    );
  }
}
