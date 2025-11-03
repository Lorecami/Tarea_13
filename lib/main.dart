//Camila Vivas
import 'package:flutter/material.dart';
import 'package:menudrawer/src/inicio.dart';
import 'package:menudrawer/src/notificacion.dart';
import 'package:menudrawer/src/perfil.dart';
import 'package:menudrawer/src/siguiente.dart';
import 'package:menudrawer/src/navbar.dart';
import 'package:menudrawer/src/configuracion.dart';
import 'package:menudrawer/src/acerca.dart';
 
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
      title: 'Menú Drawer con Rutas',
      theme: ThemeData(
        scaffoldBackgroundColor: amarilloPastel,
        colorScheme: ColorScheme.light(
          primary: azulPastel,
          secondary: naranjaPastel,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: azulPastel,
          foregroundColor: Colors.black,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: naranjaPastel,
          foregroundColor: Colors.black,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: lilaPastel,
        ),
      ),
      initialRoute: '/inicio',
      routes: {
        '/inicio': (context) => const InicioPage(),
        '/perfil': (context) => const PerfilPage(),
        '/notificacion': (context) => const NotificacionPage(),
        '/siguiente': (context) => const SiguientePage(),
        '/navbar': (context) => const Navbar(),
        '/configuracion': (context) => const ConfiguracionPage(),
        '/acerca': (context) => const AcercaPage(),
      },
    );
  }
}
