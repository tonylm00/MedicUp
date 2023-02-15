import 'package:flutter/material.dart';

import '../pages/intropage.dart';
import '../utils/ColorUtils.dart';
import '../utils/routes.dart';

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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Attenzione : "),
                          content: Container(
                            height: 150,
                            child: const Text(
                                'Si prega di notare che l\'applicazione che state utilizzando ha solo scopo informativo e non sostituisce in alcun modo il parere di un professionista qualificato o le raccomandazioni mediche.'),
                          ),
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 15.0),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  width: double.infinity,
                                  child: Visibility(
                                      /*  visible: (state.isSubmittedEmail || state.isSubmittedMedId) &&
                  (state.isSubmittedPassword), */
                                      child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.signin);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorUtils.accentColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    child: const Text(
                                      "Ho capito.",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ))),
                            )
                          ],
                        );
                      },
                    );
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
