import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divv/components/message_box.dart';
import 'package:divv/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentuser = FirebaseAuth.instance.currentUser;

  final messagecontroller = TextEditingController();

  void signout() {
    FirebaseAuth.instance.signOut();
  }

  void postmessage() async {
    if (messagecontroller.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection("usermsg").add(
        {
          'message': messagecontroller.text,
          'user': currentuser?.email,
          'name': currentuser?.displayName,
          'TimeStamp': Timestamp.now()
        },
      );
      setState(() {
        messagecontroller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 141, 123, 104),
        title: Text('DIVV'),
        actions: [IconButton(onPressed: signout, icon: Icon(Icons.logout))],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('usermsg')
                  .orderBy('TimeStamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];
                      return MessageContent(
                        user: post['user'],
                        message: post['message'],
                        name: post['name'],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('error:${snapshot.error}'),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: MyTextfield(
                      obscure: false,
                      controller: messagecontroller,
                      hinText: 'enter message'),
                ),
                IconButton(
                  onPressed: () {
                    postmessage();
                  },
                  icon: Icon(Icons.send),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
