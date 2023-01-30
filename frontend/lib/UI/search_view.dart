import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';


class SearchView {
  const SearchView();

  Widget getView(BuildContext context) => SingleChildScrollView(
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
                              style: const ButtonStyle(),
                              onPressed: () {},
                              child: const Text('ricerca per nome'),
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
