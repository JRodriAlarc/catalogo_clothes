import 'package:flutter/material.dart';

class Cuenta extends StatefulWidget {
  const Cuenta({Key? key}) : super(key: key);

  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: const Color(0xFFE8F6FA),
            child: const Center(
              child: Text("Cuenta Usuario"),
            )));
  }
}
