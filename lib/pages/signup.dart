/* import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:momento_medico/UI/signup_widget.dart';

import '../utils/AppColors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController nome_ctrl = TextEditingController();
  TextEditingController cognome_ctrl = TextEditingController();
  TextEditingController idUtente_ctrl = TextEditingController();

  TextEditingController mail_ctrl = TextEditingController();
  TextEditingController password_ctrl = TextEditingController();

  bool isPaziente = false;
  bool isMedico = false;
  bool show = true;

  String labelSignup = 'Registrazione';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'MedicUP - Registrazione',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.medicUpColor,
        ),
        backgroundColor: AppColors.backgroundLight,
        body: SignUpWidget(this).getView(context),
      );

  onChangePaziente() {
    setState(() {
      isPaziente = true;
      labelSignup = 'Registrazione Paziente';
      show = false;
    });
  }

  onChangeMedico() {
    setState(() {
      isMedico = true;
      labelSignup = 'Registrazione Medico';
      show = false;
    });
  }
}
 */

import 'package:flutter/material.dart';
import 'package:momento_medico/UI/signup_widget.dart';

import '../utils/ColorUtils.dart';
import '../utils/CommonStyle.dart';

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
  var userEmailController = TextEditingController(text: "jm1@example.com");
  var userPasswordController = TextEditingController(text: "jay@123");
  final userNameController = TextEditingController(text: "Mario");
  final userSurnameController = TextEditingController(text: "Rossi");
  final userCFController = TextEditingController(text: "CSLMTN98R63I422K");
  final medIdController = TextEditingController(text: "Med001");

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  final surnameFocusNode = FocusNode();
  final userCfFocusNode = FocusNode();

  bool toggle = true;
  bool isPaziente = true;
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) => SignUpWidget(this).getView(context);
}
