import 'package:chatapp/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,  required this.onClick});
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
          backgroundColor: Colors.blueAccent),
      onPressed: onClick
      ,
      child:  Text(  text,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20,color: Colors.white)),),
    );
  }
}
