import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart' as rManager;
import 'package:frontend/pages/paziente/accountInfo.dart';
import 'package:frontend/pages/paziente/armadiettoPage.dart';
import 'package:frontend/pages/medico/farmaciDetailMed.dart';
import 'package:frontend/pages/paziente/farmaciList.dart';
import 'package:frontend/pages/medico/farmaciMedList.dart';
import 'package:frontend/pages/paziente/farmacoDetail.dart';
import 'package:frontend/pages/paziente/getReminders.dart';
import 'package:frontend/pages/medico/homepageMed.dart';
import 'package:frontend/utils/routes.dart';

import '../pages/paziente/homepage.dart';
import '../pages/intropage.dart';
import '../pages/searchByName.dart';
import '../pages/searchByPrincipioAttivo.dart';
import '../pages/signin.dart';
import '../pages/signup.dart';
import 'ResearchBar.dart';

var introHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.intro);
  return const IntroPage();
});

var farmaciListMedHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.farmaciListMed);
  return const FarmaciListPageMed();
});


var farmaciDetailMedHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.farmaciDetailMed);
  return const FarmacoDetailPageMed();
});

var homepageMedHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.homepageMed);
  return const HomepageMed();
});

var promemoriaHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.promemoria);
  return const PromemoriaListPage();
});

var farmacoDetailHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.farmacoDetail);
  return const FarmacoDetailPage();
});


var farmaciHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.farmaci);
  return const FarmaciListPage();
});

var armadiettoHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.armadietto);
  return const ArmadiettoPage();
});

var accountInfoHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.accountInfo);
  return const AccountPage();
});

var signupHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.signup);
  return SignUpPage();
});

var signinHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.signin);
  return const SignInPage();
});

var researchHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.research);
  return const ResearchPage();
});

var homepageHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.homepage);
  return const Homepage();
});

var searchByNameHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.searchByName);
  return const SearchByName();
});

var searchByPrincipioAttivoHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.searchByPrincipioAttivo);
  return const SearchByPrincipioAttivo();
});
