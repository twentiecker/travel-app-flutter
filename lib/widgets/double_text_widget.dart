import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigText, smallText;

  const AppDoubleTextWidget(
      {Key? key, required this.bigText, required this.smallText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: Styles.headlineStyle2,
        ),
        /* widget for read a tap from user */
        InkWell(
          onTap: () {
            if (kDebugMode) {
              print("You tapped view $bigText");
              print(AppLayout.getScreenHeight());
              print(AppLayout.getScreenWidth());
            }
          },
          child: Text(
            smallText,
            style: Styles.textStyle.copyWith(color: Styles.primaryColor),
          ),
        )
      ],
    );
  }
}
