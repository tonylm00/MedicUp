//inserire routing
import 'package:fluro/fluro.dart';
import 'package:momento_medico/utils/routes_handlers.dart';

class Routes {
  static String homepage = '/homepage';
  static String searchByName = '/searchbyname';
  static String searchByPrincipioAttivo = '/searchbyprincipioattivo';

  static void configureRoutes(FluroRouter router) {
    // HOMEPAGE
    router.define(homepage,
        handler: rootHandler, transitionType: TransitionType.none);

    //SEARCH BY NAME
    router.define(searchByName,
        handler: searchByNameHandler, transitionType: TransitionType.none);

    //SEARCH BY PRINCIPIO ATTIVO
    router.define(searchByPrincipioAttivo,
        handler: searchByNameHandler, transitionType: TransitionType.none);
  }
}
