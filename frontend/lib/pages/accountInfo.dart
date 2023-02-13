import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/UI/paziente_view/accountinfo_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/paziente.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/utils/session/SessionManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var pazienteNome;

  @override
  void initState() {
    super.initState();

    callBackToRestApi();

    /*  final org = businessCode ?? await SessionManager.getBusinessCode();*/
  }

  callBackToRestApi() async {
    /*    paziente = (await SessionManager.getPaziente());

    medico = (await SessionManager.getMedico()); */

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    pazienteNome = sharedPreferences.getString('pazienteNome');

    log('PAZIENTE NOME FROM SHARED PREFERENCES: $pazienteNome');
    pazienteObj = await RestCallback.getLoginPaziente();

    log('PAZIENTE DA ACCOUNT INFO' + pazienteObj.toString());
  }

  @override
  Widget build(BuildContext context) {
    userObjectData = ModalRoute.of(context)!.settings.arguments;
    log(userObjectData.toString());
    return AccountInfoView(this).getView(context);
  }

  logOutCall() async {
    SessionManager.clearSession();

    Navigator.pushNamed(context, Routes.intro);
  }
}
