
//商品的数据模型
class ProductDataModel {
  String _image;      //商品图片
  String _oriPrice;   //价格
  String _presentPrice; //目前价格
  String _goodsName;    //商品名称
  String _goodsId;      //商品id

  ProductDataModel(
      {String image,
      String oriPrice,
      String presentPrice,
      String goodsName,
      String goodsId}) {
    this._image = image;
    this._oriPrice = oriPrice;
    this._presentPrice = presentPrice;
    this._goodsName = goodsName;
    this._goodsId = goodsId;
  }

  String get image => _image;
  set image(String image) => _image = image;
  String get oriPrice => _oriPrice;
  set oriPrice(String oriPrice) => _oriPrice = oriPrice;
  String get presentPrice => _presentPrice;
  set presentPrice(String presentPrice) => _presentPrice = presentPrice;
  String get goodsName => _goodsName;
  set goodsName(String goodsName) => _goodsName = goodsName;
  String get goodsId => _goodsId;
  set goodsId(String goodsId) => _goodsId = goodsId;

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _oriPrice = json['oriPrice'].toString();
    _presentPrice = json['presentPrice'].toString();
    _goodsName = json['goodsName'];
    _goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['oriPrice'] = this._oriPrice;
    data['presentPrice'] = this._presentPrice;
    data['goodsName'] = this._goodsName;
    data['goodsId'] = this._goodsId;
    return data;
  }
}