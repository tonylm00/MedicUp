import 'dart:developer';

import 'package:frontend/api/restcallback.dart';

enum SessionState { Ok, Fail }

Future<SessionState> sessionCheck() async {
  const TAG = "sessionCheck";

  var response = await RestCallback.getLoginPaziente();

  if (response.statusCode != 200) {
    log("${TAG}http error - response=${response.statusCode}");
    return SessionState.Fail;
  } else {
    return SessionState.Ok;
  }

}
