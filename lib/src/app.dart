import 'package:flutter/material.dart';
import 'utils/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('La ruta especificada no existe ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext build) => defaultRoute());
      },
    );
  }
}
