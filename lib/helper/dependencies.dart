import 'package:get/get.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_conroller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/utilities/api_constants.dart';

Future<void> init() async {
  //Api
  Get.lazyPut(() => ApiClient(appBaseUrl: ApiConstants.BASE_URL));
  //Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  //Controller
  Get.lazyPut(() => PopularProductConroller(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductConroller(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartConroller(cartRepo: Get.find()));
}
