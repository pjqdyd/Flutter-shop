import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/serviceUrl.dart';


/**
 * 发送post请求的方法
 * url 请求的url
 * params 可选请求参数
 */
Future sendPostRequest(url, {params="{}"}) async{
  Dio dio = new Dio();
  dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
  try{
    Response response = await dio.post(url, data: params,);
    if(response.statusCode == 200){
      print("请求数据成功-Url:" + response.request.path);
      print("请求参数:" + response.request.data.toString());
      return response.data;
    }else{
      throw Exception('请求数据失败:'+ response.request.path);
    }
  }catch(e){
    return print('ERROR: 请求数据异常========>${e}');
  }
}



//获取首页内容的方法
Future getHomePageContent({params="{}"}) async{
  print('开始获取首页数据..');
  return await sendPostRequest(servicePath['homePageContent']);
}

//获取首页热门商品的方法
Future getHomeHotProduct({params="{}"}) async{
  print('开始获取首页热门商品数据..');
  return await sendPostRequest(servicePath['homePageHot'], params: params);
}

//获取分类页数据内容的方法
Future getCategoryPageContent({params="{}"}) async{
  print('开始获取分类页数据..');
  return await sendPostRequest(servicePath['categoryPageContent'], params: params);
}

//获取分类页商品列表的方法
Future getCategoryPageProducts({params="{}"}) async{
  print('开始获取分类页商品列表数据..');
  return await sendPostRequest(servicePath['categoryPageProducts'], params: params);
}

//获取商详情的方法
Future getProductDetailInfo({params="{}"}) async{
  print('开始获取商品详情数据..');
  return await sendPostRequest(servicePath['productPageDetail'], params: params);
}

