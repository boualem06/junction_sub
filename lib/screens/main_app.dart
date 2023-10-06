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
        backgroundColor: blue,
        body: Column(
          children: [
            Expanded(child: navBarController.selectedNav!),
            Container(
              height: 70,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: white,
                  ),
              // padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  navBarController.icons.length,
                  (index) => InkWell(
                    onTap: () {
                      navBarController.navigateTo(
                          navBarController.navs[index], index);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Center(
                        child: SvgPicture.asset(
                          getIcon(navBarController.icons[index]),
                          color: white,
                          width: 25,
                        ),
                      ),
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
