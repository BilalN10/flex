import 'package:flex/constants/colors.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/views/auth/sign_up/signup_page3.dart';
import 'package:flex/views/auth/sign_up/widget/indicator.dart';
import 'package:flex/widgets/auth_button.dart';
import 'package:flex/widgets/back_button.dart';
import 'package:flex/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage2 extends StatefulWidget {
  const SignUpPage2({Key? key}) : super(key: key);

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  List<String> distance = [
    '5 miles',
    '10 miles',
    '20 miles',
    '30 miles',
    '50 miles'
  ]; // Option 2
  String? selectedDistance; // Option 2
  final TextEditingController addressController = TextEditingController();
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
                            isDone: false,
                          ),
                        ]),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Text(
                      'Where would you like to see leads from',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Text(
                      'Tell us the area you cover so we can show you leads for your location',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Service customers within',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    DropdownButton(
                      isExpanded: true,
                      hint: const Text(
                          'Please choose distance'), // Not necessary for Option 1
                      value: selectedDistance,
                      onChanged: (newValue) {
                        setState(() {
                          selectedDistance = newValue as String;
                        });
                      },
                      items: distance.map((location) {
                        return DropdownMenuItem(
                          child: Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                    MyTextField(
                        hintText: 'Address',
                        textInputType: TextInputType.name,
                        controller: addressController,
                        validator: (val) {
                          return;
                        }),
                    SizedBox(height: 5 * SizeConfig.heightMultiplier),
                    AuthButton(
                      onTap: () {
                        Get.to(() => SignUpPage3());
                      },
                      text: 'Next',
                      isExpanded: true,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
