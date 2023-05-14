import 'package:flutter/material.dart';

class MessageContent extends StatelessWidget {
  final String user;
  final String message;
  final String name;

  const MessageContent(
      {super.key,
      required this.user,
      required this.message,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 15,
            right: 15,
            left: 15,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromARGB(255, 141, 123, 104),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
