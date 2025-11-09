import 'package:flutter/material.dart';
import 'navbar.dart';

class PacientesPage extends StatelessWidget {
  const PacientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pacientes = [
      {'nombre': 'Juan Pérez', 'detalle': 'Control general - 10:00 AM'},
      {'nombre': 'María López', 'detalle': 'Revisión cardiológica - 11:30 AM'},
      {'nombre': 'Carlos Andrade', 'detalle': 'Chequeo anual - 1:00 PM'},
      {'nombre': 'Lucía Torres', 'detalle': 'Consulta pediátrica - 2:30 PM'},
      {'nombre': 'Andrea Castro', 'detalle': 'Dermatología - 3:00 PM'},
      {'nombre': 'Fernando Rojas', 'detalle': 'Nutrición - 4:00 PM'},
      {'nombre': 'Sofía Herrera', 'detalle': 'Oftalmología - 4:30 PM'},
      {'nombre': 'Diego Villalba', 'detalle': 'Odontología - 5:00 PM'},
      {'nombre': 'Natalia Cárdenas', 'detalle': 'Psicología - 6:00 PM'},
    ];

    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text('Pacientes'),
        backgroundColor: const Color(0xFF7AC3EE),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFFCE4EC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: pacientes.length,
          itemBuilder: (context, index) {
            final paciente = pacientes[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.pinkAccent),
                title: Text(
                  paciente['nombre']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(paciente['detalle']!),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Abriendo ficha de ${paciente['nombre']}...')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
