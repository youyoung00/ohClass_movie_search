// 텍스트 인포 컨테이너 속성
// EdgeInsets padding;
// Color txtColor;
// String infoTxt;

/// 아래 모델 데이터는 막상 사용하려고 보니
/// 큰 의미 없게 느껴져서 사용하지 않았습니다. 이러한 방식의 호불호 질문을 드립니다.
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
