import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text extends StatelessWidget {
  String titleText;
  text( this.titleText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: 27,


      ),
    );
  }
}
