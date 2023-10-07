import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sh7i7a/controllers/settings_controller.dart';
import 'package:sh7i7a/utils.dart';
import 'package:sh7i7a/widgets/text_input.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
        builder: (context, settingsController, child) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Transform.rotate(
                          angle: pi,
                          child: SvgPicture.asset(
                            getIcon('arrow'),
                            width: 18,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        // color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Maximum ammount to spend per day:'),
              DinarInput(
                hintText: 'Ammount',
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  const Text(
                      'Enable ads blocking after\npassing the maximum ammount'),
                  const Spacer(),
                  Switch(
                      value: settingsController.adBlocker,
                      onChanged: (value) {
                        setState(() {
                          settingsController.changeAd(value);
                        });
                      }),
                ],
              ),
            ]),
          ),
        ),
      );
    });
  }
}
