import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/medico_view/homepage_medview.dart';
import 'package:frontend/model_object/medico.dart';
import 'package:frontend/model_object/paziente.dart';

import '../../UI/paziente_view/homepage_view.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/session/SessionManager.dart';

class HomepageMed extends StatefulWidget {
  const HomepageMed({super.key});

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<HomepageMed> {
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
                child: HomepageColumnMedWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomepageColumnMedWidget extends StatefulWidget {
  const HomepageColumnMedWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomepageColumnMedWidgetState();
  }
}

class HomepageColumnMedWidgetState extends State<HomepageColumnMedWidget> {
  dynamic paziente ,medico ;
  Medico medicoObj = Medico();

  @override
  void initState() {
    super.initState();

    callBackToRestApi();

   
  }

  callBackToRestApi() async {
    paziente = (await SessionManager.getPaziente());

    medico = (await SessionManager.getMedico()) ;

    medicoObj.nome = await SessionManager.getMedicoNome();
    medicoObj.cognome = await SessionManager.getMedicoCognome();
    medicoObj.fnomceo = await SessionManager.getMedicFnomceo();
    medicoObj.email = await SessionManager.getMedicoEmail();
    medicoObj.password = await SessionManager.getMedicoPassword();

    log(medicoObj.toString());
  }

  @override
  Widget build(BuildContext context) => HomePageMedView(this).getView(context);
}
