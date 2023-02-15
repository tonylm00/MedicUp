import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/medico/farmaciDetailMed.dart';
import 'package:frontend/pages/paziente/farmacoDetail.dart';
import 'package:frontend/utils/ColorUtils.dart';
import 'package:frontend/utils/routes.dart';
import 'package:intl/intl.dart';

class FarmacoDetailViewMed {
  final FarmacoDetailPageMedWidgetState state;
  FarmacoDetailViewMed(this.state) : super();

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
                            children: [],
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
                            Text(state.farmaco.descrizioneRCP ?? '',
                                textAlign: TextAlign.left,
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
                                state.farmaco.precauzioniRCP ?? '',
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
                                state.farmaco.posologiaRCP ?? '',
                                textAlign: TextAlign.left,
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
                                state.farmaco.controindicazioniRCP ?? '',
                                textAlign: TextAlign.left,
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
                                state.farmaco.informazioniRCP ?? '',
                                textAlign: TextAlign.left,
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
