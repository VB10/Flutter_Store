class Categories {
  int id;
  String categoryName;
  String photoUrl;
  int totalItem;

  Categories({this.id, this.categoryName, this.photoUrl, this.totalItem});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    photoUrl = json['photoUrl'];
    totalItem = json['totalItem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['photoUrl'] = this.photoUrl;
    data['totalItem'] = this.totalItem;
    return data;
  }
}
