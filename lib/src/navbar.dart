import 'package:flutter/material.dart';
import 'package:menudrawer/src/inicio.dart';
import 'package:menudrawer/src/notificacion.dart';
import 'package:menudrawer/src/perfil.dart';
import 'package:menudrawer/src/siguiente.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8BBD0), Color(0xFFFCE4EC)], // degradado rosa pastel
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Camila Vivas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              accountEmail: const Text(
                "clg.vivas@yavirac.edu.ec",
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
                  backgroundImage: AssetImage(
                      "/SRC/flutter/examples/CuartoA/menudrawer/images/mujer.jpg"),
                ),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 122, 195, 238), // color base
                image: const DecorationImage(
                  image: AssetImage(
                    "/SRC/flutter/examples/CuartoA/menudrawer/images/fondo.2.jpg",
                  ),
                  fit: BoxFit.cover,
                  opacity: 5.10, // suaviza la imagen
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
            ),

            // Opciones del Drawer
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
              icon: Icons.person,
              text: 'Perfil',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilPage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.notifications_active,
              text: 'Notificaciones',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificacionPage(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.arrow_forward,
              text: 'Siguiente',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SiguientePage()),
                );
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
    Color color = const Color(0xFF6D4C41), // tono marrón rosado pastel
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
