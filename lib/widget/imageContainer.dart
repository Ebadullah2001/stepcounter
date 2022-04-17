import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kadamcounter/widget/textWidget.dart';

class imageContainer extends StatelessWidget {
  String imagePath, number, textTitle;
  imageContainer(this.imagePath, this.number, this.textTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            height: 45,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: text( number),
          ),

          // this is another text
          Text(textTitle,style:GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white),)
          // text(textTitle),
        ],
      );

  }
}
