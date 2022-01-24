import 'package:flutter/material.dart';

class CustomEleBtnModel {
  final IconData btnIcon;
  final EdgeInsets btnPadding;
  final VoidCallback onClick;

  CustomEleBtnModel({
    required this.btnIcon,
    required this.btnPadding,
    required this.onClick,
  });
}

List<CustomEleBtnModel> eleBtnModels = [
  CustomEleBtnModel(
    onClick: () {},
    btnIcon: Icons.check,
    btnPadding: const EdgeInsets.only(top: 8.0),
  ),
  CustomEleBtnModel(
    onClick: () {},
    btnIcon: Icons.star,
    btnPadding: const EdgeInsets.only(top: 8.0, left: 8.0),
  ),
];
