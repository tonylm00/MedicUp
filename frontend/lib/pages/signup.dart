// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/api/api.dart';
import 'package:frontend/model_object/paziente.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/utils/RegExp_SignUp.dart';

import '../UI/signup_widget.dart';
import '../utils/ColorUtils.dart';
import '../utils/CommonStyle.dart';
import '../utils/restClient.dart';
import '../utils/restClient.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
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
                      "Registrazione",
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
                child: RegisterFormWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterFormWidgetState();
  }
}

class RegisterFormWidgetState extends State<RegisterFormWidget> {
  final formKey = GlobalKey<FormState>();
  var userEmailController = TextEditingController(text: "");
  var userPasswordController = TextEditingController(text: "");
  final userNameController = TextEditingController(text: "");
  final userSurnameController = TextEditingController(text: "");
  final userCFController = TextEditingController(text: "");
  final userDataNascitaController = TextEditingController(text: '');

  final medIdController = TextEditingController(text: '');

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  final surnameFocusNode = FocusNode();
  final userCfFocusNode = FocusNode();

  bool toggle = true;
  bool isPaziente = true;
  bool isPasswordVisible = true;

  late DateTime selectedDate = DateTime.now();

  bool isValidate_birthdate = false;
  bool isValidate_name = false;
  bool isValidate_surname = false;
  bool isValidate_cf = false;
  bool isValidate_email = false;
  bool isValidate_password = false;
  bool isValidate_medCode = false;

  @override
  Widget build(BuildContext context) => SignUpWidget(this).getView(context);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950, 8),
      lastDate: DateTime(2024),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
      return 'Attenzione! Questo campo non può essere vuoto.';
    }
  }

  validateBirthDate(String value) {
    if (value.isNotEmpty) {
      if (SignUpRegExp.regExp_birthdate.hasMatch(value)) {
        setState(() {
          isValidate_birthdate = true;
        });
        log('VALIDATE : $value  : $isValidate_birthdate');
      } else {
        setState(() {
          isValidate_birthdate = false;
        });

        log('VALIDATE ERROR: $value  : $isValidate_birthdate');
        return 'Errore: formato non corretto.';
      }
    } else {
      return 'Attenzione! Questo campo non può essere vuoto.';
    }
  }

  validateName(String value) {
    if (value.isNotEmpty) {
      if (SignUpRegExp.regExp_name.hasMatch(value)) {
        setState(() {
          isValidate_name = true;
        });
        log('VALIDATE : $value  : $isValidate_name');
      } else {
        setState(() {
          isValidate_name = false;
        });
        log('VALIDATE ERROR: $value  : $isValidate_name');
        return 'Errore: formato non corretto.';
      }
    } else {
      return 'Attenzione! Questo campo non può essere vuoto.';
    }
  }

  validateSurname(String value) {
    if (value.isNotEmpty) {
      if (SignUpRegExp.regExp_surname.hasMatch(value)) {
        setState(() {
          isValidate_surname = true;
        });
        log('VALIDATE : $value  : $isValidate_surname');
      } else {
        setState(() {
          isValidate_surname = false;
        });
        log('VALIDATE ERROR: $value  : $isValidate_surname');
        return 'Errore: formato non corretto.';
      }
    } else {
      return 'Attenzione! Questo campo non può essere vuoto.';
    }
  }

  validateFiscalCode(String value) {
    if (value.isNotEmpty) {
      if (SignUpRegExp.regExp_CF.hasMatch(value)) {
        setState(() {
          isValidate_cf = true;
        });
        log('VALIDATE : $value  : $isValidate_cf');
      } else {
        setState(() {
          isValidate_cf = false;
        });
        log('VALIDATE ERROR: $value  : $isValidate_cf');
        return 'Errore: formato non corretto.';
      }
    } else {
      return 'Attenzione! Questo campo non può essere vuoto.';
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
      return 'Attenzione! Questo campo non può essere vuoto.';
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
      return 'Attenzione! Questo campo non può essere vuoto.';
    }
  }

  signUpCallMethod() async {
    Paziente paziente = Paziente(
        nome: 'mario',
        cognome: 'rossi',
        email: 'email',
        cf: 'pwasdfs',
        dataNascita: '',
        password: '');
    await RestClient.registrazionePaziente(paziente);
    log('USER REGISTER');
  }
}
