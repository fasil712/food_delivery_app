// class Product {
//   int? _totalSize;
//   int? _typeId;
//   int? _offset;
//   late List<ProductModel> _productModel;
//   List<ProductModel> get productModel => _productModel;
//   Product(
//       {required totalSize,
//       required typeId,
//       required offset,
//       required productModel}) {
//     _totalSize = totalSize;
//     _typeId = typeId;
//     _offset = offset;
//     _productModel = productModel;
//   }
//   Product.fromJson(Map<String, dynamic> json) {
//     _totalSize = json["totalSize"];
//     _typeId = json["typeId"];
//     _offset = json["offset"];
//     if (json['productModel'] != null) {
//       _productModel = <ProductModel>[];
//       json['productModel'].forEach((v) {
//         _productModel.add(ProductModel.fromJson(v));
//       });
//     }
//   }
// }

// class ProductModel {
//   int? id;
//   String? name;
//   String? desc;
//   int? price;
//   int? stars;
//   String? img;
//   String? location;
//   String? createdAt;
//   String? updatedAt;
//   int? typeId;

//   ProductModel({
//     this.id,
//     this.name,
//     this.desc,
//     this.price,
//     this.stars,
//     this.img,
//     this.location,
//     this.createdAt,
//     this.updatedAt,
//     this.typeId,
//   });
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     desc = json['desc'];
//     price = json['price'];
//     stars = json['stars'];
//     img = json['img'];
//     location = json['location'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     typeId = json['typeId'];
//   }
// }

class Product {
  Product({
    required this.totalSize,
    required this.typeId,
    required this.offset,
    required this.products,
  });
  late final int totalSize;
  late final int typeId;
  late final int offset;
  late final List<ProductModel> products;
  List<ProductModel> get productModel => products;

  Product.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    typeId = json['type_id'];
    offset = json['offset'];
    products = List.from(json['products'])
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_size'] = totalSize;
    _data['type_id'] = typeId;
    _data['offset'] = offset;
    _data['products'] = products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.typeId,
  });
  late final int id;
  late final String name;
  late final String description;
  late final int price;
  late final int stars;
  late final String img;
  late final String location;
  late final String createdAt;
  late final String updatedAt;
  late final int typeId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['stars'] = stars;
    _data['img'] = img;
    _data['location'] = location;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['type_id'] = typeId;
    return _data;
  }
}
