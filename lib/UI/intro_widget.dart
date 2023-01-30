import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:momento_medico/pages/intropage.dart';
import 'package:momento_medico/pages/signin.dart';
import 'package:momento_medico/pages/signup.dart';
import 'package:momento_medico/utils/AppColors.dart';
import 'package:momento_medico/utils/ColorUtils.dart';
import 'package:momento_medico/utils/CommonStyle.dart';

import 'package:momento_medico/utils/routes.dart';

class IntroWidget {
  final IntroPage state;
  IntroWidget(this.state) : super();

  Widget getView(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Benvenuto su",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Medic Up",
                style: TextStyle(
                  color: ColorUtils.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                // "Inizia con l'accesso o la creazione di un account",
                '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signin);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorUtils.accentColor),
                  child: const Text(
                    "Inizia",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
