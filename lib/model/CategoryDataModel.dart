
//分类页的数据模型
class CategoryDataModle {
  String mallCategoryId;   //分类id
  String mallCategoryName; //分类名称
  List<SubCategoryData> subCategoryDataList; //子分类的列表
  Null comments;
  String image;           //分类图片

  //构造器
  CategoryDataModle({this.mallCategoryId, this.mallCategoryName,this.subCategoryDataList,this.comments,this.image});

  //传入json数据的构造器
  CategoryDataModle.fromJson(Map<String, dynamic> json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    if (json['subCategoryDataList'] != null) {
      subCategoryDataList = new List<SubCategoryData>();
      json['subCategoryDataList'].forEach((v) {
        subCategoryDataList.add(new SubCategoryData.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
  }

  //获取json数据map的方法
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.subCategoryDataList != null) {
      data['subCategoryDataList'] = this.subCategoryDataList.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}


//子分类数据模型
class SubCategoryData {
  String mallSubId;      //子分类id
  String mallCategoryId; //父分类id
  String mallSubName;    //子分类名称
  Null comments;

  //子分类构造器
  SubCategoryData({this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  //传入json的构造器
  SubCategoryData.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  //获取json数据map的构造器
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}