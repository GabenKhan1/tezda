class ProductModel {
  bool? success;
  String? message;
  Data? data;

  ProductModel({this.success, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Geometry? geometry;
  String? password;
  String? restaurantName;
  String? restaurantLogo;
  String? restaurantCoverImage;
  String? restaurantDescription;
  int? minDeliveryTime;
  int? maxDeliveryTime;
  String? timeStamp;
  String? cuisine;
  String? zone;
  int? tax;
  String? ownerFirstName;
  String? ownerLastName;
  String? ownerEmail;
  bool? verified;
  String? sId;
  String? ownerPhoneNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Products>? products;
  List<Categories>? categories;

  Data(
      {this.geometry,
      this.password,
      this.restaurantName,
      this.restaurantLogo,
      this.restaurantCoverImage,
      this.restaurantDescription,
      this.minDeliveryTime,
      this.maxDeliveryTime,
      this.timeStamp,
      this.cuisine,
      this.zone,
      this.tax,
      this.ownerFirstName,
      this.ownerLastName,
      this.ownerEmail,
      this.verified,
      this.sId,
      this.ownerPhoneNumber,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.products,
      this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    password = json['password'];
    restaurantName = json['restaurantName'];
    restaurantLogo = json['restaurantLogo'];
    restaurantCoverImage = json['restaurantCoverImage'];
    restaurantDescription = json['restaurantDescription'];
    minDeliveryTime = json['minDeliveryTime'];
    maxDeliveryTime = json['maxDeliveryTime'];
    timeStamp = json['timeStamp'];
    cuisine = json['cuisine'];
    zone = json['zone'];
    tax = json['tax'];
    ownerFirstName = json['owner_FirstName'];
    ownerLastName = json['owner_LastName'];
    ownerEmail = json['owner_email'];
    verified = json['verified'];
    sId = json['_id'];
    ownerPhoneNumber = json['owner_PhoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['password'] = password;
    data['restaurantName'] = restaurantName;
    data['restaurantLogo'] = restaurantLogo;
    data['restaurantCoverImage'] = restaurantCoverImage;
    data['restaurantDescription'] = restaurantDescription;
    data['minDeliveryTime'] = minDeliveryTime;
    data['maxDeliveryTime'] = maxDeliveryTime;
    data['timeStamp'] = timeStamp;
    data['cuisine'] = cuisine;
    data['zone'] = zone;
    data['tax'] = tax;
    data['owner_FirstName'] = ownerFirstName;
    data['owner_LastName'] = ownerLastName;
    data['owner_email'] = ownerEmail;
    data['verified'] = verified;
    data['_id'] = sId;
    data['owner_PhoneNumber'] = ownerPhoneNumber;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Geometry {
  String? type;

  Geometry({this.type});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    return data;
  }
}

class Products {
  String? name;
  int? price;
  bool? favourite;
  bool? featureProduct;
  String? sId;
  String? restaurantId;
  String? type;
  String? category;
  String? description;
  String? subCategory;
  String? brand;
  String? productPhoto;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products(
      {this.name,
      this.price,
      this.favourite,
      this.featureProduct,
      this.sId,
      this.restaurantId,
      this.type,
      this.category,
      this.description,
      this.subCategory,
      this.brand,
      this.productPhoto,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    favourite = json['favourite'];
    featureProduct = json['featureProduct'];
    sId = json['_id'];
    restaurantId = json['restaurantId'];
    type = json['type'];
    category = json['category'];
    description = json['description'];
    subCategory = json['subCategory'];
    brand = json['brand'];
    productPhoto = json['productPhoto'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['favourite'] = favourite;
    data['featureProduct'] = featureProduct;
    data['_id'] = sId;
    data['restaurantId'] = restaurantId;
    data['type'] = type;
    data['category'] = category;
    data['description'] = description;
    data['subCategory'] = subCategory;
    data['brand'] = brand;
    data['productPhoto'] = productPhoto;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Categories {
  String? brand;
  List<String>? category;
  String? sId;
  String? restaurantId;
  String? categoryPhoto;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Categories(
      {this.brand,
      this.category,
      this.sId,
      this.restaurantId,
      this.categoryPhoto,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    category = json['category'].cast<String>();
    sId = json['_id'];
    restaurantId = json['restaurantId'];
    categoryPhoto = json['categoryPhoto'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['category'] = category;
    data['_id'] = sId;
    data['restaurantId'] = restaurantId;
    data['categoryPhoto'] = categoryPhoto;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
