import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceItem extends StatelessWidget {
  String txt;
  bool isSelected;
  SourceItem(this.txt, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff39A552)),
            borderRadius: BorderRadius.circular(24),
            color: isSelected ? Color(0xff39A552) : Colors.white),
        child: Text(txt,
            style: GoogleFonts.exo(
                fontSize: 14,
                color: isSelected ? Colors.white : Color(0xff39A552))));
  }
}
