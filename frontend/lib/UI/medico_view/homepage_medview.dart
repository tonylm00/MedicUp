import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/utils/routes.dart';

import '../../pages/paziente/homepage.dart';
import '../../pages/medico/homepageMed.dart';
import '../../utils/ColorUtils.dart';

class HomePageMedView {
  final HomepageColumnMedWidgetState state;
  HomePageMedView(this.state) : super();

  Widget getView(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Card(
          elevation: 8,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              _buildIntroText(),
              _buildCardPromemoria(),
              _buildCardFarmaci(),
              _buildCardAreaPersonale()
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildIntroText() {
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Text(
            "I servizi di Medic Up",
            style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildCardAreaPersonale() {
    return Card(
        color: ColorUtils.lightTransPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        margin: const EdgeInsets.all(20),
        child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Profilo",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(state.context, Routes.accountInfoMed);
                    },
                  ),
                ],
              ),
              const Text(
                "Qui troverai i tuoi dati personali inseriti in fase di registrazione",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ])));
  }

  Widget _buildCardPromemoria() {
    return Card(
        color: ColorUtils.lightTransPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        margin: const EdgeInsets.all(20),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Promemoria",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.alarm,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(state.context, Routes.promemoria);
                  },
                ),
              ],
            ),
            const Text(
              "Qui troverai la lista dei tuoi promemoria condivisi.",
              style: TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ]),
        ));
  }

  Widget _buildCardFarmaci() {
    return Card(
      color: ColorUtils.lightTransPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      margin: const EdgeInsets.all(20),
      child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Farmaci",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.medication_outlined,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(state.context, Routes.farmaciListMed);
                  },
                ),
              ],
            ),
            const Text(
              "Qui troverai la lista dei farmaci disponibili.",
              style: TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ])),
    );
  }
}
