import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:momento_medico/UI/homepage_view.dart';
import 'package:momento_medico/utils/AppColors.dart';

class Homepage extends StatefulWidget {
  final String title;

  const Homepage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) => const HomePageView().getView();
}
