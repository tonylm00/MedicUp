import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart' as rManager;
import 'package:momento_medico/pages/searchByName.dart';
import 'package:momento_medico/pages/searchByPrincipioAttivo.dart';
import 'package:momento_medico/utils/routes.dart';
import 'package:momento_medico/pages/homepage.dart';

var rootHandler =
    rManager.Handler(handlerFunc: (context, Map<String, List<String>> params) {
  Navigator.of(context!).pushNamed(Routes.homepage);
  return const Homepage(title: 'Homepage');
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
