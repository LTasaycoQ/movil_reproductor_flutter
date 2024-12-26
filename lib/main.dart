import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/DescargaVideo.dart';
import 'package:flutter_application_1/pages/Inicio.dart';
import 'package:flutter_application_1/utils/Main_Home_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: InicioPage(),
      routes: {
        'InicioEntrada': (_) => InicioPage(),
        'Home': (_) => MainHomePage(),
        'descargar': (_) => DescargaPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
