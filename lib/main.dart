import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const AppCatalogo());
}

class AppCatalogo extends StatelessWidget {
  const AppCatalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogo',
      home: SplashScreen(),
    );
  }
}
