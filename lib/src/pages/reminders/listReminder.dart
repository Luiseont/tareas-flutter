import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/src/bloc/reminders/reminder_bloc.dart';
import 'package:reminder/src/models/reminder.dart';

class ListReminder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _listReminder();
  }
}

class _listReminder extends State<ListReminder> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReminderBloc>(context).add(GetRemindersEvent());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Recordatorios"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => {Navigator.pushNamed(context, 'nuevo')}),
        body: BlocBuilder<ReminderBloc, ReminderState>(
          builder: (context, state) {
            return ListView(
                padding: const EdgeInsets.all(8),
                //padding: const EdgeInsets.only(top: 5, bottom: 5),
                children: state.reminders.isNotEmpty
                    ? createList(state.reminders)
                    : [
                        const Card(
                            child: ListTile(
                          title: Text('No hay recordatorios.'),
                        ))
                      ]);
          },
        ));
  }

  /*

      */
  List<Widget> createList(List<Reminder> reminders) {
    return reminders
        .map((item) => Card(
                child: Row(
              children: [
                Expanded(
                    child: ListTile(
                  title: Text(item.name),
                  onTap: () =>
                      {Navigator.pushNamed(context, 'ver', arguments: item.id)},
                  trailing: GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Eliminar recordatorio'),
                              content: const Text('Esta seguro?'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        {Navigator.pop(context, 'cancel')},
                                    child: const Text('Cancelar')),
                                TextButton(
                                    onPressed: () {
                                      BlocProvider.of<ReminderBloc>(context)
                                          .add(DeleteReminderEvent(
                                              reminder: item));

                                      Navigator.pop(context);
                                    },
                                    child: const Text('Si')),
                              ],
                            )),
                    child: Container(
                      width: 100,
                      height: 200,
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.delete),
                    ),
                  ),
                  focusColor: Colors.grey,
                )),
              ],
            )))
        .toList();
  }
}
