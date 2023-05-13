import 'package:divv/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class AuthPAge extends StatelessWidget {
  const AuthPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('something went wrong'),
              );
            } else if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const WelcomePage();
            }
          }),
    );
  }
}
