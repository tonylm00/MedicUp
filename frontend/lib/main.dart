import 'package:flutter/material.dart';
import 'package:frontend/pages/paziente/accountInfo.dart';
import 'package:frontend/pages/paziente/armadiettoPage.dart';
import 'package:frontend/pages/medico/farmaciDetailMed.dart';
import 'package:frontend/pages/paziente/farmaciList.dart';
import 'package:frontend/pages/medico/farmaciMedList.dart';
import 'package:frontend/pages/paziente/farmacoDetail.dart';
import 'package:frontend/pages/paziente/getReminders.dart';
import 'package:frontend/pages/medico/homepageMed.dart';
import 'package:frontend/pages/intropage.dart';
import 'package:frontend/pages/signin.dart';
import 'package:frontend/pages/signup.dart';
import 'package:frontend/pages/test.dart';

import 'pages/paziente/homepage.dart';
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
        '/farmaciListMed': (context) => const FarmaciListPageMed(),
        '/farmaciDetailMed': (context) => const FarmacoDetailPageMed(),
        '/intro': (context) => const IntroPage(),
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => const SignInPage(),
        '/homepage': (context) => const Homepage(),
        '/homepageMed': (context) => const HomepageMed(),
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
