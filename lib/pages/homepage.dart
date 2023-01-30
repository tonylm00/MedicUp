import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:momento_medico/UI/homepage_view.dart';
import 'package:momento_medico/utils/AppColors.dart';
import 'package:momento_medico/utils/ColorUtils.dart';
import 'package:momento_medico/utils/routes.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                decoration:
                    const BoxDecoration(gradient: ColorUtils.appBarGradient),
              ),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Text(
                      "Homepage",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 19),
                    ),
                  )),
              const Positioned(
                top: 150,
                left: 10,
                right: 10,
                child: HomepageColumnWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomepageColumnWidget extends StatefulWidget {
  const HomepageColumnWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomepageColumnWidgetState();
  }
}

class HomepageColumnWidgetState extends State<HomepageColumnWidget> {
  @override
  Widget build(BuildContext context) => HomePageView(this).getView(context);
}
