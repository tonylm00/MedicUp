import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/UI/medico_view/accountInfoMedView.dart';
import 'package:frontend/UI/paziente_view/accountinfo_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/medico.dart';
import 'package:frontend/model_object/paziente.dart';
import 'package:frontend/utils/AbstractBase.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/utils/session/SessionManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/ResponseMessage.dart';
import '../../utils/restClient.dart';

class AccountPageMed extends StatefulWidget {
  const AccountPageMed({super.key});

  @override
  State<StatefulWidget> createState() {
    return AccountPageMedState();
  }
}

class AccountPageMedState extends State<AccountPageMed> {
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
                child: AccountPageMedWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountPageMedWidget extends StatefulWidget {
  const AccountPageMedWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return AccountPageMedWidgetState();
  }
}

class AccountPageMedWidgetState
    extends AbstractBaseState<AccountPageMedWidget> {
  String TAG = '[MEDICO GET ACCOUNT INFO] : ';
  dynamic paziente;
  dynamic medico;
  Medico medicoObj = Medico();

  dynamic userObjectData;
  var pazienteNome;

  callBackToRestApi() async {
    medicoObj.nome = await SessionManager.getMedicoNome();
    medicoObj.cognome = await SessionManager.getMedicoCognome();
    medicoObj.fnomceo = await SessionManager.getMedicFnomceo();
    medicoObj.email = await SessionManager.getMedicoEmail();
    medicoObj.password = await SessionManager.getMedicoPassword();

    print('ACCOUNT INFO ABSTRACT STATE: ' + medicoObj.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    userObjectData = ModalRoute.of(context)!.settings.arguments;
    log(userObjectData.toString());
    return AccountInfoViewMed(this).getView(context);
  }

  logOutCall() async {
    SessionManager.clearSession();

    Navigator.pushNamed(context, Routes.intro);
  }

  @override
  calledFromInitState() async {
    await callBackToRestApi();
    showLoading(false, msg: 'Caricamento ...');
  }
}
