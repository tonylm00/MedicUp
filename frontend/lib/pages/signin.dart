import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/model_object/medico.dart';
import 'package:frontend/model_object/paziente.dart';

import '../UI/signin_widget.dart';
import '../utils/ColorUtils.dart';
import '../utils/CommonStyle.dart';
import '../utils/RegExp_SignUp.dart';
import '../utils/restClient.dart';

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
  var userEmailController = TextEditingController(text: "");
  var medIdController = TextEditingController(text: "");

  var userPasswordController = TextEditingController(text: "");
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  bool isPasswordVisible = true;
  bool toggle = true;
  bool isPaziente = true;

  bool isValidate_email = false;
  bool isValidate_password = false;
  bool isValidate_medCode = false;

/* LoginData loginData = response.data;
      SessionManager.setSessionFromLogin(loginData); */

  validateMedCode(String value) {
    if (value.isNotEmpty) {
      if (SignUpRegExp.regExp_medcode.hasMatch(value)) {
        setState(() {
          isValidate_medCode = true;
        });
        log('VALIDATE : $value  : $isValidate_medCode');
      } else {
        setState(() {
          isValidate_medCode = false;
        });
        log('VALIDATE ERROR: $value  : $isValidate_medCode');
        return 'Errore: formato non corretto.';
      }
    } else {
      return 'Questo campo non può essere vuoto.';
    }
  }

  validateEmail(String value) {
    if (value.isNotEmpty) {
      if (SignUpRegExp.regExp_email.hasMatch(value)) {
        setState(() {
          isValidate_email = true;
        });
        log('VALIDATE : $value  : $isValidate_email');
      } else {
        setState(() {
          isValidate_email = false;
        });
        log('VALIDATE ERROR: $value  : $isValidate_email');
        return 'Errore: formato non corretto.';
      }
    } else {
      return 'Questo campo non può essere vuoto.';
    }
  }

  validatePassword(String value) {
    if (value.isNotEmpty) {
      if (SignUpRegExp.regExp_password.hasMatch(value)) {
        setState(() {
          isValidate_password = true;
        });
        log('VALIDATE : $value  : $isValidate_password');
      } else {
        setState(() {
          isValidate_password = false;
        });
        log('VALIDATE ERROR: $value  : $isValidate_password');
        return 'Errore: formato non corretto.';
      }
    } else {
      return 'Questo campo non può essere vuoto.';
    }
  }

  signInCallMethod_Paziente() async {
    Paziente paziente = Paziente(
        nome: 'mario',
        cognome: 'rossi',
        email: 'email',
        cf: 'pwasdfs',
        dataNascita: '',
        password: '');
    await RestClient.loginPaziente(paziente);
    log('PAZIENTE LOGIN ');
  }

  signInCallMethod_Medico() async {
    Medico medico = Medico(
        nome: 'mario',
        cognome: 'rossi',
        email: 'email',
        id: 'id',
        password: '');
    await RestClient.loginMedico(medico);
    log('MEDICO LOGIN ');
  }

  @override
  Widget build(BuildContext context) => SignInWidget(this).getView(context);
}
