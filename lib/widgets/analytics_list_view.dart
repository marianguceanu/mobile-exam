import 'package:event_organizer/model/event.dart';
import 'package:event_organizer/service/server_service.dart';
import 'package:event_organizer/widgets/in_progress_event.dart';
import 'package:flutter/material.dart';

class AnalyticsListView extends StatefulWidget {
  const AnalyticsListView({Key? key}) : super(key: key);

  @override
  _AnalyticsListViewState createState() => _AnalyticsListViewState();
}

class _AnalyticsListViewState extends State<AnalyticsListView> {
  List<EventModel> events = [];

  Widget listOfItems() {
    events = ServerService.getInProgress();
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          EventModel event = events[index];
          return InProgressEventCard(
            event: event,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    events = ServerService.getTop5();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Events"),
        ),
        body: events.isEmpty
            ? const Center(
                child: Text("No events found"),
              )
            : listOfItems());
  }
}
