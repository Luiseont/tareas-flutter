import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/reminders/reminder_bloc.dart';
import 'package:reminder/src/models/reminder.dart';

class ViewReminder extends StatelessWidget {
  const ViewReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    //saco la informacion del recordatorio del estado de la aplicacion.
    Reminder reminder = BlocProvider.of<ReminderBloc>(context)
        .state
        .reminders
        .firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(title: Text(reminder.name), centerTitle: true),
      body: Card(
        child: Container(
          padding: const EdgeInsets.all(15),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  reminder.description,
                  textAlign: TextAlign.center,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
