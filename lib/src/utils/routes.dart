import 'package:flutter/widgets.dart';
import 'package:reminder/src/pages/reminders/listReminder.dart';
import 'package:reminder/src/pages/reminders/addReminder.dart';
import 'package:reminder/src/pages/reminders/viewReminder.dart';

Map<String, WidgetBuilder> appRoutes() {
  return {
    '/': (BuildContext context) => ListReminder(),
    'nuevo': (BuildContext context) => AddReminder(),
    'ver': (BuildContext context) => ViewReminder(),
  };
}

Widget defaultRoute() {
  return ListReminder();
}
