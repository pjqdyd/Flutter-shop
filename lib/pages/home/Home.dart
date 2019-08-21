import 'package:flutter/material.dart';
import '../../service/serviceMethod.dart';

//首页页面
class HomePage extends StatefulWidget {

  Map arguments; //定义接收的参数map集合
  HomePage({this.arguments});
  _HomePageState createState() => _HomePageState(arguments: this.arguments);

}

class _HomePageState extends State<HomePage> {
  Map arguments;
  _HomePageState({this.arguments}); //接收构造参数并赋值

  String homePageContext = '还没有首页数据';
  @override
  void initState() { //初始化执行的方法
    getHomePageContent().then((val){ //加载首页数据
      setState(() {
       homePageContext = val.toString(); 
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Cool店"),
         ),
         body: SingleChildScrollView(
           child: Text(homePageContext),
         )
       ),
    );
  }
}