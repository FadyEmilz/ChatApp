import 'package:chatapp/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MassagesList extends StatelessWidget {
  const MassagesList({super.key, required this.senderName, required this.massageeee, required this.senderID});

  final String senderName;
  final String massageeee;
  final String senderID;



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: senderID == Provider.of<UsersProvider>(context, listen: false).userId ? CrossAxisAlignment.end : CrossAxisAlignment.start ,
      children: [
        // Username at the top
        Text(
          senderName ?? "Unknown User", // Display sender's name
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4), // Spacing between username and text
        // Message text
        Text(

          massageeee ?? "",
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white,fontSize: 16)),
        ),
      ],
    );
  }
}
//message["sender_name"]
// message["text"]
