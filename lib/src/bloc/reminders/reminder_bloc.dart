import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:reminder/src/models/reminder.dart';
import 'package:reminder/src/providers/reminders_provider.dart';

part 'package:reminder/src/bloc/reminders/reminder_events.dart';
part 'package:reminder/src/bloc/reminders/reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvents, ReminderState> {
  final ReminderProvider provider = ReminderProvider();

  ReminderBloc() : super(InitialState()) {
    on<AddReminderEvent>((event, emit) {
      addReminder(event.reminder);
      add(GetRemindersEvent());
    });

    on<DeleteReminderEvent>((event, emit) async {
      removeReminder(event.reminder);
      add(GetRemindersEvent());
    });

    on<GetRemindersEvent>((event, emit) async {
      emit(UpdateRemindersState(await getReminders()));
    });
  }

  void addReminder(Reminder newReminder) {
    provider.addReminder(newReminder);
  }

  void removeReminder(Reminder reminder) {
    provider.deleteReminder(reminder);
  }

  Future<List<Reminder>> getReminders() async {
    final reminderList = await provider.getReminders();
    return reminderList;
  }
}
