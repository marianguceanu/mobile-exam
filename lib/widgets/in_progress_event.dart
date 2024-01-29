import 'package:event_organizer/model/event.dart';
import 'package:flutter/material.dart';

class InProgressEventCard extends StatefulWidget {
  final EventModel event;
  const InProgressEventCard({Key? key, required this.event}) : super(key: key);

  @override
  _InProgressEventCardState createState() => _InProgressEventCardState();
}

class _InProgressEventCardState extends State<InProgressEventCard> {
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
          )
        ]));
  }
}
