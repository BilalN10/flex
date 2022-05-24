import 'package:flex/constants/icons.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/views/root/tabs/leads/leads_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingTab extends StatelessWidget {
  const PendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No reponses',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 2 * SizeConfig.heightMultiplier,
        ),
        Image.asset(
          pending,
          height: 8 * SizeConfig.heightMultiplier,
          color: Colors.black,
        ),
        SizedBox(height: 2 * SizeConfig.heightMultiplier),
        SizedBox(
          width: 80 * SizeConfig.widthMultiplier,
          child: Text(
            "You haven't respond to any customers yet. When you do, you'll able to contact and access their details here.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
        TextButton(
            onPressed: () {
              Get.to(() => const LeadsPage());
            },
            child: Text(
              'View leads',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.black,
                  ),
            ))
      ],
    );
  }
}
