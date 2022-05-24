import 'package:flex/constants/colors.dart';
import 'package:flex/views/root/tabs/leads/leads_page.dart';
import 'package:flex/views/root/tabs/response/response_page.dart';
import 'package:flex/views/root/tabs/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentTab = 0;
  final List<Widget> screens = [
    const LeadsPage(),
    const ResponsePage(),
    const SettingsPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const ResponsePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blackColor,
        onPressed: () {
          Get.to(() => const LeadsPage());
        },
        child: const Icon(Icons.leaderboard_sharp),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 16,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const ResponsePage();
                    currentTab = 0;
                  });
                },
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 3,
                        width: 20,
                        color: currentTab == 0
                            ? Colors.black
                            : Colors.transparent),
                    const SizedBox(height: 10),
                    Icon(
                      Icons.home_repair_service,
                      color: currentTab == 0 ? Colors.black : Colors.grey,
                    ),
                    Text('Responses',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color:
                                currentTab == 0 ? Colors.black : Colors.grey))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const SettingsPage();
                    currentTab = 2;
                  });
                },
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 3,
                        width: 20,
                        color: currentTab == 2
                            ? Colors.black
                            : Colors.transparent),
                    const SizedBox(height: 10),
                    Icon(
                      Icons.settings,
                      color: currentTab == 2 ? Colors.black : Colors.grey,
                    ),
                    Text('Settings',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color:
                                currentTab == 2 ? Colors.black : Colors.grey))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }
}
