import 'package:event_organizer/model/event.dart';
import 'package:event_organizer/service/server_service.dart';
import 'package:event_organizer/widgets/in_progress_event.dart';
import 'package:flutter/material.dart';

class ParticipantsListView extends StatefulWidget {
  const ParticipantsListView({Key? key}) : super(key: key);

  @override
  _ParticipantsListViewState createState() => _ParticipantsListViewState();
}

class _ParticipantsListViewState extends State<ParticipantsListView> {
  List<EventModel> events = [];

  @override
  void initState() {
    super.initState();
  }

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: listOfItems(),
    );
  }
}
