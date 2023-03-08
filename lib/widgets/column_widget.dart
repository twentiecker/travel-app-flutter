import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class AppColumn extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String topText, bottomText;
  final bool? isColor;

  const AppColumn(
      {Key? key,
      required this.alignment,
      required this.topText,
      required this.bottomText,
      this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      crossAxisAlignment: alignment,
      children: [
        Text(
          topText,
          style: isColor == null
              ? Styles.headlineStyle3.copyWith(color: Colors.white)
              : Styles.headlineStyle3.copyWith(color: Colors.black),
        ),
        const Gap(5),
        Text(
          bottomText,
          style: isColor == null
              ? Styles.headlineStyle4.copyWith(color: Colors.white)
              : Styles.headlineStyle4,
        )
      ],
    );
  }
}
