import 'package:flutter/material.dart';
import 'package:frontend/utils/AppColors.dart';
import 'package:intl/intl.dart';

import '../pages/signup.dart';
import '../utils/ColorUtils.dart';
import '../utils/CommonStyle.dart';
import '../utils/routes.dart';

class SignUpWidget {
  final RegisterFormWidgetState state;
  SignUpWidget(this.state) : super();

  Widget getView(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Column(
        children: <Widget>[
          Visibility(
            visible: state.isFirstPage,
            child: firstPage(context),
          ),
          Visibility(visible: state.isSecondPage, child: secondPage(context)),
          state.isPaziente
              ? Visibility(
                  visible: (state.isThirdPage), child: thirdPage(context))
              : Visibility(
                  visible: state.isFourthPage, child: fourthPage(context)),
          state.isPaziente
              ? Visibility(
                  visible: state.isFourthPage, child: fourthPage(context))
              : Container()
        ],
      ),
    );
  }

  Widget firstPage(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          //  progressIndicator(context),

          const SizedBox(
            height: 40,
          ),
          _buildIntroText(),
          const SizedBox(
            height: 40,
          ),
          toggleOptions(),
          const SizedBox(
            height: 30,
          ),
          //navigator
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        state.setState(() {
                          Navigator.pushNamed(context, Routes.signin);
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "Indietro",
                          style: TextStyle(
                              color: ColorUtils.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        state.setState(() {
                          state.isFirstPage = false;
                          state.isSecondPage = true;
                        });
                        state.nextStep();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "Avanti",
                          style: TextStyle(
                              color: ColorUtils.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ]),
          )
        ],
      ),
    );
  }

  Widget secondPage(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          // progressIndicator(context),
          const SizedBox(
            height: 40,
          ),
          insertDati(),
          _buildUserNameField(context),
          _buildUserSurnameField(context),
          (state.isPaziente)
              ? _buildUserCfField(context)
              : _buildMedIdField(context),
          const SizedBox(
            height: 40,
          ),
          (state.isPaziente)
              ?
              //navigator
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              state.setState(() {
                                state.isFirstPage = true;
                                state.isSecondPage = false;
                              });
                              state.previuosStep();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Indietro",
                                style: TextStyle(
                                    color: ColorUtils.primaryColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              state.setState(() {
                                state.isSecondPage = false;
                                state.isThirdPage = true;
                              });
                              state.nextStep();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Avanti",
                                style: TextStyle(
                                    color: ColorUtils.primaryColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ]),
                )
              : //navigator
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              state.setState(() {
                                state.isFirstPage = true;
                                state.isSecondPage = false;
                              });
                              state.previuosStep();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Indietro",
                                style: TextStyle(
                                    color: ColorUtils.primaryColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              state.setState(() {
                                state.isSecondPage = false;
                                state.isFourthPage = true;
                              });
                              state.nextStep();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Avanti",
                                style: TextStyle(
                                    color: ColorUtils.primaryColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ]),
                )
        ],
      ),
    );
  }

  Widget thirdPage(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
//          progressIndicator(context),

          const SizedBox(
            height: 40,
          ),
          insertDati(),
          _builCheck18(context),
          (state.isChecked) ? _buildUserBirthDateField(context) : Container(),
          const SizedBox(
            height: 40,
          ),

          //navigator
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        state.setState(() {
                          state.isThirdPage = false;
                          state.isSecondPage = true;
                        });
                        state.previuosStep();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "Indietro",
                          style: TextStyle(
                              color: ColorUtils.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        state.setState(() {
                          state.isThirdPage = false;
                          state.isFourthPage = true;
                        });
                        state.nextStep();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "Avanti",
                          style: TextStyle(
                              color: ColorUtils.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ]),
          )
        ],
      ),
    );
  }

  Widget fourthPage(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          // progressIndicator(context),
          const SizedBox(
            height: 40,
          ),
          insertDati(),
          _buildEmailField(context),
          _buildPasswordField(context),
          builCheckPrivacy(context),

          _buildSignUpButton(context),

          const SizedBox(
            height: 40,
          ),
          (state.isPaziente)
              ?
              //navigator
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              state.setState(() {
                                state.isFourthPage = false;
                                state.isThirdPage = true;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Indietro",
                                style: TextStyle(
                                    color: ColorUtils.primaryColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ]),
                )
              : Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              state.setState(() {
                                state.isFourthPage = false;
                                state.isSecondPage = true;
                              });
                              state.previuosStep();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Indietro",
                                style: TextStyle(
                                    color: ColorUtils.primaryColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ]),
                )
        ],
      ),
    );
  }

  Widget navigatorButtons(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TextButton(
            onPressed: () {
              state.setState(() {
                state.isFirstPage = false;
                state.isSecondPage = true;
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "Indietro",
                style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold),
              ),
            )),
        TextButton(
            onPressed: () {
              state.setState(() {
                state.isFirstPage = false;
                state.isSecondPage = true;
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "Avanti",
                style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ]),
    );
  }

  Widget insertDati() {
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
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Inserisci i tuoi dati : ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
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
          mainAxisAlignment: MainAxisAlignment.center,
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
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Scegli il tipo di utente che vuoi registrare : ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }

  Widget _buildNextTextFirst() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                state.setState(() {
                  state.isFirstPage = false;
                  state.isSecondPage = true;
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  "Avanti",
                  style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
        )
      ],
    );
  }

  Widget _buildNextTextSecond() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                state.setState(() {
                  state.isSecondPage = false;
                  state.isThirdPage = true;
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  "Avanti",
                  style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
        )
      ],
    );
  }

  Widget _buildNextTextThird() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                state.setState(() {
                  state.isThirdPage = false;
                  state.isFourthPage = true;
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  "Avanti",
                  style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
        )
      ],
    );
  }

  Widget _buildLogo() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(''),
    );
  }

  Widget _buildUserNameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.userNameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(state.surnameFocusNode);
        },
        validator: (value) => state.validateName(value!),
        decoration: CommonStyles.textFormFieldStyle("Nome", "es: Mario"),
      ),
    );
  }

  Widget _buildUserSurnameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.userSurnameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(state.userCfFocusNode);
        },
        validator: (value) => state.validateSurname(value!),
        decoration: CommonStyles.textFormFieldStyle("Cognome", "es: Rossi"),
      ),
    );
  }

  selectDate(BuildContext context) {
    return Text(
        "Selected date: ${DateFormat.yMMMMd().format(state.selectedDate)}");
  }

  Widget _buildUserBirthDateField(BuildContext context) {
    return Visibility(
        visible: state.isPaziente,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: TextFormField(
              controller: state.userDataNascitaController,
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(state.emailFocusNode);
              },
              validator: (value) => state.validateBirthDate(value!),
              decoration: CommonStyles.textFormFieldStyle(
                  "Data di Nascita", "es: 23/10/1998"),
            )));
  }

  Widget _buildUserCfField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.userCFController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(state.emailFocusNode);
        },
        validator: (value) => state.validateFiscalCode(value!),
        decoration: CommonStyles.textFormFieldStyle(
            "Codice Fiscale", "es: CSLMTN98R63I422K"),
      ),
    );
  }

  Widget _builCheck18(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Checkbox(
              value: state.isChecked,
              onChanged: (value) {
                state.setState(() {
                  state.isChecked = value!;
                });
              },
            ),
          ),
          const Text(
            "Ho almeno 18 anni",
            style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget builCheckPrivacy(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: state.isAccepted,
            onChanged: (value) {
              state.setState(() {
                state.isAccepted = value!;
              });
            },
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "Ho letto e accetto la ",
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: "politica sulla privacy",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedIdField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.medIdController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(state.emailFocusNode);
        },
        validator: (value) => state.validateMedCode(value!),
        decoration: CommonStyles.textFormFieldStyle(
            "Identificativo Medico", "es: 2310980MED1"),
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
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(state.passwordFocusNode);
        },
        validator: (value) => state.validateEmail(value!),
        decoration:
            CommonStyles.textFormFieldStyle("Email", "es: jm1@example.com"),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: state.userPasswordController,
        keyboardType: TextInputType.visiblePassword,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(state.emailFocusNode);
        },
        validator: (value) => state.validatePassword(value!),
        obscureText: state.isPasswordVisible,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "es: SecurePassword1@",
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
                  color: ColorUtils.gradientStart, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Visibility(
        visible: state.isAccepted,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  state.nextStep();
                  state.signUpPaziente();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtils.accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: const Text(
                  "Registrati",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              )),
        ));
  }

  void _signUpProcess(BuildContext context) {
    var validate = state.formKey.currentState!.validate();

    if (validate) {
      //Do login stuff
    } else {
      state.setState(() {
        var _autoValidate = true;
      });
    }
  }

  void _clearAllFields() {
    state.setState(() {
      state.userEmailController = TextEditingController(text: "");
      state.userPasswordController = TextEditingController(text: "");
    });
  }

  Widget _buildSignIn() {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                "Hai già un account ? ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(state.context, Routes.signin);
                  },
                  child: const Text(
                    'Accedi',
                    style: TextStyle(
                        color: ColorUtils.gradientStart,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  )),
            ],
          ),
        ));
  }
/* 
  Widget progressIndicator(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          state.isPaziente
              ? Container(
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.medicUpColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: state.step / 4,
                      backgroundColor: ColorUtils.lightTransPrimary,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.medicUpColor,
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.medicUpColor,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: LinearProgressIndicator(
                      value: state.step / 3,
                      backgroundColor: ColorUtils.lightTransPrimary,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.medicUpColor,
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  } */
}
