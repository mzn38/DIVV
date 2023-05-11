import 'package:divv/components/my_button.dart';
import 'package:divv/pages/login_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 150,
              ),
              //main icon
              const Icon(
                Icons.flash_on,
                size: 100,
              ),

              //main text
              const Text(
                ' Welcome to DIVV',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Connect globally, chat freely. Embrace diversity, share your voice.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 220,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: MyButton(
                        text: 'Register',
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MyButton(
                        text: 'Login',
                        ontap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      )),
    );
  }
}
