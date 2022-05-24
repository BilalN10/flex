import 'package:flex/constants/colors.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.isApplytransparent = false,
    this.isExpanded = false,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool isApplytransparent;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 8 * SizeConfig.heightMultiplier,
        width: isExpanded
            ? 90 * SizeConfig.widthMultiplier
            : 40 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: isApplytransparent ? lightPinkColor : blackColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: blackColor)),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: isApplytransparent ? blackColor : whiteColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
