
class CategoriesModel {
  String? status;
  Categories? categories;
  Items? items;
  Text? text;

  CategoriesModel({this.status, this.categories, this.items, this.text});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    categories = json["categories"] == null ? null : Categories.fromJson(json["categories"]);
    items = json["items"] == null ? null : Items.fromJson(json["items"]);
    text = json["text"] == null ? null : Text.fromJson(json["text"]);
  }

  static List<CategoriesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CategoriesModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(categories != null) {
      _data["categories"] = categories?.toJson();
    }
    if(items != null) {
      _data["items"] = items?.toJson();
    }
    if(text != null) {
      _data["text"] = text?.toJson();
    }
    return _data;
  }
}

class Text {
  String? status;
  List<Data2>? data;

  Text({this.status, this.data});

  Text.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data2.fromJson(e)).toList();
  }

  static List<Text> fromList(List<Map<String, dynamic>> list) {
    return list.map(Text.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data2 {
  int? textId;
  String? textTitle;
  String? textBody;

  Data2({this.textId, this.textTitle, this.textBody});

  Data2.fromJson(Map<String, dynamic> json) {
    textId = json["text_id"];
    textTitle = json["text_title"];
    textBody = json["text_body"];
  }

  static List<Data2> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data2.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["text_id"] = textId;
    _data["text_title"] = textTitle;
    _data["text_body"] = textBody;
    return _data;
  }
}

class Items {
  String? status;
  List<Data1>? data;

  Items({this.status, this.data});

  Items.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
  }

  static List<Items> fromList(List<Map<String, dynamic>> list) {
    return list.map(Items.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data1 {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemDescShort;
  String? itemDescShortAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatatime;

  Data1({this.itemId, this.itemName, this.itemNameAr, this.itemDesc, this.itemDescAr, this.itemDescShort, this.itemDescShortAr, this.itemImage, this.itemCount, this.itemActive, this.itemPrice, this.itemDiscount, this.itemDate, this.itemCat, this.categoriesId, this.categoriesName, this.categoriesNameAr, this.categoriesImage, this.categoriesDatatime});

  Data1.fromJson(Map<String, dynamic> json) {
    itemId = json["item_id"];
    itemName = json["item_name"];
    itemNameAr = json["item_name_ar"];
    itemDesc = json["item_desc"];
    itemDescAr = json["item_desc_ar"];
    itemDescShort = json["item_desc_short"];
    itemDescShortAr = json["item_desc_short_ar"];
    itemImage = json["item_image"];
    itemCount = json["item_count"];
    itemActive = json["item_active"];
    itemPrice = json["item_price"];
    itemDiscount = json["item_discount"];
    itemDate = json["item_date"];
    itemCat = json["item_cat"];
    categoriesId = json["categories_id"];
    categoriesName = json["categories_name"];
    categoriesNameAr = json["categories_name_ar"];
    categoriesImage = json["categories_image"];
    categoriesDatatime = json["categories_datatime"];
  }

  static List<Data1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["item_id"] = itemId;
    _data["item_name"] = itemName;
    _data["item_name_ar"] = itemNameAr;
    _data["item_desc"] = itemDesc;
    _data["item_desc_ar"] = itemDescAr;
    _data["item_desc_short"] = itemDescShort;
    _data["item_desc_short_ar"] = itemDescShortAr;
    _data["item_image"] = itemImage;
    _data["item_count"] = itemCount;
    _data["item_active"] = itemActive;
    _data["item_price"] = itemPrice;
    _data["item_discount"] = itemDiscount;
    _data["item_date"] = itemDate;
    _data["item_cat"] = itemCat;
    _data["categories_id"] = categoriesId;
    _data["categories_name"] = categoriesName;
    _data["categories_name_ar"] = categoriesNameAr;
    _data["categories_image"] = categoriesImage;
    _data["categories_datatime"] = categoriesDatatime;
    return _data;
  }
}

class Categories {
  String? status;
  List<Data>? data;

  Categories({this.status, this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  static List<Categories> fromList(List<Map<String, dynamic>> list) {
    return list.map(Categories.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatatime;

  Data({this.categoriesId, this.categoriesName, this.categoriesNameAr, this.categoriesImage, this.categoriesDatatime});

  Data.fromJson(Map<String, dynamic> json) {
    categoriesId = json["categories_id"];
    categoriesName = json["categories_name"];
    categoriesNameAr = json["categories_name_ar"];
    categoriesImage = json["categories_image"];
    categoriesDatatime = json["categories_datatime"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["categories_id"] = categoriesId;
    _data["categories_name"] = categoriesName;
    _data["categories_name_ar"] = categoriesNameAr;
    _data["categories_image"] = categoriesImage;
    _data["categories_datatime"] = categoriesDatatime;
    return _data;
  }
}