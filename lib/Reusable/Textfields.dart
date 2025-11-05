import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({super.key, required this.headerText, required this.myStyle});
  final String headerText;

  final TextStyle myStyle;

  @override
  Widget build(BuildContext context) {
    return Text(headerText, style: myStyle);
  }
}
