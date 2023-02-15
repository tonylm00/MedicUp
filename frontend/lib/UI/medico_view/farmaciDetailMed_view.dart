import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/medico/farmaciDetailMed.dart';
import 'package:frontend/pages/paziente/farmacoDetail.dart';
import 'package:frontend/utils/ColorUtils.dart';
import 'package:frontend/utils/mydropdown.dart';
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Nome",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Tipo",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.farmaco.tipo ?? '',
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
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Principio",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    state.farmaco.principio ?? '',
                                    textAlign: TextAlign.left,
                                    maxLines: 100,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 17,
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
                          MyDropdownButton(
                            title: 'Descrizione',
                            content: Column(children: [
                              const SizedBox(height: 10),
                              Text(
                                state.farmaco.descrizioneBug ?? '',
                                textAlign: TextAlign.left,
                                maxLines: 100,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorUtils.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyDropdownButton(
                            title: 'Precauzioni',
                            content: Column(
                              children: [
                                Text(
                                  state.farmaco.precauzioniBug ?? '',
                                  textAlign: TextAlign.left,
                                  maxLines: 100,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: ColorUtils.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          MyDropdownButton(
                              title: 'Posologia',
                              content: Column(
                                children: [
                                  Text(
                                    state.farmaco.posologiaBug ?? '',
                                    textAlign: TextAlign.left,
                                    maxLines: 100,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: ColorUtils.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(height: 20),
                          MyDropdownButton(
                              title: 'Controindicazioni',
                              content: Column(
                                children: [
                                  Text(
                                    state.farmaco.controindicazioniBug ?? '',
                                    textAlign: TextAlign.left,
                                    maxLines: 100,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: ColorUtils.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              )),
                          const SizedBox(height: 20),
                          MyDropdownButton(
                              title: 'Informazioni',
                              content: Column(
                                children: [
                                  Text(
                                    state.farmaco.informazioniBug ?? '',
                                    textAlign: TextAlign.left,
                                    maxLines: 100,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: ColorUtils.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              )),
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
