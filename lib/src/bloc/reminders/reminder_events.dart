part of 'package:reminder/src/bloc/reminders/reminder_bloc.dart';

@immutable
abstract class ReminderEvents {
  const ReminderEvents();
}

class AddReminderEvent extends ReminderEvents {
  final Reminder reminder;
  AddReminderEvent({required this.reminder});
}

class UpdateReminderEvent extends ReminderEvents {
  final Reminder reminder;
  UpdateReminderEvent({required this.reminder});
}

class DeleteReminderEvent extends ReminderEvents {
  final Reminder reminder;
  DeleteReminderEvent({required this.reminder});
}

class GetRemindersEvent extends ReminderEvents {
  GetRemindersEvent();
}
