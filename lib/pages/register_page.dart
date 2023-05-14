import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divv/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback toggleview;
  RegisterPage({super.key, required this.toggleview});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final _namecontroller = TextEditingController();

  bool passconfirmed() {
    if (_passwordcontroller.text.trim() ==
        _confirmpasswordcontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future adduser(String name, String email) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'name': name, 'email': email});
  }

  Future signInWithEmailAndName() async {
    if (passconfirmed()) {
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim(),
        );

        User? user = userCredential.user;
        if (user != null) {
          await user.updateDisplayName(_namecontroller.text.trim());
        }

        adduser(_namecontroller.text.trim(), _emailcontroller.text.trim());

        navigatorKey.currentState!.popUntil((route) => route.isFirst);

        // Rest of your code...
      } on FirebaseAuthException catch (e) {
        navigatorKey.currentState!.pop();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.code),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text(
                  'Password dont match',
                  textAlign: TextAlign.center,
                ),
              ));
    }
  }

  // Future signUp() async {
  //   if (passconfirmed()) {
  //     showDialog(
  //         context: context,
  //         builder: (context) => const Center(
  //               child: CircularProgressIndicator(),
  //             ));
  //     try {
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: _emailcontroller.text.trim(),
  //           password: _passwordcontroller.text.trim());

  //       adduser(_namecontroller.text.trim(), _emailcontroller.text.trim());

  //       navigatorKey.currentState!.popUntil((route) => route.isFirst);
  //     } on FirebaseAuthException catch (e) {
  //       navigatorKey.currentState!.pop();
  //       showDialog(
  //           context: context,
  //           builder: (context) => AlertDialog(
  //                 title: Text(e.code),
  //               ));
  //     }
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (context) => const AlertDialog(
  //               title: Text(
  //                 'Password dont match',
  //                 textAlign: TextAlign.center,
  //               ),
  //             ));
  //   }
  // }

  void signupAndPop(BuildContext context) {
    signInWithEmailAndName().then((_) {
      Navigator.pop(context);
    }).catchError((error) {
      print('Sign-up failed: $error');
    });
  }

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
                  height: 50,
                ),
                const Text(
                  "Welcome to DIVV",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 141, 123, 104),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Create Account',
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
                  controller: _namecontroller,
                  hinText: 'Enter Your Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextfield(
                  obscure: false,
                  controller: _emailcontroller,
                  hinText: 'Enter email',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextfield(
                  obscure: true,
                  controller: _passwordcontroller,
                  hinText: 'Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextfield(
                  obscure: true,
                  controller: _confirmpasswordcontroller,
                  hinText: 'Confirm Password',
                ),
                const SizedBox(
                  height: 50,
                ),
                MyButton(
                    color: Color.fromARGB(255, 141, 123, 104),
                    text: 'Register',
                    ontap: () {
                      signInWithEmailAndName();
                    }),
                const SizedBox(height: 110),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.toggleview,
                      child: const Text(
                        'Login',
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
