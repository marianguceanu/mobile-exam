import 'package:event_organizer/service/server_service.dart';
import 'package:event_organizer/widgets/all_pages.dart';
import 'package:flutter/material.dart';

void main() async {
  await ServerService.getEvents();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Demo', home: AllPages());
  }
}
