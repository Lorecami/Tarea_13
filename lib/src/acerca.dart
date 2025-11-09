import 'package:flutter/material.dart';

class AcercaPage extends StatelessWidget {
  const AcercaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F7), // fondo rosado claro
      appBar: AppBar(
        title: const Text('Acerca de mi Agenda Médica'),
        backgroundColor: const Color(0xFFFFA07A), // durazno pastel
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🩺 Cabecera con gradiente durazno-rosa
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFBCA9), Color(0xFFF8BBD0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(25),
              child: Column(
                children: const [
                  Icon(Icons.medical_services_outlined, size: 80, color: Colors.white),
                  SizedBox(height: 15),
                  Text(
                    'Agenda Médica Digital',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Organiza tus citas, pacientes y registros clínicos',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Esta aplicación te permite administrar tus horarios, llevar el control de tus pacientes y mejorar tu gestión médica diaria con un estilo moderno y personalizado.',
                    style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 💬 Sección de propósito
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 6,
              shadowColor: Colors.pink.shade100,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Text(
                      'Propósito de la App',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF8C69),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'La Agenda Médica ha sido diseñada para facilitar la organización de citas y mejorar la atención al paciente, brindando herramientas prácticas para profesionales de la salud.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 👩‍⚕️ Información del desarrollador
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 4,
              shadowColor: Colors.pink.shade50,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF8BBD0), Color(0xFFFFBCA9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                          'images/mujer.jpg', // asegúrate que la ruta esté correcta
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Desarrollado por:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Camila Vivas',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Estudiante de Desarrollo de Software - Yavirac',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Versión 1.0.0',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.9), fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🌐 Iconos de contacto
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  color: const Color(0xFFFF8C69),
                  iconSize: 32,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.web),
                  color: const Color(0xFFF8BBD0),
                  iconSize: 32,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.phone_android),
                  color: const Color(0xFFFF8C69),
                  iconSize: 32,
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 40),

            // 🔙 Botón volver
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA07A),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 6,
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/inicio', (route) => false);
              },
              icon: const Icon(Icons.home),
              label: const Text(
                'Volver al inicio',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
