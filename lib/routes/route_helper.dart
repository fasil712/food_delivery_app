import 'package:food_delivery_app/pages/address/add_address_page.dart';
import 'package:food_delivery_app/pages/address/pick_address_map.dart';
import 'package:food_delivery_app/pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/home/home_page.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String addAddress = "/add-address";
  static const String pickAddressMap = "/pick-address";

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId, String pageName) =>
      '$popularFood?pageId=$pageId&pageName = $pageName';
  static String getRecommendedFood(int pageId, String pageName) =>
      '$recommendedFood?pageId=$pageId&pageName = $pageName';
  static String getCartPage() => cartPage;
  static String getSignInPage() => signIn;
  static String getAddressPage() => addAddress;
  static String getPickAddressPage() => pickAddressMap;

  static List<GetPage> routes = [
    GetPage(
        name: splashPage,
        page: () {
          return const SplashScreen();
        }),
    GetPage(
        name: pickAddressMap,
        page: () {
          PickAddressMap pickAddressMap = Get.arguments;
          return pickAddressMap;
        }),
    GetPage(
        transition: Transition.fade,
        name: initial,
        page: () {
          return const HomePage();
        }),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];
          return PopularFoodDetail(
            pageId: int.parse(pageId!),
            pageName: pageName!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var pageName = Get.parameters['pageName'];
          return RecommendedFoodDetail(
              pageId: int.parse(pageId!), pageName: pageName!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signIn,
        page: () {
          return const SignInPage();
        },
        transition: Transition.fade),
    GetPage(
        name: addAddress,
        page: () {
          return const AddAddressPage();
        },
        transition: Transition.fade),
  ];
}
