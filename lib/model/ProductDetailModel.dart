//商品详情的数据模型
class ProductDetailModel {
  String image5;
  int amount;
  String image3;
  String image4;
  String pruductId;
  String isOnline;
  String image1;
  String image2;
  String pruductISerialNumber;
  double oriPrice;
  double presentPrice;
  String comPic;
  int state;
  String shopId;
  String pruductName;
  String pruductDetail;
  List<PruductComments> pruductComments;
  AdvertesPicture advertesPicture;

  ProductDetailModel(
      {this.image5,
      this.amount,
      this.image3,
      this.image4,
      this.pruductId,
      this.isOnline,
      this.image1,
      this.image2,
      this.pruductISerialNumber,
      this.oriPrice,
      this.presentPrice,
      this.comPic,
      this.state,
      this.shopId,
      this.pruductName,
      this.pruductDetail,
      this.pruductComments,
      this.advertesPicture});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    image5 = json['image5'];
    amount = json['amount'];
    image3 = json['image3'];
    image4 = json['image4'];
    pruductId = json['pruductId'];
    isOnline = json['isOnline'];
    image1 = json['image1'];
    image2 = json['image2'];
    pruductISerialNumber = json['pruductISerialNumber'];
    oriPrice = double.parse(json['oriPrice'].toString());
    presentPrice = double.parse(json['presentPrice'].toString());
    comPic = json['comPic'];
    state = json['state'];
    shopId = json['shopId'];
    pruductName = json['pruductName'];
    pruductDetail = json['pruductDetail'];
    if (json['pruductComments'] != null) {
      pruductComments = new List<PruductComments>();
      json['pruductComments'].forEach((v) {
        pruductComments.add(new PruductComments.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image5'] = this.image5;
    data['amount'] = this.amount;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['pruductId'] = this.pruductId;
    data['isOnline'] = this.isOnline;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['pruductISerialNumber'] = this.pruductISerialNumber;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['comPic'] = this.comPic;
    data['state'] = this.state;
    data['shopId'] = this.shopId;
    data['pruductName'] = this.pruductName;
    data['pruductDetail'] = this.pruductDetail;
    if (this.pruductComments != null) {
      data['pruductComments'] =
          this.pruductComments.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    return data;
  }
}

class PruductComments {
  String sCORE;
  String comments;
  String userName;
  String discussTime;

  PruductComments({this.sCORE, this.comments, this.userName, this.discussTime});

  PruductComments.fromJson(Map<String, dynamic> json) {
    sCORE = json['SCORE'].toString();
    comments = json['comments'];
    userName = json['userName'];
    discussTime = json['discussTime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SCORE'] = this.sCORE;
    data['comments'] = this.comments;
    data['userName'] = this.userName;
    data['discussTime'] = this.discussTime;
    return data;
  }
}

class AdvertesPicture {
  String pICTUREADDRESS;
  String tOPLACE;

  AdvertesPicture({this.pICTUREADDRESS, this.tOPLACE});

  AdvertesPicture.fromJson(Map<String, dynamic> json) {
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
    tOPLACE = json['TO_PLACE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    data['TO_PLACE'] = this.tOPLACE;
    return data;
  }
}