import 'package:flex/constants/icons.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flutter/material.dart';

class HiredTab extends StatelessWidget {
  const HiredTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No hires yet?',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        Image.asset(
          hired,
          height: 8 * SizeConfig.heightMultiplier,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        SizedBox(
          width: 80 * SizeConfig.widthMultiplier,
          child: Text(
            "You haven't respond as 'hired' yet. You can choose to request a review from the customer",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
      ],
    );
  }
}
