import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../UI/search_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) => const SearchView().getView();
}
