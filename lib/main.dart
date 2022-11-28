import 'package:flutter/material.dart';
import 'package:momento_medico/pages/homepage.dart';
import 'package:momento_medico/pages/search.dart';
import 'package:momento_medico/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedicUP',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.grey),
      home: const Homepage(title: 'MedicUP'),
      navigatorKey: MyApp.navigatorKey,
      routes: <String, WidgetBuilder>{
        '/homepage': (context) => const Homepage(title: 'Homepage'),
        '/search': (context) => const Search(),
      },
    );
  }
}
