import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../pages/paziente/armadiettoPage.dart';
import '../../utils/ColorUtils.dart';
import '../../utils/CommonStyle.dart';
import '../../utils/routes.dart';

class ArmadiettoWidgetView {
  final ArmadiettoWidgetState state;
  ArmadiettoWidgetView(this.state) : super();

  Widget getView(BuildContext context) {
    return Container(
        height: 650,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
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
                    farmaciList()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildIntroText() {
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Text(
            "I tuoi farmaci",
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

  Widget farmaciList() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Ecco la lista dei tuoi farmaci : "),
              (state.listaFarmaciArmadietto != null &&
                      state.listaFarmaciArmadietto.isNotEmpty)
                  ? ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.listaFarmaciArmadietto.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            title: Container(
                                width: 300,
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.listaFarmaciArmadietto[index]
                                                    .nome ??
                                                '', //qua ci vuole il nome del farmaco e non il tipo come label
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          MouseRegion(
                                            child: IconButton(
                                              onPressed: () {
                                                state.setState(() {
                                                  state.setSharedPreferencesFarmacoNome(
                                                      state
                                                          .listaFarmaciArmadietto[
                                                              index]
                                                          .nome!);
                                                });
                                                showDialog(
                                                  context: state.context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      icon: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons.close),
                                                        color: ColorUtils
                                                            .primaryColor,
                                                        iconSize: 30,
                                                        alignment: Alignment
                                                            .centerRight,
                                                      ),
                                                      title: const Text(
                                                          "Aggiungi promemoria"),
                                                      content: Container(
                                                        height: 250,
                                                        child: Column(
                                                          children: [
                                                            TextField(
                                                              controller: state
                                                                  .nomePromemoria,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      labelText:
                                                                          'Nome promemoria'),
                                                              onSubmitted:
                                                                  (value) {
                                                                state.setState(
                                                                    () {
                                                                  state.nomePromemoria
                                                                          .text =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            TextField(
                                                              controller: state
                                                                  .descrizione,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      labelText:
                                                                          'Descrizione'),
                                                              onSubmitted:
                                                                  (value) {
                                                                state.setState(
                                                                    () {
                                                                  state.descrizione
                                                                          .text =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            TextField(
                                                              controller: state
                                                                  .dataFine,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      labelText:
                                                                          'Data fine assunzione'),
                                                              onSubmitted:
                                                                  (value) {
                                                                state.setState(
                                                                    () {
                                                                  state.dataFine
                                                                          .text =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Checkbox(
                                                                    value: state
                                                                        .isShared,
                                                                    onChanged:
                                                                        (value) {
                                                                      state.setState(
                                                                          () {
                                                                        state.isShared =
                                                                            value!;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                      child: RichText(
                                                                          text: TextSpan(
                                                                    text:
                                                                        "Condividi con il tuo medico",
                                                                    style: DefaultTextStyle.of(
                                                                            context)
                                                                        .style,
                                                                  )))
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      15.0,
                                                                  vertical:
                                                                      15.0),
                                                          child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      15.0),
                                                              width: double
                                                                  .infinity,
                                                              child: Visibility(
                                                                  child:
                                                                      ElevatedButton(
                                                                onPressed: () {
                                                                  state
                                                                      .setPromemoria();
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                        ColorUtils
                                                                            .accentColor,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0))),
                                                                child:
                                                                    const Text(
                                                                  "Conferma promemoria",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          21,
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
                                              icon: const Icon(Icons.add_alarm),
                                              iconSize: 35,
                                              color: ColorUtils.primaryColor,
                                            ),
                                            onHover: (event) => const Tooltip(
                                              message: 'Aggiungi promemoria',
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Quantità : ${state.listaFarmaciArmadietto[index].quantita}' ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Scadenza : ${state.listaFarmaciArmadietto[index].scadenza}' ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      )
                                    ])));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 3,
                          height: 8,
                          color: ColorUtils.primaryColor,
                        );
                      },
                    )
                  : SizedBox(height: 35, child: Container()),
              state.listaFarmaciArmadietto.isEmpty ? emptyResult() : Container()
            ],
          ),
        ),
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
