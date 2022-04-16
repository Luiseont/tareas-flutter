part of 'package:reminder/src/bloc/reminders/reminder_bloc.dart';

@immutable
class ReminderState {
  List<Reminder> reminders;
  ReminderState(this.reminders);

  @override
  List<Object> get props => reminders;
}

class InitialState extends ReminderState {
  InitialState() : super([]);
}

class UpdateRemindersState extends ReminderState {
  final List<Reminder> reminder;
  UpdateRemindersState(this.reminder) : super(reminder);
}
