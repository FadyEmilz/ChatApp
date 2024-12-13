import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlreadyHave extends StatelessWidget {
  const AlreadyHave({super.key, required this.already, required this.cliclableText, required this.onClick});
  final String already;
  final String cliclableText;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(already,style:  GoogleFonts.poppins()),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: InkWell(
              onTap: onClick,
              child: Text(cliclableText,style: GoogleFonts.poppins(color: Colors.cyan),),
            ),
          )
        ],
      ),
      width: 250,
      height: 50,
    );
  }
}
