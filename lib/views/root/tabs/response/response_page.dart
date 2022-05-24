import 'package:flex/constants/colors.dart';
import 'package:flex/utils/size_config.dart';
import 'package:flex/views/root/tabs/response/tabs/hired_tab.dart';
import 'package:flex/views/root/tabs/response/tabs/view_all.dart';
import 'package:flutter/material.dart';

import 'tabs/pending_tab.dart';

class ResponsePage extends StatefulWidget {
  const ResponsePage({Key? key}) : super(key: key);

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const PendingTab(),
    const HiredTab(),
    const ViewAllTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPinkColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5 * SizeConfig.heightMultiplier),
            //here is the search and filter button
            SizedBox(
                width: 100 * SizeConfig.widthMultiplier,
                // height: 6 * SizeConfig.heightMultiplier,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    homeTabs('Pending', 0, context),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    homeTabs('Hired', 1, context),
                    SizedBox(width: 2 * SizeConfig.widthMultiplier),
                    homeTabs('View All', 2, context),
                  ],
                )),
            Expanded(child: _pages[selectedIndex]),
          ],
        ),
      ),
    );
  }

  Widget homeTabs(String text, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
          height: 5.5 * SizeConfig.heightMultiplier,
          width: 28 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
            color: index == selectedIndex ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: index == selectedIndex ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
