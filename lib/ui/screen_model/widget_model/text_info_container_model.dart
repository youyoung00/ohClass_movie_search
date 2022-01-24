import 'package:flutter/material.dart';

class TextInfoContainer {
  final EdgeInsets padding;
  final Color? txtColor;

  TextInfoContainer({
    required this.padding,
    this.txtColor,
  });
}

List<TextInfoContainer> textInfoContainers = [
  TextInfoContainer(
    padding: const EdgeInsets.all(8.0),
    txtColor: Colors.white,
  ),
  TextInfoContainer(
    padding: const EdgeInsets.all(16.0),
  ),
];
