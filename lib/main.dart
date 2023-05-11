import 'package:divv/pages/login_page.dart';
import 'package:divv/pages/register_page.dart';
import 'package:divv/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage()
      },
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
