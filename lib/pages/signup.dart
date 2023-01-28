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
      //  appBar: AppBar(surfaceTintColor: Colors.amber),
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
    return _LoginFormWidgetState();
  }
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  var _userEmailController = TextEditingController(text: "jm1@example.com");
  var _userPasswordController = TextEditingController(text: "jay@123");
  final _userNameController = TextEditingController(text: "Mario");
  final _userSurnameController = TextEditingController(text: "Rossi");
  final _userCFController = TextEditingController(text: "CSLMTN98R63I422K");

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _userCfFocusNode = FocusNode();

  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 8,
            child: Column(
              children: <Widget>[
                _buildLogo(),
                _buildIntroText(),
                _buildUserNameField(context),
                _buildUserSurnameField(context),
                _buildUserCfField(context),
                _buildEmailField(context),
                _buildPasswordField(context),
                _buildSignUpButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroText() {
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 30),
          child: Text(
            "Medic Up",
            style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(''),
    );
  }

  String? _userNameValidation(String value) {
    if (value.isEmpty) {
      return "Inserisci un nome utente valido";
    } else {
      return null;
    }
  }

  Widget _buildUserNameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userNameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_surnameFocusNode);
        },
        //validator: (value) => _emailValidation(value!),
        decoration: CommonStyles.textFormFieldStyle("Nome", ""),
      ),
    );
  }

  Widget _buildUserSurnameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userSurnameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_userCfFocusNode);
        },
        //validator: (value) => _emailValidation(value!),
        decoration: CommonStyles.textFormFieldStyle("Cognome", ""),
      ),
    );
  }

  Widget _buildUserCfField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userCFController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        //validator: (value) => _emailValidation(value!),
        decoration: CommonStyles.textFormFieldStyle("Codice Fiscale", ""),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userEmailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) => _emailValidation(value!),
        decoration: CommonStyles.textFormFieldStyle("Email", ""),
      ),
    );
  }

  String? _emailValidation(String value) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if (!emailValid) {
      return "Inserisci una e-mail valida";
    } else {
      return null;
    }
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: _userPasswordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        validator: (value) => _userNameValidation(value!),
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "",
          labelStyle: const TextStyle(color: Colors.black),
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              }),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: const Text(
              'Password dimenticata ?',
              style: TextStyle(
                  color: ColorUtils.gradientStart, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _signUpProcess(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtils.accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: const Text(
              "Registrati",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }

  void _signUpProcess(BuildContext context) {
    var validate = _formKey.currentState!.validate();

    if (validate) {
      //Do login stuff
    } else {
      setState(() {
        var _autoValidate = true;
      });
    }
  }

  void _clearAllFields() {
    setState(() {
      _userEmailController = TextEditingController(text: "");
      _userPasswordController = TextEditingController(text: "");
    });
  }
}
