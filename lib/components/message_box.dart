import 'package:flutter/material.dart';

class MessageContent extends StatelessWidget {
  final String message;
  final String name;
  final bool iscurrentuser;

  const MessageContent(
      {super.key,
      required this.message,
      required this.name,
      required this.iscurrentuser});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          iscurrentuser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          padding: EdgeInsets.all(8),
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
                  Visibility(
                    visible: !iscurrentuser,
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
