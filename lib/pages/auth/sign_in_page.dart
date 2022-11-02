import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/utilities/colors.dart';
import 'package:food_delivery_app/utilities/dimensions.dart';
import 'package:food_delivery_app/widgets/app_textfield.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/image/logo_part_1.png"),
          ),
          Container(
            margin: EdgeInsets.only(left: Dimensions.width20),
            width: double.maxFinite,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Hello",
                style: TextStyle(
                    fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign into your account",
                style: TextStyle(
                    fontSize: Dimensions.font20, color: Colors.grey[500]),
              )
            ]),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          //Email
          AppTextField(
              textConroller: emailController,
              hintText: "Email",
              icon: Icons.email),
          SizedBox(
            height: Dimensions.height20,
          ),
          //Password
          AppTextField(
              textConroller: passwordController,
              hintText: "Password",
              icon: Icons.lock),
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              RichText(
                  text: TextSpan(
                      text: "Sign into your account",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20))),
              SizedBox(
                height: Dimensions.width20,
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          Container(
            width: Dimensions.screenWidth / 2,
            height: Dimensions.screenHeight / 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor),
            child: Center(
              child: BigText(
                text: "Sign In",
                size: Dimensions.font20 + Dimensions.font20 / 2,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          RichText(
              text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.font20),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpPage()),
                    text: " Create",
                    style: TextStyle(
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold))
              ])),
        ]),
      ),
    );
  }
}
