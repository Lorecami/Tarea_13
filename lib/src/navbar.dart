import 'package:flutter/material.dart';
import 'package:menudrawer/src/inicio.dart';
import 'package:menudrawer/src/citas.dart';
import 'package:menudrawer/src/pacientes.dart';
import 'package:menudrawer/src/perfil_medico.dart';
import 'package:menudrawer/src/configuracion.dart';
import 'package:menudrawer/src/acerca.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8BBD0), Color(0xFFFCE4EC)], // 💗 degradado rosa pastel
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Dra. Camila Vivas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              accountEmail: const Text(
                "camila.vivas@clinicavida.ec",
                style: TextStyle(color: Colors.white70),
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("images/mujer.jpg"),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF7AC3EE),
                image: DecorationImage(
                  image: AssetImage("images/fondo2.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
            ),

            // 🏠 Menú principal
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Inicio',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.calendar_today,
              text: 'Citas Médicas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CitasPage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.people,
              text: 'Pacientes',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PacientesPage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: 'Perfil Médico',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilMedicoPage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              text: 'Configuración',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfiguracionPage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.info_outline,
              text: 'Acerca de',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AcercaPage()),
                );
              },
            ),

            // 📱 Nuevo ítem de Recursos Móviles
            _buildDrawerItem(
              icon: Icons.qr_code,
              text: 'Escanear QR Médico',
              onTap: () {
                Navigator.pushNamed(context, '/recursos');
              },
            ),

            const Divider(
              color: Colors.white70,
              indent: 20,
              endIndent: 20,
            ),

            _buildDrawerItem(
              icon: Icons.exit_to_app,
              text: 'Cerrar sesión',
              color: Colors.redAccent,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/inicio', (route) => false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sesión cerrada'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color color = const Color(0xFF6D4C41),
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      hoverColor: Colors.pink.shade50,
      onTap: onTap,
    );
  }
}
