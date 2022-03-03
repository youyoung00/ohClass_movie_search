import 'package:flutter/material.dart';

class TextInfoContainer extends StatelessWidget {
  final EdgeInsets padding;
  final Color? txtColor;
  final String infoTxt;

  const TextInfoContainer({
    Key? key,
    this.txtColor,
    required this.padding,
    required this.infoTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          infoTxt,
          style: TextStyle(color: txtColor ?? Colors.white),
        ),
      ),
    );
  }
}
