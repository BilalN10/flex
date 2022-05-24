import 'package:flex/constants/colors.dart';
import 'package:flex/constants/icons.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/views/auth/forgot/forgot_page.dart';
import 'package:flex/views/auth/sign_up/signup_page1.dart';
import 'package:flex/views/root/root_page.dart';
import 'package:flex/widgets/auth_button.dart';
import 'package:flex/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPinkColor,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              //Here is the logo of app
              Container(
                height: 12 * SizeConfig.heightMultiplier,
                width: 25 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(logo),
                ),
              ),
              SizedBox(height: 5 * SizeConfig.heightMultiplier),
              //login text
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Login to',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: blackColor, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' beUpToDate',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: const Color(0xff0742FA),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1 * SizeConfig.heightMultiplier),
              Text('Trailer info at a glance',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: blackColor)),
              SizedBox(height: 9 * SizeConfig.heightMultiplier),
              //TextField of email
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
                validator: (val) {
                  return;
                },
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              MyTextField(
                isObsure: true,
                controller: passwordController,
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                validator: (val) {
                  return;
                },
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButton(
                    onTap: () {
                      Get.to(() => const SignUpPage1());
                    },
                    text: 'Sign Up',
                    isApplytransparent: true,
                  ),
                  SizedBox(width: 2 * SizeConfig.heightMultiplier),
                  AuthButton(
                    onTap: () {
                      Get.offAll(() => const RootPage());
                    },
                    text: 'Login',
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(() => ForgotPassword());
                },
                child: Text('Forgot your password or username?',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: blackColor, fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
