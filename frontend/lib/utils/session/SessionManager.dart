import 'dart:developer';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import 'LoginData.dart';

enum _SessionField {
  Paziente,
  PazienteId,
  PazienteNome,
  PazienteCognome,
  PazienteCf,
  PazienteDataNascita,
  PazienteEmail,
  PazientePassword,
  Medico,
  MedicoId,
  MedicoFnomceo,
  MedicoNome,
  MedicoCognome,
  MedicoEmail,
  MedicoPassword
}

class SessionManager {
  static Future<String> _getField(_SessionField field) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(field.toString());
  }

  static Future<String> getPaziente() async {
    return _getField(_SessionField.Paziente);
  }

  static Future<Future<String>> getPazienteId() async {
    return _getField(_SessionField.PazienteId);
  }

  static Future<String> getPazienteNome() async {
    return _getField(_SessionField.PazienteNome);
  }

  static Future<String> getPazienteCognome() async {
    return _getField(_SessionField.PazienteCognome);
  }

  static Future<String> getPazienteCf() async {
    return _getField(_SessionField.PazienteCf);
  }

  static Future<String> getPazienteDataNascita() async {
    return _getField(_SessionField.PazienteDataNascita);
  }

  static Future<String> getPazienteEmail() async {
    return _getField(_SessionField.PazienteEmail);
  }

  static Future<String> getPazientePassword() async {
    return _getField(_SessionField.PazientePassword);
  }

  static Future<String> getMedico() async {
    return _getField(_SessionField.Medico);
  }

  static Future<String> getMedicoId() async {
    return _getField(_SessionField.MedicoId);
  }

  static Future<String> getMedicFnomceo() async {
    return _getField(_SessionField.MedicoFnomceo);
  }

  static Future<String> getMedicoNome() async {
    return _getField(_SessionField.MedicoNome);
  }

  static Future<String> getMedicoCognome() async {
    return _getField(_SessionField.MedicoCognome);
  }

  static Future<String> getMedicoEmail() async {
    return _getField(_SessionField.MedicoEmail);
  }

  static Future<String> getMedicoPassword() async {
    return _getField(_SessionField.MedicoPassword);
  }

  static Future<void> setSessionFromLogin(LoginData loginData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _SessionField.Paziente.toString(), loginData.paziente.toString());

    await prefs.setInt(
        _SessionField.PazienteId.toString(), loginData.paziente.id);
    await prefs.setString(
        _SessionField.PazienteNome.toString(), loginData.paziente.nome);
    await prefs.setString(
        _SessionField.PazienteCognome.toString(), loginData.paziente.cognome);
    await prefs.setString(
        _SessionField.PazienteCf.toString(), loginData.paziente.cf);
    await prefs.setString(_SessionField.PazienteDataNascita.toString(),
        loginData.paziente.dataNascita);
    await prefs.setString(
        _SessionField.PazienteEmail.toString(), loginData.paziente.email);
    await prefs.setString(
        _SessionField.PazientePassword.toString(), loginData.paziente.password);

    await prefs.setString(
        _SessionField.Medico.toString(), loginData.medico.toString());

    await prefs.setInt(_SessionField.MedicoId.toString(), loginData.medico.id);

    await prefs.setString(
        _SessionField.MedicoNome.toString(), loginData.medico.nome);
    await prefs.setString(
        _SessionField.MedicoCognome.toString(), loginData.medico.cognome);
    await prefs.setString(
        _SessionField.MedicoFnomceo.toString(), loginData.medico.fnomceo);
    await prefs.setString(
        _SessionField.MedicoEmail.toString(), loginData.medico.email);
    await prefs.setString(
        _SessionField.MedicoPassword.toString(), loginData.medico.password);
  }

  static void clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _SessionField.values.forEach((element) async {
      await prefs.remove(element.toString());
    });
  }
}
