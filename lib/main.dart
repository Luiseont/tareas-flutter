import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/src/bloc/reminders/reminder_bloc.dart';
import 'src/app.dart';

void main() async {
  runApp(BlocProvider(
    create: (context) => ReminderBloc(),
    child: App(),
  ));
}
