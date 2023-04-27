import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../pages/home_page.dart';
import '../pages/cuenta.dart';
import '../pages/favoritos.dart';

class BarraNavegacion extends StatefulWidget {
  @override
  _BarraNavegacionState createState() => _BarraNavegacionState();
}

class _BarraNavegacionState extends State<BarraNavegacion> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    ListPage(),
    const Favoritos(),
    const Cuenta()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: const Color(0xFFE8F6FA),
        color: const Color(0xFFd0e2ed),
        animationDuration: const Duration(milliseconds: 300),
        height: 58,
        onTap: onTabTapped,
        items: const <Widget>[
          Icon(
            Icons.home_outlined,
            color: Color(0xFF1a2f59),
            size: 40,
          ),
          Icon(
            Icons.list_alt_rounded,
            color: Color(0xFF1a2f59),
            size: 40,
          ),
          Icon(
            Icons.favorite_border_rounded,
            color: Color(0xFF1a2f59),
            size: 40,
          ),
          Icon(
            Icons.account_circle_outlined,
            color: Color(0xFF1a2f59),
            size: 40,
          )
        ],
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE8F6FA),
      child: const Center(
        child: Text('List Page'),
      ),
    );
  }
}
