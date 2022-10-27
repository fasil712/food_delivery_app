import 'dart:convert';

import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utilities/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  void addToCartList(List<CartModel> cartList) {
    cart = [];
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    cartList.forEach((element) => cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(ApiConstants.CART_LIST, cart);
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(ApiConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(ApiConstants.CART_LIST)!;
    }
    List<CartModel> cartList = [];

    carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));
    return cartList;
  }
}
