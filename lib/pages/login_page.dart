import 'package:divv/components/my_button.dart';
import 'package:divv/components/my_textfield.dart';
import 'package:divv/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback toggleview;
  LoginPage({super.key, required this.toggleview});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future logIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.code),
              ));
    }
  }

  // void signInAndPop(BuildContext context) {
  //   logIn().then((_) {
  //     Navigator.pop(context);
  //   }).catchError((error) {
  //     print('Sign-in failed: $error');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Welcome Back You've been missed!",
                  style: TextStyle(fontSize: 38),
                ),
                const SizedBox(
                  height: 95,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Log in',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextfield(
                  obscure: false,
                  controller: _emailcontroller,
                  hinText: 'Enter email',
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgotten password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                MyButton(
                    color: Color.fromARGB(255, 141, 123, 104),
                    text: 'Login',
                    ontap: () {
                      logIn();
                    }),
                const SizedBox(height: 130),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.toggleview,
                      child: const Text(
                        'register',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
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
