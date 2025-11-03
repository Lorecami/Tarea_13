import 'package:flutter/material.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  bool notificaciones = true;
  bool modoOscuro = false;
  bool sonidos = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5), // rosa pastel muy suave
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color(0xFF4DB6AC), // turquesa pastel
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🎨 Tarjeta de Preferencias
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 6,
              shadowColor: Colors.pink.shade100,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFB2DFDB), Color(0xFFF8BBD0)], // turquesa + rosa
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.settings, color: Colors.white, size: 28),
                          SizedBox(width: 10),
                          Text(
                            'Preferencias',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1, color: Colors.white70),
                      SwitchListTile.adaptive(
                        activeColor: Colors.white,
                        title: const Text('Notificaciones', style: TextStyle(color: Colors.white)),
                        subtitle: const Text('Recibe avisos importantes', style: TextStyle(color: Colors.white70)),
                        value: notificaciones,
                        onChanged: (val) => setState(() => notificaciones = val),
                      ),
                      SwitchListTile.adaptive(
                        activeColor: Colors.white,
                        title: const Text('Modo Oscuro', style: TextStyle(color: Colors.white)),
                        subtitle: const Text('Activa el tema oscuro', style: TextStyle(color: Colors.white70)),
                        value: modoOscuro,
                        onChanged: (val) => setState(() => modoOscuro = val),
                      ),
                      SwitchListTile.adaptive(
                        activeColor: Colors.white,
                        title: const Text('Sonidos', style: TextStyle(color: Colors.white)),
                        subtitle: const Text('Efectos de interacción', style: TextStyle(color: Colors.white70)),
                        value: sonidos,
                        onChanged: (val) => setState(() => sonidos = val),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🎨 Tarjeta de Información de la App
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF8BBD0), Color(0xFFB2DFDB)], // rosa + turquesa
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Acerca de la App',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text('Versión: 2.0.0', style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('Desarrollador: Camila Vivas', style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('Contacto: clg.vivas@yavirac.edu.ec', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 🎨 Botones flotantes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4DB6AC),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cambios guardados correctamente'),
                          backgroundColor: Color(0xFF00796B),
                        ),
                      );
                    },
                    icon: const Icon(Icons.save),
                    label: const Text(
                      'Guardar',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF48FB1),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/inicio', (route) => false);
                    },
                    icon: const Icon(Icons.home),
                    label: const Text(
                      'Inicio',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
            const Center(
              child: Text(
                '© 2025 App creada por Camila Vivas',
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
