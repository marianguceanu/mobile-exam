import 'package:event_organizer/model/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final EventModel event;
  final Function deleteEvent;
  final Function updateEvent;

  const EventCard(
      {super.key,
      required this.event,
      required this.deleteEvent,
      required this.updateEvent});

  @override
  // ignore: library_private_types_in_public_api
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(children: [
        Text(widget.event.name),
        const SizedBox(
          height: 8,
        ),
        Text(widget.event.team),
        const SizedBox(
          height: 8,
        ),
        Text(widget.event.details),
        const SizedBox(
          height: 8,
        ),
        Text(widget.event.status),
        const SizedBox(
          height: 8,
        ),
        Text(widget.event.participants.toString()),
        const SizedBox(
          height: 8,
        ),
        Text(widget.event.type),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Event"),
                        content: const Text(
                            "Are you sure you want to delete this event?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                widget.deleteEvent(widget.event.id);
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No"))
                        ],
                      );
                    });
              },
              child: const Icon(Icons.delete),
            ),
            ElevatedButton(
              onPressed: () {
                widget.updateEvent(widget.event);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ]),
    );
  }
}
