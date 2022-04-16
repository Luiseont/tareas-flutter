import 'package:flutter/material.dart';
import 'package:reminder/src/pages/reminders/partials/reminderForm.dart';

class AddReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo recordatorio'),
        centerTitle: true,
      ),
      body: ReminderForm(),
    );
  }
}
