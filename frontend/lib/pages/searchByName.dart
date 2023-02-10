import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../UI/paziente_view/search_view.dart';
import '../utils/AppColors.dart';

class SearchByName extends StatefulWidget {
  const SearchByName({super.key});

  @override
  State<StatefulWidget> createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  Icon customIcon = const Icon(Icons.search);
  Widget ricercaNome = const Text('Ricerca farmaco per nome');
  Widget ricercaPrincipioAttivo =
      const Text('Ricerca farmaco per principio attivo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.medicUpColor,
        title: ricercaNome,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  ricercaNome = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'nome farmaco...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  ricercaNome = const Text('Ricerca farmaco per nome');
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
    );
  }
}
