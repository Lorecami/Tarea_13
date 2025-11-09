import 'package:flutter/material.dart';
import 'package:menudrawer/src/doctor.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PerfilMedicoPage extends StatefulWidget {
  const PerfilMedicoPage({super.key});

  @override
  State<PerfilMedicoPage> createState() => _PerfilMedicoPageState();
}

class _PerfilMedicoPageState extends State<PerfilMedicoPage> {
  final List<Doctor> doctores = [
    Doctor(
      nombre: "Dra. Camila Vivas",
      especialidad: "Medicina General",
      correo: "camila.vivas@clinicavida.ec",
      imagen: "images/mujer.jpg",
    ),
    Doctor(
      nombre: "Dr. Juan Pérez",
      especialidad: "Cardiología",
      correo: "juan.perez@clinicavida.ec",
      imagen: "images/doctor1.jpg",
    ),
    Doctor(
      nombre: "Dra. Ana Torres",
      especialidad: "Pediatría",
      correo: "ana.torres@clinicavida.ec",
      imagen: "images/doctor2.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Equipo Médico",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: doctores.length,
        itemBuilder: (context, index) {
          final doctor = doctores[index];
          return Card(
            color: Colors.white,
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(doctor.imagen),
                        radius: 35,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.nombre,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              doctor.especialidad,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              doctor.correo,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  QrImageView(
                    data: doctor.toQRData(),
                    size: 140,
                    backgroundColor: Colors.white,
                  ),
                  const Text(
                    "Escanea el código para más información",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
