import 'dart:developer';

import 'package:event_organizer/model/event.dart';
import 'package:event_organizer/service/server_service.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final nameController = TextEditingController();
  final teamController = TextEditingController();
  final detailsController = TextEditingController();
  final statusController = TextEditingController();
  final participantsController = TextEditingController();
  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Event"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: teamController,
              decoration: const InputDecoration(
                labelText: "Team",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: detailsController,
              decoration: const InputDecoration(
                labelText: "Details",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: statusController,
              decoration: const InputDecoration(
                labelText: "Status",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: participantsController,
              decoration: const InputDecoration(
                labelText: "Participants",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                labelText: "Type",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            FloatingActionButton(
              onPressed: () async {
                final newEvent = EventModel(
                  id: 0,
                  name: nameController.text,
                  team: teamController.text,
                  details: detailsController.text,
                  status: statusController.text,
                  participants: int.parse(participantsController.text),
                  type: typeController.text,
                );
                await ServerService.addEvent(newEvent).then((value) => {
                      if (value != 0)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Event added successfully'),
                            ),
                          ),
                        }
                      else
                        {
                          log('Failed to add event'),
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to add event'),
                            ),
                          ),
                        },
                      // Go back to the partner list screen
                      Navigator.pop(context)
                    });
              },
              child: const Text("Save"),
            )
          ]),
        ));
  }
}
