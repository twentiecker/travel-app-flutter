import 'package:flutter/material.dart';
import '../utils/app_layout.dart';

class AppTicketTabs extends StatelessWidget {
  final String leftText, rightText;

  const AppTicketTabs(
      {Key? key, required this.leftText, required this.rightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    /*  "FittedBox" used to prevent  *
     *  issue about unfitted display */
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFFF4F6FD)),
        child: Row(
          children: [
            /* left side toggle */
            Container(
                width: size.width * 0.44,
                padding: const EdgeInsets.symmetric(vertical: 7),
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(50)),
                    color: Colors.white),
                child: Center(
                  child: Text(leftText),
                )),
            /* right side toggle */
            Container(
                width: size.width * 0.44,
                padding: const EdgeInsets.symmetric(vertical: 7),
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(50)),
                    color: Colors.transparent),
                child: Center(
                  child: Text(rightText),
                )),
          ],
        ),
      ),
    );
  }
}
