import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilities/colors.dart';
import 'package:food_delivery_app/utilities/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: Dimensions.font26,
      ),
      SizedBox(height: Dimensions.height10),
      Row(
        children: [
          Wrap(
            children: List.generate(
                5,
                (index) => const Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: 15,
                    )),
          ),
          const SizedBox(height: 10),
          SmallText(text: "4.5"),
          const SizedBox(height: 10),
          SmallText(text: "1287"),
          const SizedBox(height: 10),
          SmallText(text: "comments")
        ],
      ),
      SizedBox(height: Dimensions.height20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1),
          IconAndTextWidget(
              icon: Icons.location_city,
              text: "1.7km",
              iconColor: AppColors.mainColor),
          IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "32min",
              iconColor: AppColors.iconColor2)
        ],
      )
    ]);
  }
}
