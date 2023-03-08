import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/column_widget.dart';
import '../widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;

  const TicketView({Key? key, required this.ticket, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* call method to get size of device screen */
    final size = AppLayout.getSize(context);
    return SizedBox(
      /* set dynamic width based on device screen */
      width: size.width * 0.85,
      height: GetPlatform.isAndroid == true ? 167 : 169,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            /* showing the blue top part of the card/ticket */
            Container(
              decoration: BoxDecoration(
                  color:
                      isColor == null ? const Color(0xFF526799) : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /* create name of origin, drawing and destination place */
                  Row(
                    children: [
                      Text(
                        '${ticket['from']['code']}',
                        style: isColor == null
                            ? Styles.headlineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headlineStyle3
                                .copyWith(color: Colors.black),
                      ),
                      /* give space between evenly */
                      const Spacer(),
                      /* create small circle for plane icon */
                      const ThickContainer(
                        isColor: true,
                      ),
                      /* create overlay within route and plane icon with Stack widget */
                      Expanded(
                          child: Stack(children: [
                        SizedBox(
                          height: 24,
                          /* using layout builder to get width between two items automatically */
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              if (kDebugMode) {
                                print(
                                    "The width is: ${constraints.constrainWidth()}");
                              }
                              /* draw route for plane using iteration list with Flex widget */
                              return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                /* iterate the box ("-") */
                                children: List.generate(
                                    (constraints.constrainWidth() / 6).floor(),
                                    (index) => SizedBox(
                                          width: 3,
                                          height: 1,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: isColor == null
                                                    ? Colors.white
                                                    : const Color(0xFF8ACCF7)),
                                          ),
                                        )),

                                /*children: List.generate(
                                    (constraints.constrainWidth() / 6).floor(),
                                    (index) => const Text(
                                          '-',
                                          style: TextStyle(color: Colors.white),
                                        )),*/
                              );
                            },
                          ),
                        ),
                        /* rotate icon into horizontal */
                        Center(
                          child: Transform.rotate(
                            angle: 1.5,
                            child: Icon(
                              Icons.local_airport_rounded,
                              color: isColor == null
                                  ? Colors.white
                                  : const Color(0xFF8ACCF7),
                            ),
                          ),
                        ),
                      ])),
                      const ThickContainer(
                        isColor: true,
                      ),
                      const Spacer(),
                      /* create destination text */
                      Text(
                        '${ticket['to']['code']}',
                        style: isColor == null
                            ? Styles.headlineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headlineStyle3
                                .copyWith(color: Colors.black),
                      )
                    ],
                  ),
                  const Gap(3),
                  /* create information below origin, drawing and destination place */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text(
                            '${ticket['from']['name']}',
                            style: isColor == null
                                ? Styles.headlineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headlineStyle4,
                          )),
                      Text(
                        '${ticket['flying_time']}',
                        style: isColor == null
                            ? Styles.headlineStyle4
                                .copyWith(color: Colors.white)
                            : Styles.headlineStyle4.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          width: 100,
                          child: Text(
                            '${ticket['to']['name']}',
                            style: isColor == null
                                ? Styles.headlineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headlineStyle4,
                            textAlign: TextAlign.end,
                          )),
                    ],
                  )
                ],
              ),
            ),
            /* showing the orange middle part of the card/ticket */
            Container(
              color: isColor == null ? Styles.orangeColor : Colors.white,
              child: Row(
                children: [
                  /* create half circle in the left side of ticket */
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Styles.bgColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                  ),
                  /* create line cut in the middle of ticket */
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
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
                    ),
                  )),
                  /* create half circle in the right side of ticket */
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Styles.bgColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            /* showing the orange bottom part of the card/ticket */
            Container(
              decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))),
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumn(
                          alignment: CrossAxisAlignment.start,
                          topText: ticket['date'],
                          bottomText: 'Date'),
                      AppColumn(
                          alignment: CrossAxisAlignment.center,
                          topText: ticket['departure_time'],
                          bottomText: 'Departure time'),
                      AppColumn(
                          alignment: CrossAxisAlignment.end,
                          topText: '${ticket['number']}',
                          bottomText: 'Number'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
