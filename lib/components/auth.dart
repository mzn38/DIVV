import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/register_page.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool _showLogin = true;

  void toggleView() {
    setState(() {
      _showLogin = !_showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showLogin
          ? LoginPage(
              toggleview: toggleView,
            )
          : RegisterPage(
              toggleview: toggleView,
            ),
    );
  }
}
