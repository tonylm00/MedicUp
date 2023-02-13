import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/model_object/medico.dart';
import 'package:frontend/model_object/paziente.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UI/paziente_view/homepage_view.dart';
import '../utils/ColorUtils.dart';
import '../utils/session/SessionManager.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                      "Homepage",
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
                child: HomepageColumnWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomepageColumnWidget extends StatefulWidget {
  const HomepageColumnWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomepageColumnWidgetState();
  }
}

class HomepageColumnWidgetState extends State<HomepageColumnWidget> {
  dynamic paziente, medico;
  Paziente pazienteObj = Paziente();

  @override
  void initState() {
    super.initState();

    callBackToRestApi();

    /*  final org = businessCode ?? await SessionManager.getBusinessCode();*/
  }

  callBackToRestApi() async {
    paziente = (await SessionManager.getPaziente());

    medico = (await SessionManager.getMedico());

    pazienteObj.nome = await SessionManager.getPazienteNome();
    pazienteObj.cognome = await SessionManager.getPazienteCognome();
    pazienteObj.cf = await SessionManager.getPazienteCf();
    pazienteObj.dataNascita = await SessionManager.getPazienteDataNascita();
    pazienteObj.email = await SessionManager.getPazienteEmail();
    pazienteObj.password = await SessionManager.getPazientePassword();

    usingSharedPreferences();
    // log(pazienteObj.toString());
  }

  usingSharedPreferences() async{
      SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    sharedPreferences.setString('pazienteNome', pazienteObj.nome);;

  }

  @override
  Widget build(BuildContext context) => HomePageView(this).getView(context);
}
