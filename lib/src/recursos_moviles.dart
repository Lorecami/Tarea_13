import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class RecursosMovilesPage extends StatefulWidget {
  const RecursosMovilesPage({super.key});

  @override
  State<RecursosMovilesPage> createState() => _RecursosMovilesPageState();
}

class _RecursosMovilesPageState extends State<RecursosMovilesPage> {
  String _resultadoQR = 'Ningún código escaneado aún';
  String _ubicacion = 'Ubicación no disponible';

  Future<void> _pedirPermisos() async {
    await Permission.camera.request();
    await Permission.location.request();
  }

  Future<void> _obtenerUbicacion() async {
    final permiso = await Geolocator.requestPermission();
    if (permiso == LocationPermission.denied) {
      setState(() => _ubicacion = 'Permiso de ubicación denegado');
      return;
    }

    final posicion = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _ubicacion =
          'Latitud: ${posicion.latitude.toStringAsFixed(4)}, Longitud: ${posicion.longitude.toStringAsFixed(4)}';
    });
  }

  void _escanearQR() {
    showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Escanear QR / Código de Barras')),
          body: MobileScanner(
            onDetect: (capture) {
              final codigo = capture.barcodes.first.rawValue ?? 'No detectado';
              setState(() => _resultadoQR = codigo);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _pedirPermisos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recursos Móviles')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Acceso a Hardware del Dispositivo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _escanearQR,
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Escanear QR o Código de Barras'),
            ),
            const SizedBox(height: 10),
            Text('Resultado: $_resultadoQR',
                style: const TextStyle(color: Colors.blueGrey)),
            const Divider(height: 30),
            ElevatedButton.icon(
              onPressed: _obtenerUbicacion,
              icon: const Icon(Icons.location_on),
              label: const Text('Obtener ubicación GPS'),
            ),
            const SizedBox(height: 10),
            Text('Ubicación: $_ubicacion',
                style: const TextStyle(color: Colors.blueGrey)),
          ],
        ),
      ),
    );
  }
}
