import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart' as rManager;
import 'package:frontend/utils/routes.dart';


import '../pages/homepage.dart';
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
