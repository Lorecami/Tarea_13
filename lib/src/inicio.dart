import 'package:flutter/material.dart';
import 'package:menudrawer/src/navbar.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  // 🎨 Paleta pastel rosa y lila
  final Color rosaSuave = const Color(0xFFF8BBD0);
  final Color rosaMedio = const Color(0xFFF48FB1);
  final Color rosaIntenso = const Color(0xFFE57373);
  final Color lilaSuave = const Color(0xFFE1BEE7);
  final Color cremaClaro = const Color(0xFFFFF3F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cremaClaro,
      appBar: AppBar(
        title: const Text(
          'Página Principal',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: rosaMedio,
        elevation: 4,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      drawer: const Navbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🌸 Encabezado con gradiente rosado
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [rosaMedio, lilaSuave],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: rosaIntenso.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, color: Colors.white, size: 80),
                  SizedBox(height: 12),
                  Text(
                    '¡Bienvenida de nuevo 💕!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Explora tus secciones favoritas con estilo y colores suaves 🌷',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 💫 Sección de accesos destacados
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Explora tus opciones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: rosaIntenso,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildCard(
                        context,
                        Icons.person,
                        'Mi Perfil',
                        'Consulta o modifica tu información personal.',
                        rosaSuave,
                        '/perfil',
                      ),
                      _buildCard(
                        context,
                        Icons.notifications_active,
                        'Alertas',
                        'Revisa los avisos más recientes y novedades.',
                        lilaSuave,
                        '/notificacion',
                      ),
                      _buildCard(
                        context,
                        Icons.settings,
                        'Preferencias',
                        'Configura la app a tu gusto 💅',
                        rosaMedio,
                        '/configuracion',
                      ),
                      _buildCard(
                        context,
                        Icons.info_outline,
                        'Sobre la App',
                        'Conoce más sobre este proyecto y su creadora.',
                        rosaSuave,
                        '/acerca',
                      ),
                      _buildCard(
                        context,
                        Icons.arrow_forward_ios,
                        'Continuar',
                        'Sigue explorando el contenido.',
                        lilaSuave,
                        '/siguiente',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // 🌈 Botones principales
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) => ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rosaSuave,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.menu),
                    label: const Text('Ver Menú'),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: rosaIntenso,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/perfil');
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Ir al Perfil'),
                ),
              ],
            ),

            const SizedBox(height: 50),

            // 🪷 Pie de página
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: const Text(
                '© 2025 Desarrollado con 💻 y ☕ por Camila Vivas',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🧩 Tarjetas con estilo pastel
  Widget _buildCard(BuildContext context, IconData icon, String title,
      String description, Color color, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 28,
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
