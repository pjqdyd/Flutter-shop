import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/serviceUrl.dart';

/**
 * 获取首页内容
 * params 可选请求参数
 */
Future getHomePageContent({params="{}"}) async{
  print('开始获取首页数据..');
  Dio dio = new Dio();
  dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");

  try{
    Response response = await dio.post(
     servicePath['homePageContent'],
     data: params, 
     //options: new Options(contentType: ContentType.parse("application/x-www-form-urlencoded")),
     );
    if(response.statusCode == 200){
      print("请求首页数据成功");
      return response.data;
    }else{
      throw Exception('请求首页数据异常');
    }
  }catch(e){
    return print('ERROR: 请求首页数据异常========>${e}');
  }
}