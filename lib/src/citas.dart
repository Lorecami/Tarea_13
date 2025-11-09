import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'navbar.dart';

class CitasPage extends StatefulWidget {
  const CitasPage({super.key});

  @override
  State<CitasPage> createState() => _CitasPageState();
}

class _CitasPageState extends State<CitasPage> {
  LatLng? _currentPosition;
  String _sector = 'Centro Histórico';
  final TextEditingController _nombrePaciente = TextEditingController();
  GoogleMapController? _mapController;
  bool _loadingLocation = true;

  final List<String> sectores = [
    'Centro Histórico',
    'La Mariscal',
    'La Carolina',
    'Quitumbe',
    'Tumbaco',
    'Cumbayá',
    'Calderón',
    'Guamaní',
    'Conocoto',
    'Carcelén',
  ];

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  /// 🛰️ Obtiene la ubicación actual del usuario
  Future<void> _determinePosition() async {
    setState(() => _loadingLocation = true);
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar si el GPS está activado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, activa el GPS.')),
      );
      setState(() => _loadingLocation = false);
      return;
    }

    // Comprobar permisos
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permiso de ubicación denegado.')),
        );
        setState(() => _loadingLocation = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Permisos de ubicación denegados permanentemente. Actívalos en configuración.')),
      );
      setState(() => _loadingLocation = false);
      return;
    }

    // Obtener posición actual
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _loadingLocation = false;
    });

    // Mover cámara si el mapa ya está creado
    if (_mapController != null && !kIsWeb) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(_currentPosition!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text('Citas Médicas'),
        backgroundColor: const Color(0xFF7AC3EE),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE4E1), Color(0xFFFFC1CC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                constraints: const BoxConstraints(maxWidth: 500),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '🩺 Agendar Nueva Cita',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEC407A),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Campo nombre del paciente
                        TextField(
                          controller: _nombrePaciente,
                          decoration: InputDecoration(
                            labelText: 'Nombre del Paciente',
                            prefixIcon: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Selector de sector
                        DropdownButtonFormField<String>(
                          value: _sector,
                          decoration: InputDecoration(
                            labelText: 'Sector de Quito',
                            prefixIcon: const Icon(Icons.location_city),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          items: sectores
                              .map((s) => DropdownMenuItem(
                                    value: s,
                                    child: Text(s),
                                  ))
                              .toList(),
                          onChanged: (value) => setState(() => _sector = value!),
                        ),
                        const SizedBox(height: 25),

                        // 🗺️ Mapa o indicador de carga
                        if (_loadingLocation)
                          const Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 10),
                              Text("Obteniendo ubicación..."),
                            ],
                          )
                        else if (_currentPosition != null)
                          Column(
                            children: [
                              const Text(
                                '📍 Ubicación actual:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Lat: ${_currentPosition!.latitude.toStringAsFixed(5)}, '
                                'Lng: ${_currentPosition!.longitude.toStringAsFixed(5)}',
                              ),
                              const SizedBox(height: 15),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  height: 220,
                                  child: kIsWeb
                                      ? Image.network(
                                          'https://maps.googleapis.com/maps/api/staticmap?center=${_currentPosition!.latitude},${_currentPosition!.longitude}&zoom=15&size=600x300&markers=color:pink%7C${_currentPosition!.latitude},${_currentPosition!.longitude}&key=TU_API_KEY',
                                          fit: BoxFit.cover,
                                        )
                                      : GoogleMap(
                                          initialCameraPosition: CameraPosition(
                                            target: _currentPosition!,
                                            zoom: 16,
                                          ),
                                          onMapCreated: (controller) =>
                                              _mapController = controller,
                                          markers: {
                                            Marker(
                                              markerId:
                                                  const MarkerId('ubicacion'),
                                              position: _currentPosition!,
                                              infoWindow:
                                                  InfoWindow(title: _sector),
                                            ),
                                          },
                                          myLocationEnabled: true,
                                          myLocationButtonEnabled: true,
                                        ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: _determinePosition,
                                icon: const Icon(Icons.gps_fixed),
                                label: const Text('Actualizar GPS'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ],
                          )
                        else
                          const Text('No se pudo obtener la ubicación.'),

                        const SizedBox(height: 25),

                        // Botón confirmar cita
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_nombrePaciente.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Por favor ingresa el nombre del paciente')),
                              );
                              return;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green.shade400,
                                content: const Text(
                                    '✅ Cita registrada correctamente'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.calendar_month),
                          label: const Text('Confirmar Cita'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent.shade400,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Navegación entre pantallas
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/inicio');
                              },
                              icon: const Icon(Icons.arrow_circle_left_rounded,
                                  color: Colors.grey, size: 45),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/pacientes');
                              },
                              icon: const Icon(Icons.arrow_circle_right_rounded,
                                  color: Colors.pinkAccent, size: 45),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
