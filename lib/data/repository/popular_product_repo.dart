import 'package:get/get.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utilities/api_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(ApiConstants.POPULAR_PRODUCT_URI);
  }
}
