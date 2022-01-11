import 'package:flutter/material.dart';

class CustomEleButton extends StatelessWidget {
  final IconData btnIcon;
  final String btnString; // api 모델 데이터 사용.
  final EdgeInsets btnPadding;
  final VoidCallback onClick;

  const CustomEleButton(
      {Key? key,
      required this.btnIcon,
      required this.btnPadding,
      required this.btnString,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: btnPadding,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          children: [
            Icon(btnIcon),
            const SizedBox(width: 8),
            Text(btnString),
          ],
        ),
      ),
    );
  }
}
