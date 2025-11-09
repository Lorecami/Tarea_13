import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class RecursosMovilesPage extends StatefulWidget {
  const RecursosMovilesPage({super.key});

  @override
  State<RecursosMovilesPage> createState() => _RecursosMovilesPageState();
}

class _RecursosMovilesPageState extends State<RecursosMovilesPage> {
  String? codigoQR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recursos Móviles'),
        backgroundColor: const Color(0xFF7AC3EE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              '📱 Escanea un código QR',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 🧭 Escáner de QR
            Container(
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent, width: 3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: MobileScanner(
                onDetect: (barcode) {
                  if (barcode.barcodes.isNotEmpty) {
                    final String? valor = barcode.barcodes.first.rawValue;
                    setState(() {
                      codigoQR = valor ?? 'Código no detectado';
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 30),

            if (codigoQR != null)
              Card(
                color: Colors.pink.shade50,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ListTile(
                  title: const Text(
                    'Código detectado:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(codigoQR!),
                  trailing: const Icon(Icons.check_circle, color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
