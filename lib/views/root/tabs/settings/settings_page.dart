import 'package:flex/constants/colors.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/widgets/column_data.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: lightPinkColor,
        body: SizedBox.expand(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 80 * SizeConfig.heightMultiplier,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Profile Settings',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4 * SizeConfig.heightMultiplier),
                    const ColumnData(heading: 'Full Name', text: 'Issa'),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const ColumnData(
                        heading: 'Company Name', text: 'Vitrual Soft'),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const ColumnData(
                        heading: 'Email', text: 'issa1@hotmail.com'),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const ColumnData(
                        heading: 'Website (Optional)',
                        text: 'https/:www.google.com'),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const ColumnData(
                        heading: 'Contact Number', text: '030012345678'),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const ColumnData(heading: 'Service', text: 'Trainer'),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const ColumnData(
                        heading: 'Service Customer within', text: '5 Km'),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const Flexible(
                      child: ColumnData(
                          heading: 'Location',
                          text: 'SadiqAbad, Ghulshan e Usman'),
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
