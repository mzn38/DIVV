import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

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
    return Align(
      alignment: iscurrentuser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: iscurrentuser
              ? const Color.fromARGB(255, 141, 123, 104)
              : const Color.fromARGB(255, 115, 115, 115),
          borderRadius: iscurrentuser
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !iscurrentuser,
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: iscurrentuser
                      ? const EdgeInsets.all(4)
                      : const EdgeInsets.only(top: 4, bottom: 4, right: 4),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 


// ChatBubble(
//       alignment: iscurrentuser ? Alignment.topRight : Alignment.topLeft,
//       clipper: ChatBubbleClipper1(
//           type: iscurrentuser
//               ? BubbleType.sendBubble
//               : BubbleType.receiverBubble),
//       backGroundColor: Color.fromARGB(255, 141, 123, 104),
//       margin: EdgeInsets.only(top: 10),
//       child: Container(
//           constraints: BoxConstraints(
//             maxWidth: MediaQuery.of(context).size.width * 0.7,
//           ),
//           child: Text(
//             message,
//             style: TextStyle(color: Colors.white),
//           )),
//     );
//   }


//  Row(
//       mainAxisAlignment:
//           iscurrentuser ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(
//             top: 10,
//             right: 10,
//             left: 10,
//           ),
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             borderRadius: iscurrentuser
//                 ? const BorderRadius.horizontal(
//                     left: Radius.circular(10), right: Radius.circular(0))
//                 : const BorderRadius.horizontal(
//                     left: Radius.circular(0), right: Radius.circular(10)),
//             color: const Color.fromARGB(255, 141, 123, 104),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Visibility(
//                     visible: !iscurrentuser,
//                     child: Row(
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(
//                               fontSize: 12, color: Colors.grey.shade100),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     message,
//                     style: const TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );