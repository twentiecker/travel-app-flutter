import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/column_widget.dart';
import '../widgets/dash_layout_widget.dart';
import '../widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor, isDetail;

  const TicketView(
      {Key? key, required this.ticket, this.isColor, this.isDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* call method to get size of device screen */
    final size = AppLayout.getSize(context);
    return SizedBox(
      /* set dynamic width based on device screen */
      width: size.width * 0.85,
      // height: GetPlatform.isAndroid == true ? 167 : 169,
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
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: AppDashLayoutWidget(isColor: true,),
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
                  borderRadius: BorderRadius.only(
                      bottomLeft: isDetail == null
                          ? const Radius.circular(21)
                          : const Radius.circular(0),
                      bottomRight: isDetail == null
                          ? const Radius.circular(21)
                          : const Radius.circular(0))),
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
                          bottomText: 'Date',
                          isColor: isColor),
                      AppColumn(
                          alignment: CrossAxisAlignment.center,
                          topText: ticket['departure_time'],
                          bottomText: 'Departure time',
                          isColor: isColor),
                      AppColumn(
                          alignment: CrossAxisAlignment.end,
                          topText: '${ticket['number']}',
                          bottomText: 'Number',
                          isColor: isColor),
                    ],
                  )
                ],
              ),
            ),
            if (isDetail != null) ...[
              Container(
                decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                ),
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 16),
                child: Column(
                  children: [
                    const Gap(4),
                    Divider(
                      color: Colors.grey.shade500,
                    ),
                    const Gap(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumn(
                          alignment: CrossAxisAlignment.start,
                          topText: 'Flutter Dash',
                          bottomText: 'Passenger',
                          isColor: true,
                        ),
                        AppColumn(
                            alignment: CrossAxisAlignment.end,
                            topText: '5221 478566',
                            bottomText: 'Passport',
                            isColor: true),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                ),
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 16),
                child: Column(
                  children: [
                    const Gap(4),
                    const AppDashLayoutWidget(isColor: true,),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumn(
                          alignment: CrossAxisAlignment.start,
                          topText: '0055 444 77147',
                          bottomText: 'Number of E-Ticket',
                          isColor: true,
                        ),
                        AppColumn(
                            alignment: CrossAxisAlignment.end,
                            topText: 'B2SG28',
                            bottomText: 'Booking code',
                            isColor: true),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                ),
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 16),
                child: Column(
                  children: [
                    const Gap(10),
                    const AppDashLayoutWidget(isColor: true,),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // crossAxisAlignment: alignment,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/visa.png',
                                  scale: 11,
                                ),
                                Text(
                                  ' *** 2462',
                                  style: Styles.headlineStyle3
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                            const Gap(5),
                            Text(
                              'Payment method',
                              style: Styles.headlineStyle4,
                            )
                          ],
                        ),
                        const AppColumn(
                            alignment: CrossAxisAlignment.end,
                            topText: '\$249.99',
                            bottomText: 'Price',
                            isColor: true),
                      ],
                    )
                  ],
                ),
              ),
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
                    const Gap(4),
                    Divider(
                      color: Colors.grey.shade500,
                    ),
                    const Gap(15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: 'twentiecker@gmail.com',
                        drawText: false,
                        color: Styles.textColor,
                        width: double.infinity,
                        height: 70,
                      ),
                    )
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
