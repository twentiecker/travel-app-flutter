import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/utils/app_layout.dart';
import 'package:my_app/utils/app_styles.dart';

import '../widgets/double_text_widget.dart';
import '../widgets/icon_text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          /* create title */
          Text(
            "What are\nyou looking for?",
            style: Styles.headlineStyle1.copyWith(fontSize: 35),
          ),
          const Gap(20),
          /* create toggle airline and hotels
          *  "FittedBox" used to prevent iphone
          *  issue about unfitted display */
          FittedBox(
            child: Container(
              padding: EdgeInsets.all(3.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFF4F6FD)),
              child: Row(
                children: [
                  /* left side toggle */
                  Container(
                      width: size.width * 0.44,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(50)),
                          color: Colors.white),
                      child: Center(
                        child: Text('Airline Tickets'),
                      )),
                  /* right side toggle */
                  Container(
                      width: size.width * 0.44,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(50)),
                          color: Colors.transparent),
                      child: Center(
                        child: Text('Hotels'),
                      )),
                ],
              ),
            ),
          ),
          Gap(25),
          AppIconText(
            icon: Icons.flight_takeoff_rounded,
            text: "Departure",
          ),
          Gap(20),
          AppIconText(
            icon: Icons.flight_land_rounded,
            text: "Arrival",
          ),
          Gap(25),
          Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xD91130CE)),
              child: Center(
                child: Text(
                  'Find Tickets',
                  style: Styles.textStyle.copyWith(color: Colors.white),
                ),
              )),
          Gap(40),
          AppDoubleTextWidget(
            bigText: "Upcoming Flights",
            smallText: "View All",
          ),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 400,
                width: size.width * 0.42,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 1,
                          spreadRadius: 1)
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/sit.jpg"))),
                    ),
                    Gap(12),
                    Text(
                      "20% discount on the early booking of this flight. Don't miss this chance",
                      style: Styles.headlineStyle2,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: 175,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xFF3AB8B8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Discount\nfor survey',
                                style: Styles.headlineStyle2.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Gap(10),
                            Text(
                                'Take the survey about our services and get discount',
                                style: Styles.headlineStyle2.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
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
                                border: Border.all(
                                  width: 18,
                                  color: Color(0xFF189999),
                                ),
                                color: Colors.transparent),
                          ))
                    ],
                  ),
                  Gap(15),
                  Container(
                    width: size.width * 0.44,
                    height: 210,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xFFEC6545)),
                    child: Column(
                      children: [
                        Text(
                          'Take love',
                          style: Styles.headlineStyle2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Gap(5),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(text: ';-)', style: TextStyle(fontSize: 38)),
                          TextSpan(text: ':-)', style: TextStyle(fontSize: 50)),
                          TextSpan(text: ';-)', style: TextStyle(fontSize: 38))
                        ]))
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
