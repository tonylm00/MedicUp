import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/paziente_view/armadietto_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/farmaco.dart';
import 'package:frontend/model_object/farmacoArmadietto.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/ResponseMessage.dart';
import '../../utils/restClient.dart';

class ArmadiettoPage extends StatefulWidget {
  const ArmadiettoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ArmadiettoPageState();
  }
}

class ArmadiettoPageState extends State<ArmadiettoPage> {
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
                      "Armadietto",
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
                child: ArmadiettoWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ArmadiettoWidget extends StatefulWidget {
  const ArmadiettoWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return ArmadiettoWidgetState();
  }
}

class ArmadiettoWidgetState extends State<ArmadiettoWidget> {
  String TAG = '[ARMADIETTO FARMACI LIST] : ';

  List<FarmacoArmadietto> listaFarmaciArmadietto = [];
  String messageEmpty = '';

  @override
  void initState() {
    super.initState();

    callBackToRestApi();
  }

  callBackToRestApi() async {
    dynamic response = await RestCallback.armadietto(1);
    log(response.toString());

    if (response != null) {
      setState(() {
        listaFarmaciArmadietto = response;
      });
    } else {
      listaFarmaciArmadietto = [];
      setState(() {
        messageEmpty = 'Nessun elemento trovato.';
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      ArmadiettoWidgetView(this).getView(context);
}
