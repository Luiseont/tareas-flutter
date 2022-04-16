import 'dart:async';
import 'package:path/path.dart';
import 'package:reminder/src/models/reminder.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  String databasePath = '';
  String path = '';
  String name = 'reminders.db';

  DB();

  Future _init() async {
    databasePath = await getDatabasesPath();
    path = join(databasePath, name);
    return openDatabase(path, version: 1, onCreate: (con, version) async {
      await con.execute(
          'CREATE TABLE reminders (id INTEGER PRIMARY KEY, name TEXT, description TEXT)');
    });
  }

  Future add(Reminder reminder) async {
    final Database conn = await _init();
    return conn.insert(
      'reminders',
      reminder.toMap(),
    );
  }

  Future query(String query) async {
    final Database conn = await _init();
    final result = await conn.query(query);
    return result;
  }

  Future delete(Reminder reminder) async {
    final Database conn = await _init();
    await conn.delete(
      'reminders',
      where: "id = ?",
      whereArgs: [reminder.id],
    );
  }

  Future update(Reminder reminder) async {
    final Database conn = await _init();
    return conn.insert(
      'reminders',
      reminder.toMap(),
    );
  }
}
