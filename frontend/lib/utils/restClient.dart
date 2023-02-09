// ignore_for_file: constant_identifier_names, prefer_conditional_assignment

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/model_object/medico.dart';
import 'package:frontend/model_object/paziente.dart';

import 'package:http/http.dart' as clientHttp;

import '../model_object/farmaco.dart';
import 'ResponseMessage.dart';

class Environmments {
  static const ENV_API = "http://tonylm.pythonanywhere.com";
}

class RestClient {
  static const TAG = "REST CLIENT";

  static const ONLINE_API_ENV = Environmments.ENV_API;

  // API ENDPOINT PATH
  static const String _apiUrl = '/api';

  // API SERVER URL
  static const String _onlineUrl = ONLINE_API_ENV + _apiUrl;

  static const String _baseUrl = _onlineUrl;

  static Future<ResponseMessage> _makePost(String path,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      String url = _baseUrl + path;

      if (path.startsWith('http://') || path.startsWith('https://')) url = path;

      if (headers == null) headers = Map<String, String>();
      headers['content-type'] = 'application/json';

      var httpResponse;

      var client = clientHttp.Client();

      httpResponse = await client.post(
        headers: headers,
        Uri.parse(url),
        body: json.encode(data),
      );

      return ResponseMessage.buildOk();
    } on Exception catch (e) {
      return ResponseMessage.buildError();
    }
  }

  //********************************************************************************
  //  REGISTRAZIONE E LOGIN
  //********************************************************************************

/**
 * PAZIENTE
 */

  static Future<ResponseMessage> registrazionePaziente(
      Paziente paziente) async {
    try {
      //quey params, lista param paziente
      //return bool

      Map<dynamic, String> dataToSend = {};
      if (paziente != null) {
        if (paziente.nome.isNotEmpty) {
          dataToSend['nome'] = paziente.nome;
        }
      }
      ResponseMessage responseMessage =
          await _makePost("/paziente/registration/", data: dataToSend);
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          var paziente = Paziente.fromJson(responseMessage.data);
        }

        responseMessage.data = paziente;
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} REGISTRAZIONE paziente: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  ///bisogna differenziare medico da paziente anche nel login
  static Future<ResponseMessage> loginPaziente(Paziente paziente) async {
    try {
      //paziente, query params email e password --> Paziente (session manager)

      Map<dynamic, String> dataToSend = {};
      if (paziente != null) {
        if (paziente.nome.isNotEmpty) {
          dataToSend['nome'] = paziente.nome;
        }
      }
      ResponseMessage responseMessage =
          await _makePost("/login/", data: dataToSend);
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          var paziente = Paziente.fromJson(responseMessage.data);
        }

        responseMessage.data = paziente;
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} LOGIN paziente: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

/**
 * MEDICO
 */

  static Future<ResponseMessage> registrazioneMedico(Medico medico) async {
    try {
      //quey params, lista param medico
      //return bool

      Map<dynamic, String> dataToSend = {};
      if (medico != null) {
        if (medico.nome.isNotEmpty) {
          dataToSend['nome'] = medico.nome;
        }
      }
      ResponseMessage responseMessage =
          await _makePost("/dottore/registration", data: dataToSend);
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          var paziente = Paziente.fromJson(responseMessage.data);
        }

        responseMessage.data = medico;
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} REGISTRAZIONE medico: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  static Future<ResponseMessage> loginMedico(Medico medico) async {
    try {
      //medico, query params medcod e password --> Medico (session manager)

      Map<dynamic, String> dataToSend = {};
      if (medico != null) {
        if (medico.nome.isNotEmpty) {
          dataToSend['nome'] = medico.nome;
        }
      }
      ResponseMessage responseMessage =
          await _makePost("/login/", data: dataToSend);
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          var paziente = Paziente.fromJson(responseMessage.data);
        }

        responseMessage.data = medico;
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} LOGIN medico: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  //********************************************************************************
  //  FARMACI
  //********************************************************************************

  static Future<ResponseMessage> listaFarmaci() async {
    try {
      ResponseMessage responseMessage = await _makePost("/farmaco/");
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          List<FarmacoPaziente> lista = [];
          for (var j in responseMessage.data) {
            lista.add(FarmacoPaziente.fromJson(j));
          }

          responseMessage.data = lista;
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} LISTA farmaci: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  static Future<ResponseMessage> detailFarmaco({int? id}) async {
    try {
      //paziente view bugiardino (add campi Farmaco)
      //medico view schede RCP (add campi Farmaco)

      ResponseMessage responseMessage = await _makePost("/farmaco/$id");
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          FarmacoPaziente farmaco;

          farmaco = FarmacoPaziente.fromJson(responseMessage.data);

          responseMessage.data = farmaco;
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} DETTAGLI farmaco: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  //********************************************************************************
  //  LISTE GETTER
  //********************************************************************************

/**
 * LISTA PAZIENTI
 */
  static Future<ResponseMessage> listaPazienti() async {
    try {
      ResponseMessage responseMessage = await _makePost("/paziente/");
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          List<Paziente> list = [];
          for (var j in responseMessage.data) {
            list.add(Paziente.fromJson(j));
          }

          responseMessage.data = list;
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} LISTA pazienti: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

/**
 * LISTA MEDICI
 */
  static Future<ResponseMessage> listaMedici() async {
    try {
      ResponseMessage responseMessage = await _makePost("/dottore/");
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          List<Medico> list = [];
          for (var j in responseMessage.data) {
            list.add(Medico.fromJson(j));
          }

          responseMessage.data = list;
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} LISTA medici: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  //********************************************************************************
  //  ARMADIETTO
  //********************************************************************************

  static Future<ResponseMessage> armadietto() async {
    try {
      ResponseMessage responseMessage = await _makePost("/armadietto/");
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          //lista FarmacoArmadietto != Farmaco presenti in armadietto
          //oggetto paziente come query params

        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} ARMADIETTO : Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  static Future<ResponseMessage> addFarmaco(FarmacoPaziente farmaco) async {
    try {
      Map<String, dynamic> dataToSend = {};
      //query params oggetto Farmaco
      //da lista farmaci pulsante +

      if (farmaco != null) {
        dataToSend['farmaco'] = farmaco;
      }
      ResponseMessage responseMessage =
          await _makePost("/armadietto/aggiungifarmaco", data: dataToSend);
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          /*  FarmacoPaziente farmacoAggiunto = FarmacoPaziente(
              id: farmaco.id,
              nome: farmaco.nome,
              principio: farmaco.principio,
              descrizioneBug: farmaco.descrizioneBug,
              precauzioniBug: farmaco.precauzioniBug,
              controindicazioniBug: farmaco.controindicazioniBug,
              posologiaBug: farmaco.posologiaBug); */

          var farmacoAggiunto = FarmacoPaziente.fromJson(responseMessage.data);

          responseMessage.data = farmacoAggiunto;
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} ARMADIETTO nuovo farmaco: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  //********************************************************************************
  //  REMINDERS
  //********************************************************************************

  static Future<ResponseMessage> addReminder() async {
    try {
      Map<String, dynamic> dataToSend = {};

      ResponseMessage responseMessage =
          await _makePost("/reminders/", data: dataToSend);
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          /*  Farmaco farmacoAggiunto = Farmaco(
              id: farmaco.id,
              nome: farmaco.nome,
              principio: farmaco.principio,
              precauzioni: farmaco.precauzioni,
              controindicazioni: farmaco.controindicazioni,
              posologia: farmaco.posologia);

          Farmaco.fromJson(responseMessage.data);

          responseMessage.data = farmacoAggiunto; */
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} REMINDER creazione nuovo: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  /**
   * DOTTORE VIEW
   */

  static Future<ResponseMessage> getReminderMed() async {
    try {
      ResponseMessage responseMessage = await _makePost("/doctors/reminders/");
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          //definire lista reminders restituiti da chiamata

          /*  Farmaco farmacoAggiunto = Farmaco(
              id: farmaco.id,
              nome: farmaco.nome,
              principio: farmaco.principio,
              precauzioni: farmaco.precauzioni,
              controindicazioni: farmaco.controindicazioni,
              posologia: farmaco.posologia);

          Farmaco.fromJson(responseMessage.data);

          responseMessage.data = farmacoAggiunto; */
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} REMINDER condivisi medico: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }

  /**
   * PAZIENTE VIEW
   */

  static Future<ResponseMessage> getReminderPaziente() async {
    try {
      ResponseMessage responseMessage = await _makePost("/patients/reminders/");
      if (responseMessage.isOk()) {
        if (responseMessage.data != null) {
          //definire lista reminders restituiti da chiamata

          /*  Farmaco farmacoAggiunto = Farmaco(
              id: farmaco.id,
              nome: farmaco.nome,
              principio: farmaco.principio,
              precauzioni: farmaco.precauzioni,
              controindicazioni: farmaco.controindicazioni,
              posologia: farmaco.posologia);

          Farmaco.fromJson(responseMessage.data);

          responseMessage.data = farmacoAggiunto; */
        }
      }
      return responseMessage;
    } catch (e) {
      log("${TAG} REMINDER get lista: Error ${e.toString()}");
      return ResponseMessage.buildError();
    }
  }
}
