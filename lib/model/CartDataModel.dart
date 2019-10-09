//购物车商品数据模型
class CartDataModel {
  String productId;
  String productName;
  int count;
  double price;
  String image;

  CartDataModel(
      {this.productId, this.productName, this.count, this.price, this.image});

  CartDataModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    count = json['count'];
    price = double.parse(json['price'].toString());
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['count'] = this.count;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}