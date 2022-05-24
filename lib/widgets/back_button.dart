import 'package:flex/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          height: 10 * SizeConfig.heightMultiplier,
          width: 10 * SizeConfig.widthMultiplier,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
          child: Center(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.adaptive.arrow_back,
                color: Colors.black,
              ),
            ),
          )),
    );
  }
}
