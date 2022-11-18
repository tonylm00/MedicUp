import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/floating_action_button.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:momento_medico/pages/homepage.dart';
import 'package:momento_medico/utils/AppColors.dart';

class HomePageView {
  const HomePageView();

  Widget getView() => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Homepage',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.medicUpColor,
        ),
        backgroundColor: AppColors.backgroundLight,
        body: getBody(),
      );

  getBody() => SingleChildScrollView(
          child: Column(children: [
        const SizedBox(height: 30),
        BootstrapContainer(
          children: [
            BootstrapCol(
                sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
                child: Center(
                    child: SizedBox(
                        height: 170,
                        width: 450,
                        child: Card(
                            color: AppColors.medicUpColor,
                            elevation: 5.0,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: const Text(
                                'card',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ))))),
            const Divider(),
            BootstrapCol(
                sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
                child: Center(
                    child: SizedBox(
                        height: 170,
                        width: 450,
                        child: Card(
                            color: AppColors.medicUpColor,
                            elevation: 5.0,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: const Text(
                                'card',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ))))),
            const Divider(),
            BootstrapCol(
                sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
                child: Center(
                    child: SizedBox(
                        height: 170,
                        width: 450,
                        child: Card(
                            color: AppColors.medicUpColor,
                            elevation: 5.0,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: const Text(
                                'card',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ))))),
            const SizedBox(height: 230),
            BootstrapCol(
                sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
                child: Center(
                    child: SizedBox(
                        height: 80,
                        width: 480,
                        child: Card(
                            color: AppColors.medicUpColor,
                            elevation: 5.0,
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: const Text(
                                'icon button',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            )))))
          ],
        ),
      ]));
  @override
  FloatingActionButton getFloatingActionButton() {
    // TODO: implement getFloatingActionButton
    throw UnimplementedError();
  }
}
