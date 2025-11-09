import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';

class GPSPage extends StatefulWidget {
  const GPSPage({super.key});

  @override
  State<GPSPage> createState() => _GPSPageState();
}

class _GPSPageState extends State<GPSPage> {
  GoogleMapController? mapController;
  LatLng? _posicionActual;
  String _direccion = 'Obteniendo dirección...';
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _obtenerUbicacion();
  }

  Future<void> _obtenerUbicacion() async {
    // 🔐 Pedir permiso de ubicación
    var status = await Permission.location.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permiso de ubicación denegado')),
      );
      return;
    }

    // 📡 Obtener ubicación actual
    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // 🗺️ Convertir coordenadas a dirección
    List<Placemark> lugares = await placemarkFromCoordinates(
      pos.latitude,
      pos.longitude,
    );
    Placemark lugar = lugares.first;

    String direccionCompleta =
        '${lugar.locality ?? ''}, ${lugar.subLocality ?? ''}, ${lugar.street ?? ''}';

    setState(() {
      _posicionActual = LatLng(pos.latitude, pos.longitude);
      _direccion = direccionCompleta.isNotEmpty
          ? direccionCompleta
          : 'Dirección no disponible';
      _cargando = false;
    });

    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(_posicionActual!, 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación Actual'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _posicionActual!,
                    zoom: 16,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (controller) {
                    mapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId('actual'),
                      position: _posicionActual!,
                      infoWindow: const InfoWindow(title: 'Estás aquí'),
                    ),
                  },
                ),
                // 🏙️ Tarjeta con la dirección
                Positioned(
                  top: 20,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.pinkAccent),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _direccion,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
