import 'package:flutter/material.dart';
import 'package:frontend/pages/accountInfo.dart';
import 'package:frontend/pages/armadiettoPage.dart';
import 'package:frontend/pages/farmaciList.dart';
import 'package:frontend/pages/farmacoDetail.dart';
import 'package:frontend/pages/getReminders.dart';
import 'package:frontend/pages/intropage.dart';
import 'package:frontend/pages/signin.dart';
import 'package:frontend/pages/signup.dart';
import 'package:frontend/pages/test.dart';

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
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.grey,
          fontFamily: 'Raleway'),
      home: const IntroPage(),
      navigatorKey: MyApp.navigatorKey,
      routes: <String, WidgetBuilder>{
        '/intro': (context) => const IntroPage(),
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => const SignInPage(),
        '/homepage': (context) => const Homepage(),
        '/accountinfo': (context) => const AccountPage(),
        '/armadietto': (context) => const ArmadiettoPage(),
        '/farmaci': (context) => const FarmaciListPage(),
        '/promemoria': (context) => const PromemoriaListPage(),
        '/farmacodetail': (context) => const FarmacoDetailPage(),
        '/research': (context) => const ResearchPage(),
        '/searchbyname': (context) => const SearchByName(),
        '/searchbyprincipioattivo': (context) =>
            const SearchByPrincipioAttivo(),
        '/homepage_med': (context) => const Homepage(),
      },
    );
  }
}
