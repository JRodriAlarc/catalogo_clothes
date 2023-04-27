import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/navbar_controller.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final styleBienvenido = const TextStyle(
      color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold);

  final stylesInputs =
      const TextStyle(color: Color(0xFF1a2f59), fontWeight: FontWeight.bold);

  final styleButton = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String password = "", email = "";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = screenWidth / 360.0;

    final styleInicio = TextStyle(
        color: Colors.white,
        fontSize: 47 * scaleFactor,
        fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: const Color(0xFFE8F6FA),
      body: ListView(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF617ed8),
                    Color(0xFF3333d8),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.34,
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  Row(
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.only(left: 12, right: 12)),
                      Text("Bienvenido, ",
                          style: GoogleFonts.quicksand(
                              textStyle: styleBienvenido)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.only(left: 12, right: 12)),
                      Text('Inicia Sesión',
                          style: GoogleFonts.openSans(textStyle: styleInicio)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'DIRECCIÓN EMAIL',
                  suffixIcon: Icon(Icons.mail_outline_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.roboto(textStyle: stylesInputs)),
          ),
          const SizedBox(height: 35.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: 'CONTRASEÑA',
                  suffixIcon: Icon(Icons.lock_outline_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              style: GoogleFonts.roboto(textStyle: stylesInputs),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "Olvido su Contraseña?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1a2f59)),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75.0),
            child: ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                print("Email: $email");
                print("Password: $password");

                // Lógica de inicio de sesión aquí
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BarraNavegacion()),
                    (Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF3d42e8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Inicia Sesión ",
                      style: GoogleFonts.quicksand(textStyle: styleButton)),
                  const Icon(Icons.login_rounded)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
