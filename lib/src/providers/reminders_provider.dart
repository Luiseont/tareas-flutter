import 'package:reminder/src/models/reminder.dart';
import 'package:reminder/src/utils/db.dart';

class ReminderProvider {
  final db = DB();
  ReminderProvider();

  getReminders() async {
    final reminders = await db.query('reminders');

    return List.generate(
        reminders.length,
        (index) => Reminder(
            id: reminders[index]['id'],
            name: reminders[index]['name'],
            description: reminders[index]['description']));
  }

  addReminder(Reminder reminder) async {
    await db.add(reminder);
  }

  deleteReminder(Reminder reminder) async {
    await db.delete(reminder);
  }
}
