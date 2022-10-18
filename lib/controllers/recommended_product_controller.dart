import 'package:get/get.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';

class RecommendedProductConroller extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductConroller({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).productModel);
      _isLoaded = true;
      update();
    } else {}
  }
}
