import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:momento_medico/utils/AppColors.dart';

class SearchView {
  const SearchView();

  Widget getView() => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ricerca',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 57, 122, 118),
        ),
        backgroundColor: AppColors.backgroundLight,
        body: getBody(),
      );

  getBody() => SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 20),
          BootstrapCol(
              sizes: "col-12 col-sm-12 col-md-12 col-lg-12",
              child: Center(
                  child: SizedBox(
                      height: 130,
                      width: 520,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 0, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: const Text('ricerca per nome'),
                              style: ButtonStyle(),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: const Text('ricerca per principio attivo'),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ))))
        ],
      ));
}
