import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../UI/paziente_view/search_view.dart';
import '../utils/AppColors.dart';

class SearchByPrincipioAttivo extends StatefulWidget {
  const SearchByPrincipioAttivo({super.key});

  @override
  State<StatefulWidget> createState() => _SearchByPrincipioAttivoState();
}

class _SearchByPrincipioAttivoState extends State<SearchByPrincipioAttivo> {
  Icon customIcon = const Icon(Icons.search);
  Widget ricercaPrincipioAttivo =
      const Text('Ricerca farmaco per principio attivo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.medicUpColor,
        title: ricercaPrincipioAttivo,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  ricercaPrincipioAttivo = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'nome principio attivo...',
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
                  ricercaPrincipioAttivo =
                      const Text('Ricerca farmaco per principio attivo');
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
