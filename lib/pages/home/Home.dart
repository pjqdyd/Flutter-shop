import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

//首页页面
class HomePage extends StatelessWidget {

  final arguments;

  HomePage({this.arguments}); //构造方法接收参数对象

  void getHttp() async{
    var url = "https://www.easy-mock.com/mock/5c8dd97d6fe7c7611499c703/test/userinfo";
    try{
      Response response = await Dio().get(url);
      print(response);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(
        child: Text("首页"),
      ),
    );
  }
}