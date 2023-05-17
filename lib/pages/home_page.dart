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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _gotobottompage();
    });
  }

  final messagecontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ScrollController _scrollController = ScrollController();

  void signout() {
    FirebaseAuth.instance.signOut();
  }

  void _gotobottompage() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void postmessage() async {
    User? currentuserr = _auth.currentUser;
    if (messagecontroller.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection("usermsg").add(
        {
          'message': messagecontroller.text,
          'user': currentuser?.uid,
          'name': currentuserr?.displayName,
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
    final CurrentUser = _auth.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 123, 104),
        title: const Text('DIVV'),
        actions: [
          IconButton(onPressed: signout, icon: const Icon(Icons.logout))
        ],
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
                    controller: _scrollController,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];

                      final isCurrentUser = CurrentUser != null &&
                          CurrentUser.uid == post['user'];
                      return MessageContent(
                        iscurrentuser: isCurrentUser,
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                      _gotobottompage();
                    },
                    icon: const Icon(Icons.send),
                    color: const Color.fromARGB(255, 115, 115, 115),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
