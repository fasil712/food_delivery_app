import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_conroller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductConroller>().getPopularProductList();
    await Get.find<RecommendedProductConroller>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getSignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ScaleTransition(
            scale: animation,
            child: const Center(
                child: Image(
              image: AssetImage("assets/image/logo part 1.png"),
            ))),
        const Center(
            child: Image(
          image: AssetImage("assets/image/logo part 2.png"),
        )),
      ]),
    );
  }
}


