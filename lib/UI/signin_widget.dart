import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:momento_medico/utils/AppColors.dart';
import 'package:momento_medico/utils/routes.dart';

class SignInWidget {
  const SignInWidget();

  Widget getView(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Scaffold(
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Accedi",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                      child: getFormSignIn(),
                    ),
                    ElevatedButton(
                      child: const Text(
                        "Accedi",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Oswald',
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getFormSignIn() {
    return Form(
      child: Column(children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(labelText: 'Inserisci email'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Inserisci password'),
        ),
      ]),
    );
  }
}
