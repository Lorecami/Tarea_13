import 'package:flutter/material.dart';
import 'navbar.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text('Agenda Médica'),
        backgroundColor: const Color(0xFF7AC3EE),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // 👩‍⚕️ Encabezado
              const Text(
                'Bienvenida, Dra. Camila Vivas 💗',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF444444),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Revisa tus próximas citas y gestiona tus pacientes con facilidad 🩺',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),

              const SizedBox(height: 30),

              // 📅 Tarjeta resumen del día
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Citas de Hoy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7AC3EE),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.schedule, color: Colors.pinkAccent),
                      title: Text('10:00 AM - Juan Pérez'),
                      subtitle: Text('Control general'),
                    ),
                    ListTile(
                      leading: Icon(Icons.schedule, color: Colors.pinkAccent),
                      title: Text('11:30 AM - María López'),
                      subtitle: Text('Revisión cardiológica'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ⚡ Accesos rápidos
              const Text(
                'Accesos Rápidos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF444444),
                ),
              ),
              const SizedBox(height: 20),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 15,
                children: [
                  _buildCard(
                    icon: Icons.calendar_today,
                    color: const Color(0xFF7AC3EE),
                    title: 'Ver Citas',
                    onTap: () => Navigator.pushNamed(context, '/citas'),
                  ),
                  _buildCard(
                    icon: Icons.people,
                    color: const Color(0xFFF8BBD0),
                    title: 'Pacientes',
                    onTap: () => Navigator.pushNamed(context, '/pacientes'),
                  ),
                  _buildCard(
                    icon: Icons.person,
                    color: const Color(0xFFFDD835),
                    title: 'Perfil Médico',
                    onTap: () => Navigator.pushNamed(context, '/perfil'),
                  ),
                  _buildCard(
                    icon: Icons.settings,
                    color: const Color(0xFFBA68C8),
                    title: 'Configuración',
                    onTap: () => Navigator.pushNamed(context, '/configuracion'),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // 💬 Pie de página
              const Text(
                'Desarrollado con 💻 y 💕 por Camila Vivas',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 120,
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
