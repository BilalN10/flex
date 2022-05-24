import 'package:flex/utils/size_config.dart';
import 'package:flutter/material.dart';

class HorizontalIndicator extends StatelessWidget {
  const HorizontalIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 7, width: 20 * SizeConfig.widthMultiplier, color: Colors.black);
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.isDone,
  }) : super(key: key);
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 8 * SizeConfig.heightMultiplier,
        width: 8 * SizeConfig.widthMultiplier,
        decoration:
            const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: Center(
          child: isDone
              ? const Icon(Icons.done, color: Colors.white)
              : const SizedBox(),
        ));
  }
}
