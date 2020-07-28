import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/serviceUrl.dart';


/**
 * 发送post请求的方法
 * url 请求的url
 * params 可选请求参数
 * name   请求的名称
 */
Future sendPostRequest(url, {params="{}", name="默认"}) async{
  Dio dio = new Dio();
  /// dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
  dio.options.contentType = Headers.formUrlEncodedContentType;
  try{
    Response response = await dio.post(url, data: params,);
    if(response.statusCode == 200){
      print('-----------------------------------------------------');
      print("请求${name}数据成功-URL:" + response.request.path);
      print("请求参数:" + response.request.data.toString());
      print('-----------------------------------------------------');
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
  return await sendPostRequest(servicePath['homePageContent'], name: "首页内容");
}

//获取首页热门商品的方法
Future getHomeHotProduct({params="{}"}) async{
  return await sendPostRequest(servicePath['homePageHot'], params: params, name: "首页热门商品");
}

//获取分类页数据内容的方法
Future getCategoryPageContent({params="{}"}) async{
  return await sendPostRequest(servicePath['categoryPageContent'], params: params, name: "分类页内容");
}

//获取分类页商品列表的方法
Future getCategoryPageProducts({params="{}"}) async{
  return await sendPostRequest(servicePath['categoryPageProducts'], params: params, name: "分类页商品列表");
}

//获取商详情的方法
Future getProductDetailInfo({params="{}"}) async{
  return await sendPostRequest(servicePath['productPageDetail'], params: params, name: "商品详情");
}

