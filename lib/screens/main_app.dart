import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/controllers/nav_bar_controller.dart';
import 'package:sh7i7a/utils.dart';

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
                            getIcon(navBarController.icons[0]),
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
                            getIcon(navBarController.icons[1]),
                            color: navBarController.selectedIndex == 0
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
                            getIcon(navBarController.icons[3]),
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
                          child: SvgPicture.asset(
                            getIcon(navBarController.icons[4]),
                            color: navBarController.selectedIndex == 0
                                ? white
                                : blue,
                            width: 25,
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
                  child: Center(
                    child: SvgPicture.asset(
                      getIcon(navBarController.icons[4]),
                      color: navBarController.selectedIndex == 0 ? white : blue,
                      width: 25,
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
