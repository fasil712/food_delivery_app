import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/utilities/colors.dart';

class PopularProductConroller extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductConroller({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartConroller _cartConroller;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).productModel);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel productModel, CartConroller cartConroller) {
    _quantity = 0;
    _inCartItems = 0;
    _cartConroller = cartConroller;
    var exist = false;
    exist = cartConroller.exitInCart(productModel);
    if (exist) {
      _inCartItems = _cartConroller.getQuantity(productModel);
    }
  }

  void addItem(ProductModel productModel) {
    _cartConroller.addItem(productModel, _quantity);
    _quantity = 0;
    _inCartItems = _cartConroller.getQuantity(productModel);
    _cartConroller.items.forEach((key, value) {});
    update();
  }

  int get totalItems {
    return _cartConroller.totalItems;
  }

  List<CartModel> get getItems {
    return _cartConroller.getItems;
  }
}
