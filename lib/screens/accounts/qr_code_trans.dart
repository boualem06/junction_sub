import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sh7i7a/colors.dart';
import 'package:sh7i7a/screens/accounts/payment_screen.dart';
import 'package:sh7i7a/utils.dart';
import 'package:sh7i7a/widgets/text_button.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  bool _sendMoney = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
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
                      'Accounts',
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
              const Text(
                'Transit your money safely',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: 400,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                ),
                child: _sendMoney ? const ScanQRCode() : const ShowQRCode(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DinarButton(
                    width: 130,
                    onPressed: () {
                      setState(() {
                        _sendMoney = true;
                      });
                    },
                    label: 'Scan QR Code',
                    color: _sendMoney ? blue : grey,
                  ),
                  DinarButton(
                    width: 130,
                    onPressed: () {
                      setState(() {
                        _sendMoney = false;
                      });
                    },
                    label: 'Show QR Code',
                    color: !_sendMoney ? blue : grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  final qrCode = GlobalKey(debugLabel: "qrCode");

  Barcode? barCode;

  late QRViewController qrController;

  @override
  void dispose() {
    super.dispose();
    qrController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              QRView(
                key: qrCode,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.yellow,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 5,
                ),
                onQRViewCreated: (qrController) {
                  setState(() {
                    this.qrController = qrController;
                  });
                  qrController.scannedDataStream.listen(
                    (barCode) {
                      setState(() {
                        this.barCode = barCode;
                      });

                      final qrData = barCode.code;
                      // setState(() {
                      //   qrController.dispose();
                      // });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowQRCode extends StatelessWidget {
  const ShowQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: 'AccountId',
        padding: const EdgeInsets.all(35),
      ),
    );
  }
}
