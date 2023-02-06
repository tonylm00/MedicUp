import 'package:shared_preferences/shared_preferences.dart';

import 'LoginData.dart';

enum _SessionField { Paziente, Medico }

class SessionManager {
  static Future<String> _getField(_SessionField field) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(field.toString());
  }

  static Future<String> isPaziente() async {
    return _getField(_SessionField.Paziente);
  }

  static Future<String> getMedico() async {
    return _getField(_SessionField.Medico);
  }

  static Future<void> setSessionFromLogin(LoginData loginData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _SessionField.Paziente.toString(), loginData.paziente.nome);
    await prefs.setString(
        _SessionField.Paziente.toString(), loginData.paziente.cognome);
    await prefs.setString(
        _SessionField.Paziente.toString(), loginData.paziente.cf);
    await prefs.setString(
        _SessionField.Paziente.toString(), loginData.paziente.dataNascita);
    await prefs.setString(
        _SessionField.Paziente.toString(), loginData.paziente.email);
    await prefs.setString(
        _SessionField.Paziente.toString(), loginData.paziente.password);

    await prefs.setString(
        _SessionField.Medico.toString(), loginData.medico.nome);
    await prefs.setString(
        _SessionField.Medico.toString(), loginData.medico.cognome);
    await prefs.setString(_SessionField.Medico.toString(), loginData.medico.id);
    await prefs.setString(
        _SessionField.Medico.toString(), loginData.medico.email);
    await prefs.setString(
        _SessionField.Medico.toString(), loginData.medico.password);
  }

  static void clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _SessionField.values.forEach((element) async {
      await prefs.remove(element.toString());
    });
  }
}
