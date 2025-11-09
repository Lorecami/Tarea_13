import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RecursosMovilesPage extends StatefulWidget {
  const RecursosMovilesPage({super.key});

  @override
  State<RecursosMovilesPage> createState() => _RecursosMovilesPageState();
}

class _RecursosMovilesPageState extends State<RecursosMovilesPage> {
  Position? _posicion;

  Future<void> _obtenerUbicacion() async {
    bool habilitado = await Geolocator.isLocationServiceEnabled();
    if (!habilitado) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor activa el GPS')),
      );
      return;
    }

    LocationPermission permiso = await Geolocator.checkPermission();
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
    }

    if (permiso == LocationPermission.deniedForever ||
        permiso == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay permisos de ubicación')),
      );
      return;
    }

    Position posicion = await Geolocator.getCurrentPosition();
    setState(() => _posicion = posicion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recursos Móviles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Obtener ubicación del dispositivo'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _obtenerUbicacion,
              child: const Text('Obtener ubicación'),
            ),
            if (_posicion != null) ...[
              const SizedBox(height: 10),
              Text(
                'Latitud: ${_posicion!.latitude}\nLongitud: ${_posicion!.longitude}',
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
