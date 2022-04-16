import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/src/bloc/reminders/reminder_bloc.dart';
import 'package:reminder/src/models/reminder.dart';

class ReminderForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyForm();
  }
}

class MyForm extends State<ReminderForm> {
  final _key = GlobalKey<FormState>();

  final textNameController = TextEditingController();
  final textDescriptionController = TextEditingController();

  @override
  void dispose() {
    textNameController.dispose();
    textDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ingresa un nombre para el recordatorio.";
                    }
                  },
                  controller: textNameController,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresa una descripcion.";
                    }
                  },
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  controller: textDescriptionController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Evento registrado!'),
                        ));

                        final Reminder newReminder = Reminder(
                            name: textNameController.text,
                            description: textDescriptionController.text);
                        BlocProvider.of<ReminderBloc>(context)
                            .add(AddReminderEvent(reminder: newReminder));

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Enviar"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
