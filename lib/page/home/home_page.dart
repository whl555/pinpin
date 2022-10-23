import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin/app/assets/name.dart';
import 'package:pinpin/app/route/route_name.dart';
import 'package:pinpin/app/theme/app_theme.dart';
import 'package:pinpin/component/bottom_tab_bar/bottom_tab_bar.dart';
import 'package:pinpin/component/stateful_button/hold_active_button.dart';
import 'package:pinpin/component/widget_extensions/ext.dart';
import 'package:pinpin/manager/account_manager/account_manager.dart';
import 'package:pinpin/page/home/main/controller.dart';
import 'package:pinpin/page/home/main/home_main.dart';
import 'package:pinpin/page/home/person/controller.dart';
import 'package:pinpin/page/home/person/home_person.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabBarIndex = 0;

  @override
  void initState() {
    super.initState();
    Get.put(PPHomeMainController());
    Get.lazyPut(() => PPHomePersonController());
  }

  @override
  Widget build(BuildContext context) {
    const add = Padding(
      padding: EdgeInsets.only(top: 5),
      child: SizedBox(
        height: 50,
        width: 54,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blueAccent,
            boxShadow: [
              BoxShadow(
                color: Color(0x5882B1FF),
                spreadRadius: 6,
                blurRadius: 10,
                offset: Offset(1, 5),
              )
            ],
          ),
          child: FittedBox(
            child: Icon(Icons.add, color: AppTheme.gray100),
          ),
        ),
      ),
    );

    final bottomBar = PPBottomTabBar(
      children: [
        HoldActiveButton(
          onPressed: () => setState(() => tabBarIndex = 0),
          builder: (_) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 3.5),
                child: Image.asset(
                  tabBarIndex == 0 ? AppAssets.home_active : AppAssets.home,
                  height: 30,
                ),
              ),
              const Text('Home', style: AppTheme.headline7),
            ],
          ),
        ),
        HoldActiveButton(
          onPressed: () => Get.toNamed(RN.post),
          builder: (_) => add,
        ),
        HoldActiveButton(
          onPressed: () {
            if (Get.find<AccountManager>().isEmpty) {
              Get.toNamed(RN.login);
              return;
            }

            setState(() => tabBarIndex = 1);
          },
          builder: (_) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 3.5),
                child: Image.asset(
                  tabBarIndex == 1 ? AppAssets.person_active : AppAssets.person,
                  height: 30,
                ),
              ),
              const Text('Person', style: AppTheme.headline7),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      body: IndexedStack(
        index: tabBarIndex,
        children: const [
          PPHomeMainView(),
          PPHomePersonView(),
        ],
      ).overlay(Align(
        alignment: Alignment.bottomCenter,
        child: bottomBar,
      )),
    );
  }
}
