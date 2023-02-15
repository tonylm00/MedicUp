import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/pages/signin.dart';
import 'package:frontend/utils/session/LoginData.dart';
import 'package:frontend/utils/session/SessionCheck.dart';
import 'package:frontend/utils/session/SessionManager.dart';

abstract class AbstractBaseState<T extends StatefulWidget> extends State<T> {
  @protected
  bool _loadingState = true;

  @protected
  bool checkSession = true;

  @protected
  bool isLogin = false;

  @protected
  String messageForProgress = '';

  loadSessionManager(BuildContext context, {LoginData? loginData}) async {
    if (loginData != null) await SessionManager.setSessionFromLogin(loginData);
    checkSession = false;
    isLogin = true;

    log(loginData.toString());
  }

  showLoading(bool b, {String? msg}) {
    _loadingState = b;
    messageForProgress = msg!;
    setState(() {});
  }

  setLoadingMessage(String msg) {
    messageForProgress = msg;
    setState(() {});
  }

  final TAG = "BasePage";

  @override
  void initState() {
    loadSessionManager(context);
    if (!checkSession) {
      calledFromInitState();
      return;
    }
    loadSessionManager(context).then((value) {
      switch (value) {
        case SessionState.Ok:
          calledFromInitState();
          break;

        default:
          print(TAG + "SessionCheck: fail");

          if (isLogin) {
            calledFromInitState();
            return;
          }

          SessionManager.clearSession();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignInPage()));
          break;
      }
    });
  }

  bool loadingState() {
    return _loadingState;
  }

  void close() {
    Navigator.pop(context);
  }

  void refresh() {
    setState(() {});
  }

  calledFromInitState();
}
