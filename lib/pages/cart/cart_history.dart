import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/utilities/app_constants.dart';
import 'package:food_delivery_app/utilities/colors.dart';
import 'package:food_delivery_app/utilities/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartConroller>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();
    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();
    var listCounter = 0;

    return Scaffold(
        body: Column(
      children: [
        Container(
          color: AppColors.mainColor,
          width: double.maxFinite,
          height: Dimensions.height10*10,
          padding: EdgeInsets.only(top: Dimensions.height45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(
                text: "Cart History",
                color: Colors.white,
              ),
              const AppIcon(
                icon: Icons.shopping_cart_outlined,
                iconcolor: AppColors.mainColor,
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  for (int i = 0; i < itemsPerOrder.length; i++)
                    Container(
                      height: Dimensions.height30*4,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: getCartHistoryList[listCounter].time!),
                          // (() {
                          //   DateTime parseDate =
                          //       DateFormat("yyyy-mm-dd HH:mm:ss").parse(
                          //           getCartHistoryList[listCounter].time!);
                          //   var inputDate =
                          //       DateTime.parse(parseDate.toString());
                          //   var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
                          //   var outputDate = outputFormat.format(inputDate);
                          //   return BigText(
                          //       text: outputDate);
                          // }()),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children:
                                    List.generate(itemsPerOrder[i], (index) {
                                  if (listCounter < getCartHistoryList.length) {
                                    listCounter++;
                                  }
                                  return index <= 2
                                      ? Container(
                                          height: Dimensions.height20*4,
                                          width: Dimensions.height20*4,
                                          margin: EdgeInsets.only(
                                              right: Dimensions.width10 / 2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_URL +
                                                          getCartHistoryList[
                                                                  listCounter -
                                                                      1]
                                                              .img!))),
                                        )
                                      : Container();
                                }),
                              ),
                              Container(
                                height: Dimensions.height20*4,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(text: "Total"),
                                      BigText(
                                        text: "${itemsPerOrder[i]} Items",
                                        color: AppColors.titleColor,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.width10,
                                            vertical: Dimensions.height10 / 2),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15 / 3),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.mainColor)),
                                        child: SmallText(
                                          text: "one more",
                                          color: AppColors.mainColor,
                                        ),
                                      )
                                    ]),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
