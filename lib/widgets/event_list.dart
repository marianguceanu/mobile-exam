import 'dart:developer';

import 'package:event_organizer/model/event.dart';
import 'package:event_organizer/service/server_service.dart';
import 'package:event_organizer/widgets/add_event_screen.dart';
import 'package:event_organizer/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EventsListView extends StatefulWidget {
  const EventsListView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EventsListViewState createState() => _EventsListViewState();
}

class _EventsListViewState extends State<EventsListView> {
  Widget listOfItems() {
    return ListView.builder(
        itemCount: ServerService.getEventCount(),
        itemBuilder: (context, index) {
          EventModel event = ServerService.getEvent(index);
          return EventCard(
              event: event,
              deleteEvent: () {
                ServerService.deleteEvent(event.id).then<void>((value) => {
                      if (value != 0)
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Event deleted successfully"),
                          ))
                        }
                      else
                        {
                          log("Event not deleted"),
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("event not deleted"),
                            ),
                          )
                        },
                      setState(() {})
                    });
              },
              updateEvent: () {
                ServerService.updateEvent(event).then((value) => {
                      if (value != 0)
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Event updated successfully"),
                          ))
                        }
                      else
                        {
                          log("Event not updated"),
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Event not updated"),
                          ))
                        },
                      setState(() {})
                    });
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: listOfItems(),
      floatingActionButton: TextButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEventScreen()),
          ).then<void>((value) => setState(() {}));
        },
      ),
    );
  }
}
