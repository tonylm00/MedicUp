import 'package:fluro/fluro.dart';

import 'routes_handlers.dart';

class Routes {
  static String intro = '/intro';

  static String signup = '/signup';
  static String signin = '/signin';
  static String homepage = '/homepage';
  static String research = '/research';

  static String searchByName = '/searchbyname';
  static String searchByPrincipioAttivo = '/searchbyprincipioattivo';

  static void configureRoutes(FluroRouter router) {
    // INTRO
    router.define(intro,
        handler: introHandler, transitionType: TransitionType.none);

    // SIGNUP
    router.define(signup,
        handler: signupHandler, transitionType: TransitionType.none);

    // SIGNIN
    router.define(signin,
        handler: signinHandler, transitionType: TransitionType.none);

    // HOMEPAGE
    router.define(homepage,
        handler: homepageHandler, transitionType: TransitionType.none);

    // RESEARCH
    router.define(research,
        handler: researchHandler, transitionType: TransitionType.none);

    //SEARCH BY NAME
    router.define(searchByName,
        handler: searchByNameHandler, transitionType: TransitionType.none);

    //SEARCH BY PRINCIPIO ATTIVO
    router.define(searchByPrincipioAttivo,
        handler: searchByNameHandler, transitionType: TransitionType.none);
  }
}
