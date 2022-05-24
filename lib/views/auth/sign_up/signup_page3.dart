import 'package:flex/constants/colors.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/views/auth/sign_up/widget/indicator.dart';
import 'package:flex/widgets/auth_button.dart';
import 'package:flex/widgets/back_button.dart';
import 'package:flex/widgets/my_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage3 extends StatelessWidget {
  SignUpPage3({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightPinkColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 90 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: const BoxDecoration(
                color: lightWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5 * SizeConfig.widthMultiplier,
                    vertical: 4 * SizeConfig.heightMultiplier),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircularButton(),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Indicator(
                              isDone: true,
                            ),
                            HorizontalIndicator(),
                            Indicator(
                              isDone: true,
                            ),
                            HorizontalIndicator(),
                            Indicator(
                              isDone: false,
                            ),
                          ]),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Text(
                        'Finally, just a few details',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Text(
                        "You're one step away from seeing our Gardening leads",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 5 * SizeConfig.heightMultiplier),
                      MyTextField(
                          hintText: 'Full Name',
                          textInputType: TextInputType.name,
                          controller: nameController,
                          validator: (val) {
                            return;
                          }),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      MyTextField(
                          hintText: 'Company Name',
                          textInputType: TextInputType.name,
                          controller: companyController,
                          validator: (val) {
                            return;
                          }),
                      Row(children: [
                        Container(
                          height: 7 * SizeConfig.heightMultiplier,
                          width: 7 * SizeConfig.widthMultiplier,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Center(
                            child: Text('!',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Flexible(
                          child: Text(
                              "If you have not a business or don't have this information, you can leave this blank"),
                        ),
                      ]),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      MyTextField(
                          hintText: 'Email',
                          textInputType: TextInputType.name,
                          controller: emailController,
                          validator: (val) {
                            if (val != null || val == "") {
                              return "";
                            }
                            return null;
                          }),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      MyTextField(
                          hintText: 'Website (optional)',
                          textInputType: TextInputType.name,
                          controller: websiteController,
                          validator: (val) {
                            return;
                          }),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      MyTextField(
                          hintText: 'Phone Number',
                          textInputType: TextInputType.number,
                          controller: phoneNumberController,
                          validator: (val) {
                            return;
                          }),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    'By signing up, you confirm your agreement to your ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: 'Terms of Services',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      SizedBox(height: 5 * SizeConfig.heightMultiplier),
                      AuthButton(
                        onTap: () {},
                        text: 'See leads',
                        isExpanded: true,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
