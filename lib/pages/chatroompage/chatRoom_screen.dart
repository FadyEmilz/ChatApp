import 'package:chatapp/pages/chatroompage/widgets/massages_list.dart';
import 'package:chatapp/providers/users_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatroomScreen extends StatefulWidget {
  const ChatroomScreen(
      {super.key, required this.chatroomName, required this.chatroomID});
  final String chatroomName;
  final String chatroomID;

  @override
  State<ChatroomScreen> createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  TextEditingController massageCTRL = TextEditingController();
  var db = FirebaseFirestore.instance;

  Future<void> sendMassage() async {
    if (massageCTRL.text.isEmpty) {
      return;
    }
    Map<String, dynamic> massageToSend = {
      "text": massageCTRL.text,
      "sender_name":
          Provider.of<UsersProvider>(context, listen: false).userName,
      "user_id": Provider.of<UsersProvider>(context, listen: false).userId,
      "chatroom_id": widget.chatroomID,
      "timestamp": FieldValue.serverTimestamp()
    };
    massageCTRL.text = "";
    try {
      await db.collection("massage").add(massageToSend);
    } catch (a) {}


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatroomName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Chat messages list
          StreamBuilder(
            stream: db.collection("massage").where("chatroom_id", isEqualTo: widget.chatroomID).orderBy("timestamp", descending: true).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasError){
                print(snapshot.error);
                return Text("error has occoured");
              }
              var allMessages = snapshot.data?.docs ?? [];
              return Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: allMessages.length,
                  itemBuilder: (context, index) {
                    var message = allMessages[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message["user_id"] == Provider.of<UsersProvider>(context, listen: false).userId ? Colors.green.shade700 : Colors.grey.shade700 ,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MassagesList(senderName: message["sender_name"], massageeee: message["text"], senderID: message["user_id"])
                    );
                  },
                ),
              );
            },
          ),
          const Divider(height: 1),
          // Message input field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Form(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: massageCTRL,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      sendMassage();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
