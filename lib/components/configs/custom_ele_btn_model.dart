import 'package:flutter/material.dart';

// Map<String, dynamic> eleBtnModel = {
//   'btn1': {
//     'btnIcon': Icons.check,
//     'onClick': () {},
//     'btnPadding': const EdgeInsets.only(top: 8.0),
//   },
//   'btn2': {
//     'btnIcon': Icons.check,
//     'onClick': () {},
//     'btnPadding': const EdgeInsets.only(top: 8.0),
//   }
// };

// 버튼 속성 : IconData, btnTxt, EdgeInsets
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
