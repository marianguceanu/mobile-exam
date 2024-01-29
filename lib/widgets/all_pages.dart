import 'package:event_organizer/widgets/analytics_list_view.dart';
import 'package:event_organizer/widgets/event_list.dart';
import 'package:event_organizer/widgets/participants_list_view.dart';
import 'package:flutter/material.dart';

class AllPages extends StatefulWidget {
  const AllPages({Key? key}) : super(key: key);

  @override
  _AllPagesState createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.notifications_outlined)),
                label: 'InProgress',
              ),
              NavigationDestination(
                icon: Badge(
                  child: Icon(Icons.messenger_outlined),
                ),
                label: 'Analytics',
              ),
            ],
          ),
          body: <Widget>[
            const EventsListView(),
            const ParticipantsListView(),
            const AnalyticsListView(),
          ][currentPageIndex],
        ));
  }
}
