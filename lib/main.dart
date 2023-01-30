import 'package:flutter/material.dart';
import 'package:momento_medico/pages/homepage.dart';
import 'package:momento_medico/pages/intropage.dart';
import 'package:momento_medico/pages/searchByName.dart';
import 'package:momento_medico/pages/searchByPrincipioAttivo.dart';
import 'package:momento_medico/pages/signin.dart';
import 'package:momento_medico/pages/signup.dart';
import 'package:momento_medico/utils/ResearchBar.dart';
import 'package:momento_medico/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedicUP',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.grey),
      home: const IntroPage(),
      navigatorKey: MyApp.navigatorKey,
      routes: <String, WidgetBuilder>{
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => const SignInPage(),
        '/homepage': (context) => const Homepage(),
        '/research': (context) => const ResearchPage(),
        '/searchbyname': (context) => const SearchByName(),
        '/searchbyprincipioattivo': (context) =>
            const SearchByPrincipioAttivo(),
      },
    );
  }
}
