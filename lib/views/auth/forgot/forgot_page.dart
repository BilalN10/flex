import 'package:flex/constants/colors.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/widgets/auth_button.dart';
import 'package:flex/widgets/back_button.dart';
import 'package:flex/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircularButton(),
                        SizedBox(height: 3 * SizeConfig.heightMultiplier),
                        // const Spacer(),
                        Text(
                          'Enter your email\nto recover account.',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3 * SizeConfig.heightMultiplier),
                        MyTextField(
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (val) {
                              return;
                            }),
                        SizedBox(height: 3 * SizeConfig.heightMultiplier),
                        AuthButton(
                          isExpanded: true,
                          onTap: () {},
                          text: 'Submit',
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
