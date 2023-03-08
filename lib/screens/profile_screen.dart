import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/utils/app_layout.dart';
import 'package:my_app/utils/app_styles.dart';
import '../widgets/column_widget.dart';
import '../widgets/dash_layout_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Gap(20),
            /* ticket logo */
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: 86,
                  width: 86,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('assets/images/img_1.png'))),
                ),
                Gap(10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width - 141,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Book Tickets',
                                style: Styles.headlineStyle1,
                              ),
                              Text(
                                'Edit',
                                style: Styles.textStyle.copyWith(
                                    color: Styles.primaryColor,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        Gap(2),
                        Text(
                          'New-York',
                          style: Styles.headlineStyle4,
                        ),
                        Gap(8),
                        Container(
                          padding: EdgeInsets.only(
                              left: 3, top: 5, bottom: 5, right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFFFEF4F3)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF526799),
                                ),
                                child: Icon(
                                  FluentSystemIcons.ic_fluent_shield_filled,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              // Gap(5),
                              Text(
                                'Premium status',
                                style: TextStyle(
                                    color: Color(0xFF526799),
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Gap(8),
            Divider(
              color: Colors.grey.shade500,
            ),
            Gap(8),
            /* banner award */
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Styles.primaryColor),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                          color: Styles.primaryColor,
                          size: 27,
                        ),
                      ),
                      Gap(12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You\'ve got a new award',
                            style: Styles.headlineStyle2.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'You have 150 flights in a year',
                            style: Styles.textStyle
                                .copyWith(color: Colors.white.withOpacity(0.9)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: -45,
                    top: -40,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 18, color: Color(0xFF264CD2))),
                    ))
              ],
            ),
            Gap(25),
            /* create text Accumulated miles */
            Text(
              'Accumulated miles',
              style: Styles.headlineStyle2,
            ),
            /* forth row */
            Gap(30),
            Center(
                child: Text(
              '192802',
              style: Styles.textStyle
                  .copyWith(fontSize: 45, fontWeight: FontWeight.w600),
            )),
            Gap(20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFFFEF4F3),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: Column(
                children: [
                  /* fifth row */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Miles accrued',
                        style: Styles.headlineStyle4.copyWith(fontSize: 16),
                      ),
                      Text(
                        '23 May 2021',
                        style: Styles.headlineStyle4.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                  Gap(4),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                  Gap(4),
                  /* sixth row */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumn(
                        alignment: CrossAxisAlignment.start,
                        topText: '23 042',
                        bottomText: 'Miles',
                        isColor: true,
                      ),
                      AppColumn(
                        alignment: CrossAxisAlignment.end,
                        topText: 'Airline CO',
                        bottomText: 'Received from',
                        isColor: true,
                      ),
                    ],
                  ),
                  Gap(10),
                  AppDashLayoutWidget(isColor: true,),
                  Gap(10),
                  /* sevent row */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumn(
                        alignment: CrossAxisAlignment.start,
                        topText: '24',
                        bottomText: 'Miles',
                        isColor: true,
                      ),
                      AppColumn(
                        alignment: CrossAxisAlignment.end,
                        topText: 'McDonal\'s',
                        bottomText: 'Received from',
                        isColor: true,
                      ),
                    ],
                  ),
                  Gap(10),
                  AppDashLayoutWidget(isColor: true,),
                  Gap(10),
                  /* eight row */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumn(
                        alignment: CrossAxisAlignment.start,
                        topText: '52 340',
                        bottomText: 'Miles',
                        isColor: true,
                      ),
                      AppColumn(
                        alignment: CrossAxisAlignment.end,
                        topText: 'Exuma',
                        bottomText: 'Received from',
                        isColor: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(25),
            /* ninth row */
            InkWell(
              onTap: () {
                if (kDebugMode) {
                  print("You tapped more miles");
                }
              },
              child: Center(
                  child: Text(
                'How to get more miles',
                style: Styles.textStyle.copyWith(color: Styles.primaryColor),
              )),
            )
          ],
        ),
      ),
    );
  }
}
