import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDashLayoutWidget extends StatelessWidget {
  final bool? isColor;
  const AppDashLayoutWidget({Key? key, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:
          (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
              (constraints.constrainWidth() / 15).floor(),
                  (index) => SizedBox(
                width: 5,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: isColor == null
                          ? Colors.white
                          : Colors.grey.shade300),
                ),
              )),
        );
      },
    );
  }
}
