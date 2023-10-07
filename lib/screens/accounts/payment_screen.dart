import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/widgets/text_button.dart';
import 'package:sh7i7a/widgets/text_input.dart';

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
                    // MPayIcon(
                    //   radius: 20.0,
                    //   size: 100.0,
                    //   text: initials,
                    // ),
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
                          // Text(
                          //   '${4000}',
                          //   style: TextStyle(
                          //     color: blue,
                          //     fontSize: 38.0,
                          //   ),
                          // ),
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
                          // transController.abandonTransaction();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                      DinarButton(
                        width: 120,
                        height: 45,
                        label: 'PAY',
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);

                          // if (transController.paymentCase ==
                          //     'initPayment') {
                          //   Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => PinScreen(
                          //               pinCase: PinCases.onPut,
                          //               nextScreen: TransactionScreen(
                          //                 qrCodeData: qrCodeData,
                          //                 paymentCase: 'initPayment',
                          //               ),
                          //             )),
                          //   );
                          // } else if (transController.paymentCase ==
                          //     'confirm') {
                          //   transController.confirmTransaction();
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // if (transController.isLoading && paymentCase == 'confirm')
            //   Positioned.fill(
            //     child: Container(
            //       color: Colors.black54.withOpacity(0.1),
            //       child: Center(
            //         child: Container(
            //           padding: const EdgeInsets.all(20.0),
            //           decoration: BoxDecoration(
            //             color: greyish,
            //             borderRadius: BorderRadius.circular(10.0),
            //           ),
            //           child: const Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               CircularProgressIndicator(
            //                 valueColor:
            //                     AlwaysStoppedAnimation<Color>(Colors.red),
            //               ),
            //               SizedBox(width: 20.0),
            //               Flexible(
            //                 child: Text(
            //                   'Validating...',
            //                   style: TextStyle(
            //                     fontSize: 16.0,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // // Show dialog when isLoading and paymentCase == 'initPayment'
            // if (transController.isLoading && paymentCase == 'initPayment')
            //   Positioned.fill(
            //     child: Container(
            //       color: Colors.black54.withOpacity(0.1),
            //       child: Center(
            //         child: Container(
            //           padding: const EdgeInsets.all(20.0),
            //           decoration: BoxDecoration(
            //             color: grey,
            //             borderRadius: BorderRadius.circular(10.0),
            //           ),
            //           child: const Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               CircularProgressIndicator(
            //                 valueColor:
            //                     AlwaysStoppedAnimation<Color>(Colors.red),
            //               ),
            //               SizedBox(width: 20.0),
            //               Flexible(
            //                 child: Text(
            //                   'Filling Payment card Informations...',
            //                   style: TextStyle(
            //                     fontSize: 16.0,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
