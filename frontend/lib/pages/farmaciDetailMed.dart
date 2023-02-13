import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/medico_view/farmaciDetailMed_view.dart';
import 'package:frontend/UI/paziente_view/armadietto_view.dart';
import 'package:frontend/UI/farmacoDetail_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/farmaco.dart';

import '../utils/ColorUtils.dart';

class FarmacoDetailPageMed extends StatefulWidget {
  const FarmacoDetailPageMed({super.key});

  @override
  State<StatefulWidget> createState() {
    return FarmacoDetailPageMedState();
  }
}

class FarmacoDetailPageMedState extends State<FarmacoDetailPageMed> {
  @override
  Widget build(BuildContext context) {
    //testare quando ci sono farmaci nel db
    /* final data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data['id']); */

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
                      "Dettaglio Farmaco",
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
                child: FarmacoDetailPageMedWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FarmacoDetailPageMedWidget extends StatefulWidget {
  const FarmacoDetailPageMedWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return FarmacoDetailPageMedWidgetState();
  }
}

class FarmacoDetailPageMedWidgetState
    extends State<FarmacoDetailPageMedWidget> {
  Farmaco farmaco = Farmaco();
  String messageEmpty = '';
  bool isClicked = false;

  TextEditingController scadenzaController = TextEditingController();
  TextEditingController quantitaController = TextEditingController();

  TextEditingController tipoController = TextEditingController();

  dynamic userObjectData;

  @override
  void initState() {
    super.initState();
    callBackToRestApi();
  }

  /*    dynamic farmacoId;
    farmacoId = ModalRoute.of(context)!.settings.arguments;
    if (farmacoId != null) {
      log(farmacoId.toString());

      state.callBackToRestApi(id: farmacoId);

      
    } */

  callBackToRestApi() async {
    dynamic response = await RestCallback.detailFarmaco(1);
    log(response.toString());

    if (response != null) {
      setState(() {
        farmaco = response;
      });
    } else {
      farmaco = Farmaco();
      setState(() {
        messageEmpty = 'Nessun elemento trovato.';
      });
    }
  }

/* 
  sendToArmadietto() async {
    dynamic response = await RestCallback.addFarmaco(1, 1,
        scadenzaController.text, quantitaController.text, tipoController.text);
    log(response.toString());

    Navigator.of(context).pop();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Aggiunta farmaco con successo"),
              content:
                  Text('Hai appena aggiunto un farmaco al tuo armadietto!'),
              actions: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      width: double.infinity,
                      child: Visibility(
                          /*  visible: (state.isSubmittedEmail || state.isSubmittedMedId) &&
                  (state.isSubmittedPassword), */
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorUtils.accentColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        child: Text(
                          "Ok",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                        ),
                      ))),
                )
              ]);
        });
  }
 */
  @override
  Widget build(BuildContext context) {
    userObjectData = ModalRoute.of(context)!.settings.arguments;
    return FarmacoDetailViewMed(this).getView(context);
  }
}
