import 'dart:ffi';
import 'dart:math';

import 'package:dinar/controllers/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:dinar/colors.dart';
import 'package:dinar/widgets/text_button.dart';
import 'package:dinar/widgets/text_input.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Transform.rotate(
              angle: pi / 2,
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 40.0,
              ),
            ),
          ),
          title: const Text('Transaction'),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    SizedBox(height: 5.0),
                    Text(
                      'Ahmed Ziyani',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text('+213 (0) 550 123 456'),
                    SizedBox(height: 3.0),
                    Text('Hydra, Algiers'),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 35.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: const Color(0x243142BA),
                      ),
                      child: Column(
                        children: [
                          DinarInput(
                            hintText: '',
                            decorations: const InputDecoration(
                              errorText: null,
                              filled: true,
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: grey,
                                fontSize: 22.0,
                                letterSpacing: 1,
                              ),
                              hintTextDirection: TextDirection.ltr,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 20, 20, 20),
                            ),
                            textSize: 30,
                            textColor: blue,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            'Amount in DZD',
                            style: TextStyle(
                              color: blue,
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Column(
                      children: [
                        Text('Transaction ID'),
                        Text(
                          'DZ98142F1248',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DinarButton(
                        width: 120,
                        height: 45,
                        label: 'CANCEL',
                        onPressed: () {
                          // Provider.of<NavBarController>(context).navigateTo(
                          //     Provider.of<NavBarController>(context).navs[0],
                          //     0);
                          Navigator.pop(context);
                        },
                      ),
                      DinarButton(
                        width: 120,
                        height: 45,
                        label: 'PAY',
                        onPressed: () async {
                          // Provider.of<NavBarController>(context).navigateTo(
                          //     Provider.of<NavBarController>(context).navs[0],
                          //     0);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GameScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..runJavaScript("if (isPlaying == true) {}")
      ..setBackgroundColor(blue)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://technosoft.dev/mobile/'));
    super.initState();
  }

// @override
//   void initState() {
//     // TODO: implement initState

//     late
//  final PlatformWebViewControllerCreationParams params;
//  if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//   params = WebKitWebViewControllerCreationParams(
//     allowsInlineMediaPlayback: true,
//     mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//   );
// }
//  {
//   params = const PlatformWebViewControllerCreationParams();
// }
// final WebViewController controller =
//     WebViewController.fromPlatformCreationParams(params);

//  (controller.platform is AndroidWebViewController) {
//   AndroidWebViewController.enableDebugging(true);
//   (controller.platform as AndroidWebViewController)
//       .setMediaPlaybackRequiresUserGesture(false);
//     super.initState();
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
