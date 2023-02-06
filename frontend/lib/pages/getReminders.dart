import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/armadietto_view.dart';

import '../UI/farmaciList_view.dart';
import '../UI/remindersList_view.dart';
import '../utils/ColorUtils.dart';

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

class PromemoriaListPageWidgetState extends State<PromemoriaListPageWidget> {
  @override
  Widget build(BuildContext context) => PromemoriaListView(this).getView(context);
}
