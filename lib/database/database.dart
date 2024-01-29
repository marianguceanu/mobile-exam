import 'package:event_organizer/model/event.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static Future<void> getDbConnection() async {
    if (_db != null) {
      return;
    }
    _db = await _initDatabase();
  }

  static Future _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(
      join(await getDatabasesPath(), 'events.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE events(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            team TEXT,
            details TEXT,
            status TEXT,
            participants INTEGER,
            type TEXT
          )
        ''');
      },
    );
    return _db;
  }

  static Future<int> addEvent(EventModel event) async {
    return await _db!.insert('events', event.toMap());
  }

  static Future<List<EventModel>> getEvents() async {
    final List<Map<String, dynamic>> maps = await _db!.query('events');
    return List.generate(
      maps.length,
      (index) => EventModel(
        id: maps[index]['id'],
        name: maps[index]['name'],
        team: maps[index]['team'],
        details: maps[index]['details'],
        status: maps[index]['status'],
        participants: maps[index]['participants'],
        type: maps[index]['type'],
      ),
    );
  }

  static Future<int> updateEvent(EventModel event) async {
    return await _db!.update(
      'events',
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }

  static Future<int> deleteEvent(int id) async {
    return await _db!.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> clearEvents() async {
    await _db!.delete('events');
  }
}
