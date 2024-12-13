import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  const BigText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Text(
          text,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)),
        ));
  }
}
