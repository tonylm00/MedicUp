import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/paziente_view/armadietto_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/farmaco.dart';
import 'package:frontend/utils/ResponseMessage.dart';
import 'package:frontend/utils/restClient.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/utils/session/SessionManager.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    userObjectData = ModalRoute.of(context)!.settings.arguments;
    return FarmaciListView(this).getView(context);
  }

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
        listaFarmaci.sort();
        listaFarmaci.sort(
          (a, b) => a.nome!.compareTo(b.nome!),
        );

        for (var element in listaFarmaci) {
          print(element.nome!.toString());
        }
      });
    } else {
      listaFarmaci = [];
      setState(() {
        messageEmpty = 'Nessun elemento trovato.';
      });
    }
  }

  setIndexFarmacoToSharedPref(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('index', index);

    Navigator.pushNamed(context, Routes.farmacoDetail);
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
