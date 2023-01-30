import 'package:flutter/material.dart';

import '../UI/intro_widget.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) => IntroWidget(this).getView(context);
   
  
}
