import 'package:divv/components/switch_login_register.dart';
import 'package:divv/components/my_button.dart';
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
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // const SizedBox(
              //   height: 100,
              // ),
              //main icon
              const Icon(
                Icons.flash_on,
                size: 100,
                color: Color.fromARGB(255, 141, 123, 104),
              ),

              //main text
              const Text(
                ' Welcome to DIVV',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 141, 123, 104)),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Connect globally, chat freely. Embrace diversity, share your voice.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 200, 182, 166),
                ),
              ),
              const SizedBox(
                height: 230,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: MyButton(
                        color: Color.fromARGB(255, 141, 123, 104),
                        text: 'Register',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Login_or_Register(checker: false),
                              ));
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: MyButton(
                        color: Color.fromARGB(255, 141, 123, 104),
                        text: 'Login',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_or_Register(
                                        checker: true,
                                      )));
                        }),
                  )
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
