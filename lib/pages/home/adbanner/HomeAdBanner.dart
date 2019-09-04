import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; //跳转工具(支持网址, 电话, 邮箱, 短信)

//首页广告Banner图片
class HomeAdBanner extends StatelessWidget {

  final String adImageUrl; //广告图片的地址
  final String jumpAddress; //点击广告图片跳转的地址

  HomeAdBanner({Key key, this.adImageUrl, this.jumpAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(this.adImageUrl),
        onTap: (){
          print("点击了Cool街广告");
          this._launcherUrl(); //跳转
        },
      ),
    );
  }

  //跳转的方法
  void _launcherUrl() async{
    String url = jumpAddress;
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw '不能跳转到URL异常: $jumpAddress';
    }
  }

}