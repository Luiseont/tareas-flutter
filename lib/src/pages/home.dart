import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recordatorios"),
          centerTitle: true,
        ),
        body: ListView(children: lista()));
  }

  List<Widget> lista() {
    final listOfItems = <Widget>[];

    for (String item in items) {
      listOfItems.add(ListTile(title: Text(item)));
      listOfItems.add(Divider());
    }

    return listOfItems;
  }
}
