import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../config/httpHeaders.dart';

//首页页面
class HomePage extends StatefulWidget {

  Map arguments; //定义接收的参数map集合
  HomePage({this.arguments});
  _HomePageState createState() => _HomePageState(arguments: this.arguments);

}

class _HomePageState extends State<HomePage> {
  Map arguments;
  _HomePageState({this.arguments}); //接收构造参数并赋值

  String text = '还没有数据';

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Cool店"),
         ),
         body: Column(
           children: <Widget>[
             RaisedButton(
               child: Text("请求数据"),
               onPressed: _showData,
             ),
             Text(text),
           ],
         ),
       ),
    );
  }

  //请求数据展示
  void _showData(){
    print("开始请求数据");
    getData().then((val){
      setState(() {
       text = val['data'].toString(); 
      });
    });
  }

  //定义异步请求数据的方法
  Future getData() async{
    try{
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;//设置请求头
      Response response = await dio.get('https://time.geekbang.org/serv/v1/column/newAll');
      print(response);
      return response.data;
    }catch(e){
      return print(e);
    }
  }

}