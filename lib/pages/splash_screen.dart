import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase/firebase_options.dart';
import 'page_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> ejecutarApp() async {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PageLogin()),
      ),
    );
  }

  Future<FirebaseApp> conectarFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await ejecutarApp();

      print("OK: Servicio de Firebase Inicializado Correctamente");
    } catch (e) {
      print("ER: Error al Intentar usar el Servicio de Firebase: $e");
    }
    return Firebase.app();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6FA),
      body: FutureBuilder(
        future: conectarFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Spacer(),
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: .65,
                            child: SizedBox(
                              width: 300,
                              child: Image.asset("assets/img/logo-app.png"),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const CircularProgressIndicator(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
