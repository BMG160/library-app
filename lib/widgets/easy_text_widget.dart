import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EasyTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextAlign? align;
  const EasyTextWidget({super.key, required this.text, required this.size, required this.weight, this.align, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.mulish(textStyle: TextStyle(color: color, fontSize: size, fontWeight: weight,)), textAlign: align,);
  }
}
