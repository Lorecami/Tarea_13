import 'package:flutter/material.dart';
import 'package:menudrawer/src/navbar.dart';

class SiguientePage extends StatelessWidget {
  const SiguientePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8EAF6), Color(0xFFE1BEE7), Color(0xFFF3E5F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                // 🌸 Ícono decorativo
                const Icon(
                  Icons.emoji_emotions_rounded,
                  size: 90,
                  color: Color(0xFFBA68C8),
                ),
                const SizedBox(height: 20),

                // ✨ Título
                const Text(
                  '¡Has llegado al final!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A1B9A),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),
                const Text(
                  'Gracias por usar nuestra aplicación. Esperamos que la experiencia haya sido intuitiva, atractiva y funcional.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                // 🌼 Resumen de Funciones
                _buildGlassCard(
                  title: 'Resumen de Funciones',
                  color: const Color(0xFF9C27B0),
                  content: '• Acceso rápido a Perfil, Notificaciones y Configuración.\n'
                      '• Navegación fluida con Drawer moderno.\n'
                      '• Colores suaves y diseño responsivo.\n'
                      '• Funcionalidad adaptable a todos los dispositivos.',
                ),

                const SizedBox(height: 20),

                // 💡 Consejos
                _buildGlassCard(
                  title: 'Consejos de uso',
                  color: const Color(0xFFAB47BC),
                  content: '• Mantén tu perfil actualizado.\n'
                      '• Revisa notificaciones con frecuencia.\n'
                      '• Personaliza la app a tu gusto.\n'
                      '• Explora todas las funciones disponibles.',
                ),

                const SizedBox(height: 35),

                // 🎀 Botones con estilo pastel degradado
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGradientButton(
                      context,
                      label: 'Volver al Inicio',
                      icon: Icons.home,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFCE93D8), Color(0xFFAB47BC)],
                      ),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/inicio', (route) => false);
                      },
                    ),
                    const SizedBox(width: 20),
                    _buildGradientButton(
                      context,
                      label: 'Tips de Uso',
                      icon: Icons.lightbulb_outline,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF48FB1), Color(0xFFBA68C8)],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: const Color(0xFFF3E5F5),
                            title: const Text(
                              'Tips Adicionales',
                              style: TextStyle(
                                  color: Color(0xFF6A1B9A),
                                  fontWeight: FontWeight.bold),
                            ),
                            content: const Text(
                              'Explora más funciones en futuras versiones y personaliza tu experiencia a tu estilo 💜',
                              style: TextStyle(fontSize: 16),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cerrar',
                                    style:
                                        TextStyle(color: Color(0xFF8E24AA))),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                const Text(
                  '© 2025 App creada por Kevin Nivesela',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🌷 Card moderna con efecto glass
  Widget _buildGlassCard({
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // 💗 Botón degradado
  Widget _buildGradientButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required LinearGradient gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
