import 'dart:async';

import 'package:flex/constants/images.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/views/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: Container(
            height: 100 * SizeConfig.heightMultiplier,
            width: 100 * SizeConfig.widthMultiplier,
            decoration: const BoxDecoration(
              color: Colors.white,
              image:
                  DecorationImage(image: AssetImage(splash), fit: BoxFit.cover),
            ),
          ),
        ));
  }
}
