import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/paziente_view/armadietto_view.dart';
import 'package:frontend/UI/farmacoDetail_view.dart';

import '../utils/ColorUtils.dart';

class FarmacoDetailPage extends StatefulWidget {
  const FarmacoDetailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return FarmacoDetailPageState();
  }
}

class FarmacoDetailPageState extends State<FarmacoDetailPage> {
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
                child: FarmacoDetailWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FarmacoDetailWidget extends StatefulWidget {
  const FarmacoDetailWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return FarmacoDetailWidgetState();
  }
}

class FarmacoDetailWidgetState extends State<FarmacoDetailWidget> {
  @override
  Widget build(BuildContext context) =>
      FarmacoDetailView(this).getView(context);
}
