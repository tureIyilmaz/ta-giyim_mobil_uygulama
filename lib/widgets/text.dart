import 'package:flutter/material.dart';

class NewText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final String fontName;
  final TextOverflow overflow;

  const NewText({
    super.key,
    required this.color,
    required this.text,
    required this.size,
    required this.fontName,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontName,
        color: color,
        fontSize: size,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
