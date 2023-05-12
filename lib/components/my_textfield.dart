import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final bool obscure;
  final controller;
  final hinText;
  const MyTextfield(
      {super.key,
      required this.obscure,
      required this.controller,
      required this.hinText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.white,
          filled: true,
          hintText: hinText),
      onTap: () {},
    );
  }
}
