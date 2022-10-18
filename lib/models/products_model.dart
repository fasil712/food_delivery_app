class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _productModel;
  List<ProductModel> get productModel => _productModel;
  Product(
      {required totalSize,
      required typeId,
      required offset,
      required productModel}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _productModel = productModel;
  }
  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json["totalSize"];
    _typeId = json["typeId"];
    _offset = json["offset"];
    if (json['productModel'] != null) {
      _productModel = <ProductModel>[];
      json['productModel'].forEach((v) {
        _productModel.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? desc;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    typeId = json['typeId'];
  }
}
