import 'package:flutter/material.dart';
import 'package:frontend/pages/intropage.dart';
import 'package:frontend/pages/signin.dart';
import 'package:frontend/pages/signup.dart';

import 'pages/homepage.dart';
import 'pages/searchByName.dart';
import 'pages/searchByPrincipioAttivo.dart';
import 'utils/ResearchBar.dart';


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
