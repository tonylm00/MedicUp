import 'package:flutter/material.dart';
import 'package:frontend/pages/paziente/farmaciList.dart';
import 'package:frontend/pages/medico/farmaciMedList.dart';
import 'package:intl/intl.dart';

import '../../utils/ColorUtils.dart';
import '../../utils/routes.dart';

class FarmaciListViewMed {
  final FarmaciListPageWidgetMedState state;
  FarmaciListViewMed(this.state) : super();

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
            "Lista di farmaci disponibili",
            style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 19.0,
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
              const Text(
                "Ecco la lista dei farmaci : ",
                style: TextStyle(fontSize: 17),
              ),
              (state.listaFarmaci != null && state.listaFarmaci.isNotEmpty)
                  ? ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.listaFarmaci.length,
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
                                            state.listaFarmaci[index].nome ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.zoom_in,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(state.context,
                                                  Routes.farmaciDetailMed,
                                                  arguments: 1
                                                  /* arguments: state
                                                      .listaFarmaci[index].id */
                                                  );
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Principio attivo : ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text(
                                            state.listaFarmaci[index]
                                                    .principio ??
                                                '',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: ColorUtils.primaryColor),
                                          ),
                                        ],
                                      ),
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
              state.listaFarmaci.isEmpty ? emptyResult() : Container()
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
