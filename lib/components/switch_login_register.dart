import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';

class Login_or_Register extends StatefulWidget {
  final bool checker;
  const Login_or_Register({super.key, required this.checker});

  @override
  State<Login_or_Register> createState() => _Login_or_Register();
}

class _Login_or_Register extends State<Login_or_Register> {
  late bool showlogin;
  @override
  void initState() {
    super.initState();
    showlogin = widget.checker;
  }

  void toggleView() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: showlogin
          ? LoginPage(
              toggleview: toggleView,
            )
          : RegisterPage(
              toggleview: toggleView,
            ),
    );
  }
}
