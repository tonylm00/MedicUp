//inserire routing
import 'package:fluro/fluro.dart';
import 'package:momento_medico/utils/routes_handlers.dart';

class Routes {
  static String homepage = '/homepage';
  static String search = '/search';


  static void configureRoutes(FluroRouter router) {
    // HOMEPAGE
    router.define(homepage,
        handler: rootHandler, transitionType: TransitionType.none);

    //SEARCH
    router.define(search,
        handler: searchHandler, transitionType: TransitionType.none);
  }
}
