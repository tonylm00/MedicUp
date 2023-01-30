import 'package:flutter/material.dart';
import 'package:momento_medico/UI/intro_widget.dart';
import 'package:momento_medico/utils/ColorUtils.dart';
import 'package:momento_medico/utils/routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) => IntroWidget(this).getView(context);
   
  
}
