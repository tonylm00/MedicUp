import 'package:flutter/material.dart';

import '../pages/signin.dart';
import '../utils/ColorUtils.dart';
import '../utils/CommonStyle.dart';
import '../utils/routes.dart';

class SignInWidget {
  final LoginFormWidgetState state;
  SignInWidget(this.state) : super();

  Widget getView(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 8,
            child: Column(
              children: <Widget>[
                _buildLogo(),
                _buildIntroText(),
                toggleOptions(),
                state.isPaziente
                    ? _buildEmailField(context)
                    : _buildMedIdField(context),
                _buildPasswordField(context),
                SizedBox(
                  height: 30,
                ),
                //_buildForgotPasswordWidget(context),
                _buildSignUpButton(context),
              ],
            ),
          ),
          _buildSignUp(),
        ],
      ),
    );
  }

  Widget toggleOptions() {
    return GestureDetector(
      onTap: () {
        state.setState(() {
          state.toggle = !state.toggle;
          state.isPaziente = !state.isPaziente;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: state.toggle
                    ? ColorUtils.gradientStart
                    : ColorUtils.lightPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Text(
                'Paziente',
                style: TextStyle(
                  color: state.toggle ? Colors.white : Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: state.toggle
                    ? ColorUtils.lightPrimary
                    : ColorUtils.gradientStart,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Text(
                'Medico',
                style: TextStyle(
                  color: state.toggle ? Colors.black : Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
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
                fontSize: 23.0,
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

  String? _userPasswordValidation(String value) {
    if (value.isEmpty) {
      return "Inserisci una password valida";
    } else {
      return null;
    }
  }

  Widget _buildMedIdField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.medIdController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          state.setState(() {
            state.isSubmittedMedId = true;
          });
          FocusScope.of(context).requestFocus(state.passwordFocusNode);
        },
        validator: (value) => state.validateMedCode(value!),
        decoration:
            CommonStyles.textFormFieldStyle("Identificativo Medico", ""),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.userEmailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          /* if (value.isNotEmpty)
            state.setState(() {
              state.isSubmittedEmail = true;
            }); */
          FocusScope.of(context).requestFocus(state.passwordFocusNode);
        },
        //validator: (value) => state.validateEmail(value!),
        decoration: CommonStyles.textFormFieldStyle("Email", ""),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.userPasswordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(state.emailFocusNode);
          /*  if (value.isNotEmpty)
            state.setState(() {
              state.isSubmittedPassword = true;
            }); */
        },
        // validator: (value) => state.validatePassword(value!),
        obscureText: state.isPasswordVisible,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "",
          labelStyle: const TextStyle(color: Colors.black, fontSize: 21),
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                state.setState(() {
                  state.isPasswordVisible = !state.isPasswordVisible;
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
                  color: ColorUtils.gradientStart,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
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
          child: Visibility(
              /*  visible: (state.isSubmittedEmail || state.isSubmittedMedId) &&
                  (state.isSubmittedPassword), */
              child: ElevatedButton(
            onPressed: () {
              (state.isPaziente)
                  ? state.signInCallMethod_Paziente()
                  : state.signInCallMethod_Medico();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtils.accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
          ))),
    );
  }

  Widget _buildSignUp() {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                "Non hai un account ? ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(state.context, Routes.signup);
                  },
                  child: const Text(
                    'Registrati',
                    style: TextStyle(
                        color: ColorUtils.gradientStart,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  )),
            ],
          ),
        ));
  }
}
