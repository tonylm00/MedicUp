import 'package:flutter/material.dart';

import '../UI/signin_widget.dart';
import '../utils/ColorUtils.dart';
import '../utils/CommonStyle.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignInState();
  }
}

class SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorUtils.gradientStart,
                    ColorUtils.gradientEnd,
                  ],
                ),
              ),
              child: AppBar(
                backgroundColor: Color.fromARGB(0, 255, 0, 0),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ))), */
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
                      "Login",
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
                child: LoginFormWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginFormWidgetState();
  }
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();
  var userEmailController = TextEditingController(text: "jm1@example.com");
  var medIdController = TextEditingController(text: "Med001");

  var userPasswordController = TextEditingController(text: "jay@123");
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  bool isPasswordVisible = true;
  bool toggle = true;
  bool isPaziente = true;

/* LoginData loginData = response.data;
      SessionManager.setSessionFromLogin(loginData); */

  @override
  Widget build(BuildContext context) => SignInWidget(this).getView(context);
}
