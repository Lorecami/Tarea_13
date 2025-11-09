// Camila Vivas
import 'package:flutter/material.dart';
import 'package:menudrawer/src/inicio.dart';
import 'package:menudrawer/src/citas.dart';
import 'package:menudrawer/src/pacientes.dart';
import 'package:menudrawer/src/perfil_medico.dart';
import 'package:menudrawer/src/configuracion.dart';
import 'package:menudrawer/src/acerca.dart';
import 'package:menudrawer/src/escaner.dart'; // 📱 Nueva pantalla añadida
import 'package:menudrawer/src/navbar.dart'; // Asegúrate de tener tu menú lateral aquí

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 🎨 Colores pastel
  static const Color azulPastel = Color(0xFFB3E5FC);
  static const Color naranjaPastel = Color(0xFFFFCCBC);
  static const Color lilaPastel = Color(0xFFD1C4E9);
  static const Color amarilloPastel = Color(0xFFFFF9C4);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda Médica',
      theme: ThemeData(
        scaffoldBackgroundColor: amarilloPastel,
        colorScheme: ColorScheme.light(
          primary: azulPastel,
          secondary: naranjaPastel,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: azulPastel,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      // 👇 Ruta inicial
      initialRoute: '/inicio',

      // 👇 Todas las rutas de navegación
      routes: {
        '/inicio': (context) => const InicioPage(),
        '/pacientes': (context) => const PacientesPage(),
        '/citas': (context) => const CitasPage(),
        '/perfil': (context) => const PerfilMedicoPage(),
        '/configuracion': (context) => const ConfiguracionPage(),
        '/acerca': (context) => const AcercaPage(),
        '/recursos': (context) => const RecursosMovilesPage(), // 📱 Nueva ruta
      },
    );
  }
}
