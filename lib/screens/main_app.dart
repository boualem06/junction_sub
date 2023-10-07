import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/controllers/nav_bar_controller.dart';
import 'package:dinar/utils.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
        builder: (context, navBarController, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: navBarController.selectedIndex != 0 ? white : blue,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(child: navBarController.selectedNav!),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        navBarController.navigateTo(
                          navBarController.navs[0],
                          0,
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 30 / 4,
                        child: Center(
                          child: SvgPicture.asset(
                            getIcon(navBarController.selectedIndex == 0
                                ? 'home1'
                                : 'home0'),
                            color: navBarController.selectedIndex == 0
                                ? white
                                : blue,
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navBarController.navigateTo(
                          navBarController.navs[1],
                          1,
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 30 / 4,
                        child: Center(
                          child: SvgPicture.asset(
                            getIcon(navBarController.selectedIndex != 1
                                ? 'goal0'
                                : 'goals1'),
                            color: navBarController.selectedIndex == 1
                                ? blue
                                : navBarController.selectedIndex == 0
                                    ? white
                                    : blue,
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        navBarController.navigateTo(
                          navBarController.navs[3],
                          3,
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 30 / 4,
                        child: Center(
                          child: SvgPicture.asset(
                            getIcon(navBarController.selectedIndex == 3
                                ? 'stats1'
                                : 'stats0'),
                            color: navBarController.selectedIndex == 0
                                ? white
                                : blue,
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navBarController.navigateTo(
                          navBarController.navs[4],
                          4,
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4 - 30 / 4,
                        child: Center(
                          child: Icon(
                            Icons.account_box_rounded,
                            color: navBarController.selectedIndex != 0
                                ? blue
                                : white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 30,
              bottom: 40,
              child: InkWell(
                onTap: () {
                  navBarController.navigateTo(
                    navBarController.navs[2],
                    2,
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
