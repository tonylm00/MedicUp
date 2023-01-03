import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
                      width: 350,
                      child: Card(
                        elevation: 7,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: AppColors.medicUpColor, width: 13),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Armadietto',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.medication_liquid),
                                    iconSize: 35,
                                    color: AppColors.medicUpColor,
                                    onPressed: () {},
                                  ),
                                ],
                              )),
                        ),
                      )))),
          const Divider(
            color: Colors.transparent,
          ),
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: Center(
                  child: SizedBox(
                      height: 110,
                      width: 350,
                      child: Card(
                        elevation: 7,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: AppColors.medicUpColor, width: 13),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Promemoria',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.notifications),
                                    iconSize: 35,
                                    color: AppColors.medicUpColor,
                                    onPressed: () {},
                                  ),
                                ],
                              )),
                        ),
                      )))),
          const Divider(
            color: Colors.transparent,
          ),
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: Center(
                  child: SizedBox(
                      height: 110,
                      width: 350,
                      child: Card(
                        elevation: 7,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3))),
                          child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                      color: AppColors.medicUpColor, width: 13),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Verifica compatibilità',
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.compare_arrows),
                                    iconSize: 35,
                                    color: AppColors.medicUpColor,
                                    onPressed: () {},
                                  ),
                                ],
                              )),
                        ),
                      )))),
          const SizedBox(height: 230),
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: Center(
                  child: SizedBox(
                      height: 75,
                      width: 330,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: AppColors.medicUpColor,
                            ),
                            borderRadius: BorderRadius.circular(37.0),
                          ),
                          color: AppColors.medicUpColor,
                          elevation: 5.0,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, top: 0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SpeedDial(
                                    buttonSize: Size(20.0, 70.0),
                                    elevation: 0,
                                    icon: Icons.home,
                                    backgroundColor: AppColors.medicUpColor,
                                    children: []),
                                const SpeedDial(
                                    buttonSize: Size(20.0, 70.0),
                                    elevation: 0,
                                    icon: Icons.medical_services_outlined,
                                    backgroundColor: AppColors.medicUpColor,
                                    children: []),
                                SpeedDial(
                                    buttonSize: const Size(20.0, 70.0),
                                    elevation: 0,
                                    icon: Icons.search,
                                    backgroundColor: AppColors.medicUpColor,
                                    children: [
                                      SpeedDialChild(
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                        label: 'Ricerca per nome',
                                        backgroundColor: AppColors.medicUpColor,
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.searchByName);
                                        },
                                      ),
                                      SpeedDialChild(
                                        child: const Icon(
                                          Icons.medication_liquid,
                                          color: Colors.white,
                                        ),
                                        label: 'Ricerca per principio attivo',
                                        backgroundColor: AppColors.medicUpColor,
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              Routes.searchByPrincipioAttivo);
                                        },
                                      ),
                                    ]),
                                const SpeedDial(
                                    buttonSize: Size(20.0, 70.0),
                                    elevation: 0,
                                    icon: Icons.account_circle,
                                    backgroundColor: AppColors.medicUpColor,
                                    children: []),
                              ],
                            ),
                          )))))
        ],
      ),
    ]));
  }
}
