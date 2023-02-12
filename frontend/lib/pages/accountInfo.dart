import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/UI/paziente_view/accountinfo_view.dart';
import 'package:frontend/model_object/paziente.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/utils/session/SessionManager.dart';

import '../utils/ColorUtils.dart';
import '../utils/ResponseMessage.dart';
import '../utils/restClient.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return AccountInfoState();
  }
}

class AccountInfoState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                decoration:
                    const BoxDecoration(gradient: ColorUtils.appBarGradient),
              ),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Text(
                      "Profilo utente",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 19),
                    ),
                  )),
              const Positioned(
                top: 150,
                left: 10,
                right: 10,
                child: AccountPageWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return AccountPageWidgetState();
  }
}

class AccountPageWidgetState extends State<AccountPageWidget> {
  String TAG = '[PAZIENTE GET ACCOUNT INFO] : ';
  dynamic paziente;
  dynamic medico;
  Paziente pazienteObj = Paziente();

  dynamic userObjectData;

  @override
  Widget build(BuildContext context) {
    userObjectData = ModalRoute.of(context)!.settings.arguments;
    return AccountInfoView(this).getView(context);
  }

  logOutCall() async {
    SessionManager.clearSession();

    Navigator.pushNamed(context, Routes.intro);
  }
}
