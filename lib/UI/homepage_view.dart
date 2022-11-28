import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:momento_medico/utils/AppColors.dart';
import 'package:momento_medico/utils/routes.dart';

class HomePageView {
  const HomePageView();

  Widget getView(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      const SizedBox(height: 30),
      BootstrapContainer(
        children: [
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: const Center(
                  child: SizedBox(
                height: 110,
                width: 450,
                child: Text(
                  'Benvenuto,\n Tizio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontStyle: FontStyle.italic),
                ),
              ))),
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: Center(
                  child: SizedBox(
                      height: 110,
                      width: 450,
                      child: Card(
                          color: AppColors.medicUpColor,
                          elevation: 5.0,
                          child: Column(children: [
                            Container(
                              padding: const EdgeInsets.only(left: 0, top: 10),
                              child: const Text(
                                'Armadietto',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 0, top: 10),
                              child: IconButton(
                                icon: const Icon(Icons.medication_liquid),
                                iconSize: 35,
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            )
                          ]))))),
          const Divider(),
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: Center(
                  child: SizedBox(
                      height: 110,
                      width: 450,
                      child: Card(
                          color: AppColors.medicUpColor,
                          elevation: 5.0,
                          child: Column(children: [
                            Container(
                              padding: const EdgeInsets.only(left: 0, top: 10),
                              child: const Text(
                                'Promemoria',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 0, top: 10),
                              child: IconButton(
                                icon: const Icon(Icons.notification_add),
                                iconSize: 35,
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            )
                          ]))))),
          const Divider(),
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: Center(
                  child: SizedBox(
                      height: 110,
                      width: 450,
                      child: Card(
                          color: AppColors.medicUpColor,
                          elevation: 5.0,
                          child: Column(children: [
                            Container(
                              padding: const EdgeInsets.only(left: 0, top: 10),
                              child: const Text(
                                'Verifica compatibilità',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 0, top: 10),
                              child: IconButton(
                                icon: const Icon(Icons.compare_arrows),
                                iconSize: 35,
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            )
                          ]))))),
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
                            padding: const EdgeInsets.only(
                                left: 20, top: 0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.home),
                                  iconSize: 35,
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search),
                                  iconSize: 35,
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(context, Routes.search);
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.medical_services_outlined),
                                  iconSize: 35,
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.account_circle),
                                  iconSize: 35,
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          )))))
        ],
      ),
    ]));
  }
}
