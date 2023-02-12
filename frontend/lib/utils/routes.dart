import 'package:fluro/fluro.dart';

import 'routes_handlers.dart';

class Routes {
  static String intro = '/intro';

  static String signup = '/signup';
  static String signin = '/signin';
  static String homepage = '/homepage';
    static String homepageMed = '/homepageMed';

  static String armadietto = '/armadietto';
  static String farmaci = '/farmaci';
  static String promemoria = '/promemoria';
  static String farmacoDetail = '/farmacodetail';
  static String research = '/research';
  static String accountInfo = '/accountinfo';
  static String searchByName = '/searchbyname';
  static String searchByPrincipioAttivo = '/searchbyprincipioattivo';

  static void configureRoutes(FluroRouter router) {
    // INTRO
    router.define(intro,
        handler: introHandler, transitionType: TransitionType.none);

         // HOMEPAGE MEDICO
    router.define(homepageMed,
        handler: homepageMedHandler, transitionType: TransitionType.none);


  // PROMEMORIA
    router.define(promemoria,
        handler: promemoriaHandler, transitionType: TransitionType.none);


  // PROMEMORIA
    router.define(farmacoDetail,
        handler: farmacoDetailHandler, transitionType: TransitionType.none);

    // FARMACI
    router.define(farmaci,
        handler: farmaciHandler, transitionType: TransitionType.none);

    // ACCOUNT INFO
    router.define(accountInfo,
        handler: accountInfoHandler, transitionType: TransitionType.none);

    // ARMADIETTO
    router.define(armadietto,
        handler: armadiettoHandler, transitionType: TransitionType.none);

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
