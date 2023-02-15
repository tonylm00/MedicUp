import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/medico_view/farmaciListMed_view.dart';
import 'package:frontend/UI/paziente_view/armadietto_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/farmaco.dart';
import 'package:frontend/utils/AbstractBase.dart';
import 'package:frontend/utils/ResponseMessage.dart';
import 'package:frontend/utils/restClient.dart';
import 'package:http/http.dart';

import '../../UI/paziente_view/farmaciList_view.dart';
import '../../utils/ColorUtils.dart';

class FarmaciListPageMed extends StatefulWidget {
  const FarmaciListPageMed({super.key});

  @override
  State<StatefulWidget> createState() {
    return FarmaciListPageMedState();
  }
}

class FarmaciListPageMedState extends State<FarmaciListPageMed> {
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
                      "Farmaci",
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
                child: FarmaciListPageWidgetMed(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FarmaciListPageWidgetMed extends StatefulWidget {
  const FarmaciListPageWidgetMed({super.key});

  @override
  State<StatefulWidget> createState() {
    return FarmaciListPageWidgetMedState();
  }
}

class FarmaciListPageWidgetMedState extends AbstractBaseState<FarmaciListPageWidgetMed> {
  String TAG = '[FARMACI LIST] : ';
  dynamic userObjectData;

  @override
  Widget build(BuildContext context) {
    userObjectData = ModalRoute.of(context)!.settings.arguments;
    return FarmaciListViewMed(this).getView(context);
  }

  TextEditingController searchController = TextEditingController();

  List<Farmaco> listaFarmaci = [];
  String messageEmpty = '';
  bool toggle = true;
  bool searchByName = true;
  bool searchByPrincipio = false;

  @override
  calledFromInitState() async {
    await callBackToRestApi();
    showLoading(false, msg: 'Caricamento ...');
  }

  callBackToRestApi() async {
    dynamic response = await RestCallback.listaFarmaci();
    log(response.toString());

    if (response != null) {
      setState(() {
        listaFarmaci = response;
      });
    } else {
      listaFarmaci = [];
      setState(() {
        messageEmpty = 'Nessun elemento trovato.';
      });
    }
  }

  searchByNameCall() async {
    dynamic response =
        await RestCallback.ricercaFarmacoNome(searchController.text);
    log(response.toString());
    if (response == []) {
      setState(() {
        messageEmpty = 'Nessun elemento trovato.';
      });
    }
    setState(() {
      listaFarmaci = response;
    });
  }

   searchByPrincipioCall() async {
    dynamic response =
        await RestCallback.ricercaFarmacoPrincipio(searchController.text);
    log(response.toString());
    if (response == []) {
      setState(() {
        messageEmpty = 'Nessun elemento trovato.';
      });
    }
    setState(() {
      listaFarmaci = response;
    });
  }
}
