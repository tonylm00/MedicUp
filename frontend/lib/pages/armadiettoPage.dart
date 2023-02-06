import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/UI/armadietto_view.dart';

import '../utils/ColorUtils.dart';

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
  @override
  Widget build(BuildContext context) =>
      ArmadiettoWidgetView(this).getView(context);
}
