import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/screens/ticket_view.dart';
import 'package:my_app/utils/app_styles.dart';
import '../utils/app_info_list.dart';
import '../widgets/double_text_widget.dart';
import 'hotel_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            /* padding: const EdgeInsets.only(left: 20, top: 40, right: 20), */
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                /* use Gap dependencies to make space vertically */
                const Gap(40),
                /* create greeting message and ticket logo */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /* greeting message */
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: Styles.headlineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Book Tickets",
                          style: Styles.headlineStyle1,
                        ),
                      ],
                    ),
                    /* ticket logo */
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/img_1.png'))),
                    )
                  ],
                ),
                const Gap(25),
                /* create search bar */
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      Text(
                        'Search',
                        style: Styles.headlineStyle4,
                      )
                    ],
                  ),
                ),
                const Gap(40),
                /* create upcoming flights and view all with custom widget */
                const AppDoubleTextWidget(
                  bigText: "Upcoming Flights",
                  smallText: "View All",
                )
              ],
            ),
          ),
          const Gap(15),
          /* create scrollable ticket horizontally */
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList
                  .map((singleTicket) => TicketView(ticket: singleTicket))
                  .toList(),
            ),
          ),
          const Gap(15),
          Container(
            /* padding: const EdgeInsets.only(left: 20, top: 40, right: 20), */
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                /* create hotels and view all with custom widget */
                AppDoubleTextWidget(
                  bigText: "Hotels",
                  smallText: "View All",
                )
              ],
            ),
          ),
          const Gap(15),
          /* create scrollable hotel horizontally */
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Row(
                /* call hotelList and iterate it into HotelScreen class */
                children: hotelList
                    .map((singleHotel) => HotelScreen(hotel: singleHotel))
                    .toList()),
          )
        ],
      ),
    );
  }
}
