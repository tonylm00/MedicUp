import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/farmacoDetail.dart';
import 'package:intl/intl.dart';

import '../pages/armadiettoPage.dart';
import '../utils/ColorUtils.dart';
import '../utils/CommonStyle.dart';
import '../utils/routes.dart';

class FarmacoDetailView {
  final FarmacoDetailWidgetState state;
  FarmacoDetailView(this.state) : super();

  Widget getView(BuildContext context) {
    return Container(
        height: 650,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              _buildIntroText(),
              farmacoDetail()
            ],
          ),
        ));
  }

  Widget farmacoDetail() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              (state.farmaco != null)
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Aggiungi al tuo armadietto',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    iconSize: 37,
                                    color: Colors.orange,
                                    onPressed: () {
                                      showDialog(
                                        context: state.context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Aggiungi queste informazioni : "),
                                            content: Container(
                                              height: 220,
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    controller: state
                                                        .scadenzaController,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText:
                                                                'Scadenza'),
                                                    onSubmitted: (value) {
                                                      state.setState(() {
                                                        state.scadenzaController
                                                            .text = value;
                                                      });
                                                    },
                                                  ),
                                                  TextField(
                                                    controller: state
                                                        .quantitaController,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText:
                                                                'Quantità'),
                                                    onSubmitted: (value) {
                                                      state.setState(() {
                                                        state.quantitaController
                                                            .text = value;
                                                      });
                                                    },
                                                  ),
                                                  TextField(
                                                    controller:
                                                        state.tipoController,
                                                    decoration:
                                                        const InputDecoration(
                                                            labelText: 'Tipo'),
                                                    onSubmitted: (value) {
                                                      state.setState(() {
                                                        state.tipoController
                                                            .text = value;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0,
                                                        vertical: 15.0),
                                                child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15.0),
                                                    width: double.infinity,
                                                    child: Visibility(
                                                        /*  visible: (state.isSubmittedEmail || state.isSubmittedMedId) &&
                  (state.isSubmittedPassword), */
                                                        child: ElevatedButton(
                                                      onPressed: () {
                                                        state
                                                            .sendToArmadietto();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ColorUtils
                                                                  .accentColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0))),
                                                      child: const Text(
                                                        "Invia al mio armadietto",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ))),
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
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
                              const Text(
                                "Nome",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.farmaco.nome ?? '',
                                textAlign: TextAlign.left,
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Principio",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                state.farmaco.principio ?? '',
                                textAlign: TextAlign.justify,
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                const Text(
                                  "Descrizione",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(state.farmaco.descrizioneBug ?? '',
                                textAlign: TextAlign.justify,
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Precauzioni",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                state.farmaco.precauzioniBug ?? '',
                                textAlign: TextAlign.justify,
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Posologia",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                state.farmaco.posologiaBug ?? '',
                                textAlign: TextAlign.justify,
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Controindicazioni",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                state.farmaco.controindicazioniBug ?? '',
                                textAlign: TextAlign.justify,
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "Informazioni",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                state.farmaco.informazioniBug ?? '',
                                textAlign: TextAlign.justify,
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ))
                  : Container(),
              state.farmaco == null ? emptyResult() : Container()
            ],
          ),
        ),
      ),
    );
  }

  _showDialog() {}
  Widget _buildIntroText() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        state.farmaco.nome ?? '',
        style: const TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget emptyResult() {
    return SizedBox(
        height: 140,
        child: Column(children: [
          Text(state.messageEmpty),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              child: const Text(
                'Ritorna alla pagina iniziale',
                style: TextStyle(color: ColorUtils.primaryColor, fontSize: 17),
              ),
              onPressed: () {
                Navigator.pushNamed(state.context, Routes.homepage);
              },
            ),
          )
        ]));
  }
}
