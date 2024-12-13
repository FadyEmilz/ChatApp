import 'package:chatapp/core/routes.dart';
import 'package:chatapp/pages/chatroompage/chatRoom_screen.dart';
import 'package:chatapp/providers/users_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var user = FirebaseAuth.instance.currentUser;
  var db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> chatroomsList = [];
  List<String> chatroomIDs = [];
  GlobalKey<ScaffoldState> myScaffoldKey = GlobalKey();

  getChatrooms() {
    db.collection("chatrooms").get().then((snapshot) {
      for (var i in snapshot.docs) {
        chatroomsList.add(i.data());
        chatroomIDs.add(i.id.toString());
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    getChatrooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      key: myScaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            myScaffoldKey.currentState!.openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text(
                userProvider.userName[0].toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Chat App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    userProvider.userName[0].toUpperCase(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                accountName: Text(
                  userProvider.userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(userProvider.userEmail),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.profilePageName);
                },
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(
                      context, RoutesNames.splashPageName);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: chatroomsList.isEmpty
            ? Center(
          child: Text(
            "No chatrooms available.",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : ListView.separated(
          itemBuilder: (context, index) {
            String chatroomName =
                chatroomsList[index]['chatroom_name'] ?? "Unnamed";
            String description =
                chatroomsList[index]['desc'] ?? "No description";
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(

                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    chatroomName[0].toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  chatroomName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ChatroomScreen(chatroomName: chatroomName, chatroomID: chatroomIDs[index]);
                  }));
                },
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: chatroomsList.length,
        ),
      ),
    );
  }
}
