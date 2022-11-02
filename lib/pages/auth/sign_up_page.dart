import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilities/colors.dart';
import 'package:food_delivery_app/utilities/dimensions.dart';
import 'package:food_delivery_app/widgets/app_textfield.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["twitter.png", "facebook.png", "gmail.png"];
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
          //Name
          AppTextField(
              textConroller: nameController,
              hintText: "Name",
              icon: Icons.person),
          SizedBox(
            height: Dimensions.height20,
          ),
          //Phone
          AppTextField(
              textConroller: phoneController,
              hintText: "Phone",
              icon: Icons.phone),
          SizedBox(
            height: Dimensions.height20 + Dimensions.height20,
          ),
          Container(
            width: Dimensions.screenWidth / 2,
            height: Dimensions.screenHeight / 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor),
            child: Center(
              child: BigText(
                text: "Sign Up",
                size: Dimensions.font20 + Dimensions.font20 / 2,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.font20))),
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          RichText(
              text: TextSpan(
            text: "Sign up using one of the following methods",
            style:
                TextStyle(color: Colors.grey[500], fontSize: Dimensions.font16),
          )),
          Wrap(
            children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                        radius: Dimensions.radius30,
                        backgroundImage:
                            AssetImage("assets/image/${signUpImages[index]}"),
                      ),
                )),
          )
        ]),
      ),
    );
  }
}
