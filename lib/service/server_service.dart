import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:event_organizer/constants/app_constants.dart';
import 'package:event_organizer/model/event.dart';

final dio = Dio();

class ServerService {
  static List<EventModel> events = [];

  static Future<List<EventModel>> getEvents() async {
    final response = await dio.get('${AppConstants.serverUrl}/events');
    final data = response.data as List;
    events = data.map((e) => EventModel.fromJson(e)).toList();
    log("All events received from server: $events");
    return events;
  }

  static int getEventCount() {
    return events.length;
  }

  static EventModel getEvent(int index) {
    return events[index];
  }

  static Future<int> addEvent(EventModel event) async {
    final response = await dio.post(
      '${AppConstants.serverUrl}/event',
      data: jsonEncode(event.toMap()),
    );
    log("Event added to server: $event");
    event.id = response.data['id'] as int;
    events.add(event);
    return event.id;
  }

  static Future<int> updateEvent(EventModel event) async {
    final response = await dio.put(
      '${AppConstants.serverUrl}/events/${event.id}',
      data: jsonEncode(event.toMap()),
    );
    final index = events.indexWhere((element) => element.id == event.id);
    if (index != -1) {
      events[index] = event;
    }
    log("Event updated on server: $event");
    return event.id;
  }

  static Future<int> deleteEvent(int id) async {
    final response = await dio.delete('${AppConstants.serverUrl}/events/$id');
    return response.data['id'] as int;
  }

  static List<EventModel> getInProgress() {
    List<EventModel> localEvent = events
        .where((element) => element.status.toLowerCase() == "in progress")
        .toList();
    log("All events received from server: $localEvent");
    return localEvent;
  }

  static List<EventModel> getTop5() {
    List<EventModel> localEvent = List.from(events);
    localEvent.sort((a, b) => b.participants.compareTo(a.participants));
    localEvent = localEvent.reversed.toList().sublist(0, 5);
    log("All events received from server: $localEvent");
    return localEvent;
  }
}
