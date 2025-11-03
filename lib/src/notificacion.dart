import 'package:flutter/material.dart';
import 'package:menudrawer/src/navbar.dart';

class NotificacionPage extends StatelessWidget {
  const NotificacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFCE4EC), // 🌸 Rosa claro
              Color(0xFFE1BEE7), // 💜 Lila suave
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🩷 Encabezado moderno
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu_rounded,
                            color: Colors.white, size: 30),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    const Text(
                      'Notificaciones 💌',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: ListView(
                    children: [
                      _buildNotificacionCard(
                        icon: Icons.email_rounded,
                        title: 'Nuevo mensaje',
                        message:
                            'Has recibido un correo de confirmación. ¡Revísalo pronto!',
                        color: const Color(0xFFF48FB1),
                      ),
                      _buildNotificacionCard(
                        icon: Icons.update_rounded,
                        title: 'Actualización disponible',
                        message:
                            'La app tiene nuevas funciones y mejoras de rendimiento.',
                        color: const Color(0xFFBA68C8),
                      ),
                      _buildNotificacionCard(
                        icon: Icons.calendar_today_rounded,
                        title: 'Cita programada',
                        message:
                            'Tienes una cita para el lunes a las 9:00 am.',
                        color: const Color(0xFFCE93D8),
                      ),
                      _buildNotificacionCard(
                        icon: Icons.info_outline_rounded,
                        title: 'Recordatorio',
                        message:
                            'No olvides actualizar tus datos en Perfil para una mejor experiencia.',
                        color: const Color(0xFFF8BBD0),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // 🌈 Botones inferiores modernos
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCE93D8),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 6,
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/inicio', (route) => false);
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text(
                        'Atrás',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF48FB1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 6,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/siguiente');
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text(
                        'Siguiente',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 💌 Tarjeta de notificación con diseño moderno
  Widget _buildNotificacionCard({
    required IconData icon,
    required String title,
    required String message,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7), // efecto glass
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF6A1B9A),
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            message,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
