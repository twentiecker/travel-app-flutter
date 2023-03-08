import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/search_screen.dart';
import 'package:my_app/screens/ticket_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    /* make a change to UI to read the index that tapped by user */
    setState(() {
      _selectedIndex = index;
    });
    /* only executed in debug mode */
    if (kDebugMode) {
      print('The selected index is: $_selectedIndex');
    }
  }

  /* create bottom navigation bar */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        /* automatically read the index */
        currentIndex: _selectedIndex,
        /* execute _onItemTapped method when user tap on it */
        onTap: _onItemTapped,
        /* make a shadow */
        elevation: 10,
        /* removing label*/
        showSelectedLabels: false,
        showUnselectedLabels: false,
        /* set color for certain condition */
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        /* keep the selected icon in fixed position when user tap it */
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            /* use FluentSystemIcons dependencies for icon */
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: 'Ticket'),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: 'Profile'),
        ],
      ),
    );
  }
}
