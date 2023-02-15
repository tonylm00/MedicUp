import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:frontend/pages/medico/accountInfoMed.dart';

import '../../pages/paziente/accountInfo.dart';
import '../../utils/ColorUtils.dart';

class AccountInfoViewMed {
  final AccountPageMedWidgetState state;
  AccountInfoViewMed(this.state) : super();

  Widget getView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 8,
            child: BootstrapContainer(children: [
              BootstrapCol(
                  child: Column(children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                _buildIntroText(),
              ])),
              BootstrapRow(
                children: [
                  BootstrapCol(
                    sizes: "col-12 col-sm-8 col-md-8 col-lg-8",
                    child: _buildCardDatiPersonali(),
                  )
                ],
              ),
              _buildLogoutButton(context),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildIntroText() {
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 30),
          child: Text(
            "I tuoi dati",
            style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 21.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          width: double.infinity,
          child: Visibility(
              /*  visible: (state.isSubmittedEmail || state.isSubmittedMedId) &&
                  (state.isSubmittedPassword), */
              child: ElevatedButton(
            onPressed: () {
              state.logOutCall();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade900,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: const Text(
              "Logout",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
          ))),
    );
  }

  Widget _buildCardDatiPersonali() {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.account_box),
                        SizedBox(width: 5),
                        Text(
                          "Nome",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 25),
                        Text(
                          state.medicoObj.nome ?? '',
                          style: const TextStyle(
                            fontSize: 21,
                            color: ColorUtils.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Row(children: const [
                      Icon(Icons.account_box),
                      SizedBox(width: 5),
                      Text(
                        "Cognome",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    Text(
                      state.medicoObj.cognome ?? '',
                      style: const TextStyle(
                        fontSize: 21,
                        color: ColorUtils.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.lock_person_outlined),
                    SizedBox(width: 5),
                    Text(
                      "Codice FNOMCEO",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(
                      width: 27,
                    ),
                    Text(
                      state.medicoObj.fnomceo ?? '',
                      style: const TextStyle(
                        fontSize: 21,
                        color: ColorUtils.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.email),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(
                      width: 29,
                    ),
                    Text(
                      state.medicoObj.email ?? '',
                      style: const TextStyle(
                        fontSize: 21,
                        color: ColorUtils.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.key),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      state.medicoObj.password ?? '',
                      style: const TextStyle(
                        fontSize: 21,
                        color: ColorUtils.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ));
  }

  Widget _buildCardRicerca() {
    return Card(
      color: ColorUtils.lightTransPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ricerca",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Qui potrai ricercare un farmaco.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  //Navigator.pushNamed(state.context, Routes.research);
                },
                child: const Text(
                  "Vai",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
