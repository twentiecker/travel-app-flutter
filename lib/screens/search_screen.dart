import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/utils/app_layout.dart';
import 'package:my_app/utils/app_styles.dart';
import '../widgets/double_text_widget.dart';
import '../widgets/icon_text_widget.dart';
import '../widgets/ticket_tabs.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          /* create title */
          Text(
            "What are\nyou looking for?",
            style: Styles.headlineStyle1.copyWith(fontSize: 35),
          ),
          const Gap(20),
          /* create toggle airline tickets and hotels */
          const AppTicketTabs(
            leftText: 'Airline Tickets',
            rightText: 'Hotels',
          ),
          const Gap(25),
          const AppIconText(
            icon: Icons.flight_takeoff_rounded,
            text: "Departure",
          ),
          const Gap(20),
          const AppIconText(
            icon: Icons.flight_land_rounded,
            text: "Arrival",
          ),
          const Gap(25),
          Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xD91130CE)),
              child: Center(
                child: Text(
                  'Find Tickets',
                  style: Styles.textStyle.copyWith(color: Colors.white),
                ),
              )),
          const Gap(40),
          const AppDoubleTextWidget(
            bigText: "Upcoming Flights",
            smallText: "View All",
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 400,
                width: size.width * 0.42,
                padding: const EdgeInsets.all(15),
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
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/sit.jpg"))),
                    ),
                    const Gap(12),
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
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: const Color(0xFF3AB8B8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Discount\nfor survey',
                                style: Styles.headlineStyle2.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const Gap(10),
                            Text(
                                'Take the survey about our services and get discount',
                                style: Styles.headlineStyle2.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                          ],
                        ),
                      ),
                      /* set position of the widget */
                      Positioned(
                          right: -45,
                          top: -40,
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 18,
                                  color: const Color(0xFF189999),
                                ),
                                color: Colors.transparent),
                          ))
                    ],
                  ),
                  const Gap(15),
                  Container(
                    width: size.width * 0.44,
                    height: 210,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xFFEC6545)),
                    child: Column(
                      children: [
                        Text(
                          'Take love',
                          style: Styles.headlineStyle2.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const Gap(15),
                        /* set smiley face with RichText widget */
                        RichText(
                            text: const TextSpan(children: [
                          /* hold (windows + .) to get smiley face */
                          TextSpan(text: '😍', style: TextStyle(fontSize: 33)),
                          TextSpan(text: '🥰', style: TextStyle(fontSize: 45)),
                          TextSpan(text: '😘', style: TextStyle(fontSize: 33))
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
