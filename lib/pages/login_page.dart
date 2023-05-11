import 'package:divv/components/my_button.dart';
import 'package:divv/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 90,
                ),
                const Text(
                  "Welcome Back You've been missed!",
                  style: TextStyle(fontSize: 38),
                ),
                const SizedBox(
                  height: 90,
                ),
                MyTextfield(
                  obscure: false,
                  controller: _emailcontroller,
                  hinText: 'Enter Email',
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextfield(
                  obscure: true,
                  controller: _passwordcontroller,
                  hinText: 'Password',
                ),
                const SizedBox(
                  height: 40,
                ),
                MyButton(text: 'Login', ontap: () {}),
                const SizedBox(height: 190),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'register',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
