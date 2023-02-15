import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/paziente_view/armadietto_view.dart';
import 'package:frontend/api/restcallback.dart';
import 'package:frontend/model_object/reminder.dart';
import 'package:frontend/utils/AbstractBase.dart';

import '../../UI/paziente_view/farmaciList_view.dart';
import '../../UI/paziente_view/remindersList_view.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/ResponseMessage.dart';
import '../../utils/restClient.dart';

class PromemoriaListPage extends StatefulWidget {
  const PromemoriaListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return PromemoriaListPageState();
  }
}

class PromemoriaListPageState extends State<PromemoriaListPage> {
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
                      "Promemoria",
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
                child: PromemoriaListPageWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PromemoriaListPageWidget extends StatefulWidget {
  const PromemoriaListPageWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return PromemoriaListPageWidgetState();
  }
}

class PromemoriaListPageWidgetState
    extends AbstractBaseState<PromemoriaListPageWidget> {
  String TAG = '[REMINDERS LIST] : ';

  List<Reminder> listaReminder = [];
  String messageEmpty = '';
  @override
  calledFromInitState() async {
    await callBackToRestApi();
  }

  callBackToRestApi() async {
    dynamic response = await RestCallback.getReminderPaziente(1);

    if (response != []) {
      setState(() {
        listaReminder = response;
      });
    } else {
      setState(() {
        listaReminder = [];

        messageEmpty = 'Nessun promemoria trovato.';
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      PromemoriaListView(this).getView(context);
}
