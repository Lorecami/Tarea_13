import  'package:flutter/material.dart';
import 'package:menudrawer/src/navbar.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key}); // 👈 Quité el const para evitar el error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      backgroundColor: const Color(0xFFF8EAF6), // 💜 Fondo pastel suave
      appBar: AppBar(
        backgroundColor: const Color(0xFFF48FB1), // 🌸 Rosa pastel
        title: const Text(
          'Perfil de Usuario',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  '/SRC/flutter/examples/CuartoA/menudrawerCV/images/mujer.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Camila Lorenlay Vivas Gualinga 💫',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6A1B9A)), // 💜 Morado pastel
              textAlign: TextAlign.center,
            ),
            const Text(
              'cl.vivas@yavirac.edu.ec',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 25),
            Card(
              color: const Color(0xFFFCE4EC), // 💗 Rosa muy claro
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.phone, color: Color(0xFFEC407A)),
                    title: Text('Teléfono'),
                    subtitle: Text('+593 987 654 321'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Color(0xFFEC407A)),
                    title: Text('Ubicación'),
                    subtitle: Text('Quito, Ecuador'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.work, color: Color(0xFFEC407A)),
                    title: Text('Ocupación'),
                    subtitle: Text('Estudiante de Desarrollo de Software'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.school, color: Color(0xFFEC407A)),
                    title: Text('Nivel académico'),
                    subtitle: Text('Universitario'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBA68C8), // 💜 Lila pastel
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ajustes');
                  },
                  icon: const Icon(Icons.settings, color: Colors.white),
                  label: const Text('Ajustes',
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF06292), // 🌸 Rosa pastel
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('Editar Perfil',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFCE93D8), // 💜 Pastel claro
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notificacion');
              },
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              label: const Text('Ir a Notificaciones',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
