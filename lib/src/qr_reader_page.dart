import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:menudrawer/src/doctor.dart';

class QRReaderPage extends StatefulWidget {
  const QRReaderPage({super.key});

  @override
  State<QRReaderPage> createState() => _QRReaderPageState();
}

class _QRReaderPageState extends State<QRReaderPage> {
  bool detectado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear QR del Médico')),
      body: MobileScanner(
        onDetect: (capture) {
          if (detectado) return; // evita múltiples detecciones
          detectado = true;

          final barcode = capture.barcodes.first;
          final data = barcode.rawValue ?? '';

          final doctor = Doctor.fromQRData(data);
          Navigator.pop(context, doctor);
        },
      ),
    );
  }
}
