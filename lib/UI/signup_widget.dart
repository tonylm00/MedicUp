/* import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:momento_medico/pages/signup.dart';
import 'package:momento_medico/utils/AppColors.dart';

import 'package:momento_medico/utils/routes.dart';

class SignUpWidget {
  final SignUpPageState state;
  SignUpWidget(this.state) : super();

  Widget getView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          BootstrapRow(children: [
            BootstrapCol(
                child: Center(
                    child: Text(
              state.labelSignup,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald',
                color: Colors.black,
              ),
            ))),
            BootstrapCol(
              child: const SizedBox(
                height: 30,
              ),
            ),
            BootstrapCol(
                child: Visibility(
                    visible: state.show,
                    child: const Center(
                        child: Text(
                      "Che tipo di utente sei?",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                        color: Colors.black,
                      ),
                    )))),
            BootstrapCol(
                child: Visibility(
                    visible: state.show,
                    child: Center(
                        child: TextButton(
                      child: const Text(
                        "Medico",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          color: AppColors.medicUpColor,
                        ),
                      ),
                      onPressed: () {
                        state.onChangeMedico();
                      },
                    )))),
            BootstrapCol(
                child: Visibility(
                    visible: state.show,
                    child: Center(
                        child: TextButton(
                      child: const Text(
                        "Paziente",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          color: AppColors.medicUpColor,
                        ),
                      ),
                      onPressed: () {
                        state.onChangePaziente();
                      },
                    )))),
            BootstrapCol(
              child: const SizedBox(
                height: 30,
              ),
            ),
            BootstrapCol(child: getFormSignUp()),
            BootstrapCol(
                child: TextButton(
              child: const Text(
                "Sei già registrato? Accedi",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Oswald',
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.signin);
              },
            ))
          ]),
        ],
      ),
    );
  }

  Widget getFormSignUp() {
    return Visibility(
        visible: state.isMedico,
        child: Form(
          child: Column(children: <Widget>[
            TextFormField(
              controller: state.nome_ctrl,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: state.cognome_ctrl,
              decoration: const InputDecoration(labelText: 'Cognome'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: state.idUtente_ctrl,
              decoration:
                  const InputDecoration(labelText: 'Identificativo Medico'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: state.mail_ctrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: state.password_ctrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                "Registrati",
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Oswald',
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            )
          ]),
        ));
  }
}
 */