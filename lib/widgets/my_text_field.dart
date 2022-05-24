import 'package:flex/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    required this.controller,
    this.isObsure = false,
    required this.validator,
  }) : super(key: key);
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final bool isObsure;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 8 * SizeConfig.heightMultiplier,
        width: 90 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: isObsure,
            controller: controller,
            keyboardType: textInputType,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ));
  }
}
