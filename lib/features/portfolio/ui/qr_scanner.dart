import 'dart:convert';
import 'dart:io';

import 'package:cointracker/features/scanned_portfolio/scanned_portfolio_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  static const String routeID = '/qr_scanner';

  const QRScanner({Key? key}) : super(key: key);

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode _barcodeResult;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      _barcodeResult = scanData;

      controller.pauseCamera();

      if (_barcodeResult.code != null && _barcodeResult.code!.isNotEmpty) {
        dynamic _decodedBarcodeResult = jsonDecode(_barcodeResult.code!);

        if (_decodedBarcodeResult is List &&
            _decodedBarcodeResult[0] != null &&
            _decodedBarcodeResult[0] is String &&
            _decodedBarcodeResult[1] != null &&
            _decodedBarcodeResult[1] is Map) {
          Navigator.pushNamed(context, ScannedPortfolioPage.routeID,
              arguments: _decodedBarcodeResult);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(
                const SnackBar(
                  content: Text('QR format is incorrect'),
                  backgroundColor: Colors.redAccent,
                ),
              )
              .closed
              .then((value) {
            controller.resumeCamera();
          });
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              const SnackBar(
                content: Text('QR format is incorrect'),
                backgroundColor: Colors.redAccent,
              ),
            )
            .closed
            .then((value) {
          controller.resumeCamera();
        });
      }
    });
  }
}
