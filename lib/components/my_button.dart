import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final color;
  void Function()? ontap;
  MyButton(
      {super.key,
      required this.text,
      required this.ontap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
