import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/paziente_view/armadietto_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/farmaco.dart';
import 'package:frontend/utils/ResponseMessage.dart';
import 'package:frontend/utils/restClient.dart';
import 'package:frontend/utils/session/SessionManager.dart';
import 'package:http/http.dart';

import '../../UI/paziente_view/farmaciList_view.dart';
import '../../utils/AbstractBase.dart';
import '../../utils/ColorUtils.dart';

class FarmaciListPage extends StatefulWidget {
  const FarmaciListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return FarmaciListPageState();
  }
}

class FarmaciListPageState extends State<FarmaciListPage> {
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
                child: FarmaciListPageWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FarmaciListPageWidget extends StatefulWidget {
  const FarmaciListPageWidget({Key? key}) : super(key: key);

  @override
  FarmaciListPageWidgetState createState() => FarmaciListPageWidgetState();
}

class FarmaciListPageWidgetState
    extends AbstractBaseState<FarmaciListPageWidget> {
  String TAG = '[FARMACI LIST] : ';
  dynamic userObjectData;

  @override
  Widget build(BuildContext context) {
    userObjectData = ModalRoute.of(context)!.settings.arguments;
    return FarmaciListView(this).getView(context);
  }

  List<Farmaco> listaFarmaci = [];
  String messageEmpty = '';

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
}
