import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/utils/routes.dart';

import '../../pages/homepage.dart';
import '../../utils/ColorUtils.dart';

class HomePageView {
  final HomepageColumnWidgetState state;
  HomePageView(this.state) : super();

  Widget getView(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Card(
          elevation: 8,
          child: Column(
            children: <Widget>[
              //_buildLogo(),
              const SizedBox(
                height: 30,
              ),
              _buildIntroText(),
              _buildCardArmadietto(),
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
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        /*  Padding(
            padding:
                const EdgeInsets.only(top: 5, right: 0, bottom: 10, left: 290),
            child: IconButton(
                iconSize: 37,
                color: ColorUtils.primaryColor,
                onPressed: (() {
                  Navigator.pushNamed(state.context, Routes.accountInfo);
                }),
                icon: const Icon(Icons.account_circle))), */
      ],
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildCardArmadietto() {
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
                  "Armadietto",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.local_pharmacy,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(state.context, Routes.armadietto);
                  },
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  "Descrizione",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ])),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(state.context, Routes.accountInfo,
                          arguments: state.pazienteObj);
                    },
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "Descrizione",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
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
            Row(
              children: const [
                Text(
                  "Descrizione",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.medication_outlined,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(state.context, Routes.farmaci);
                  },
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  "Descrizione",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
