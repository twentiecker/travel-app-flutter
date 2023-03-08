import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/screens/ticket_view.dart';
import 'package:my_app/utils/app_info_list.dart';
import 'package:my_app/utils/app_styles.dart';
import '../utils/app_layout.dart';
import '../widgets/ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              Gap(40),
              Text(
                'Tickets',
                style: Styles.headlineStyle1,
              ),
              Gap(20),
              AppTicketTabs(
                leftText: 'Upcoming',
                rightText: 'Previous',
              ),
              Gap(20),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: TicketView(
                  ticket: ticketList[0],
                  isColor: true,
                  isDetail: true,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
