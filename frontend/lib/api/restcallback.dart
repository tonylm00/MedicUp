import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/model_object/farmaco.dart';
import 'package:frontend/model_object/farmacoArmadietto.dart';
import 'package:frontend/model_object/medico.dart';
import 'package:frontend/model_object/paziente.dart';
import 'package:http/http.dart' as http;

class Environmments {
  static const ENV_API = "http://tonylm.pythonanywhere.com";
}

class RestCallback {
  static const TAG = "REST CALL ";

  static const ONLINE_API_ENV = Environmments.ENV_API;

  // API ENDPOINT PATH
  static const String _apiUrl = '/api';

  // API SERVER URL
  static const String _onlineUrl = ONLINE_API_ENV + _apiUrl;

  static const String _baseUrl = _onlineUrl;

  static Future makePost(String path,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      String url = _baseUrl + path;

      headers ??= Map<String, String>();
      headers['content-type'] = 'application/json';

      var httpResponse;
      var client = http.Client();

      httpResponse = await client.post(
        headers: headers,
        Uri.parse(url),
        body: json.encode(data),
      );
      return httpResponse;
    } on Exception catch (e) {
      return throw Exception('Failed to make post call');
    }
  }

  static Future makeGet(String path,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      String url = _baseUrl + path;

      headers ??= Map<String, String>();
      headers['content-type'] = 'application/json';

      var httpResponse;
      var client = http.Client();

      httpResponse = await client.get(
        headers: headers,
        Uri.parse('$url'),
      );
      return httpResponse;
    } on Exception catch (e) {
      return throw Exception('Failed to make post call');
    }
  }

  //********************************************************************************
  //  REGISTRAZIONE
  //********************************************************************************

/**
 * PAZIENTE
 */

  static Future<dynamic> registrazionePaziente(Paziente paziente) async {
    try {
      Map<String, dynamic> mapToSend = {};

      if (paziente != null) {
        if (paziente.nome!.isNotEmpty) {
          mapToSend['nome'] = paziente.nome;
        }
        if (paziente.cognome!.isNotEmpty) {
          mapToSend['cognome'] = paziente.cognome;
        }
        if (paziente.cf!.isNotEmpty) {
          mapToSend['cf'] = paziente.cf;
        }
        if (paziente.dataNascita!.isNotEmpty) {
          mapToSend['data_nascita'] = paziente.dataNascita;
        }
        if (paziente.email!.isNotEmpty) {
          mapToSend['email'] = paziente.email;
        }
        if (paziente.password!.isNotEmpty) {
          mapToSend['password'] = paziente.password;
        }
      }

      final response =
          await makePost('/paziente/registration/', data: mapToSend);

      if (response.statusCode == 200) {
        log("${TAG} REGISTRAZIONE paziente: SUCCESS");

        return json.decode(response.body);
      }
      return response.body;
    } catch (e) {
      log("${TAG} REGISTRAZIONE paziente: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

/**
 * MEDICO
 */

  static Future<dynamic> registrazioneMedico(Medico medico) async {
    try {
      Map<String, dynamic> dataToSend = {};

      if (medico != null) {
        if (medico.nome!.isNotEmpty) {
          dataToSend['nome'] = medico.nome;
        }
        if (medico.cognome!.isNotEmpty) {
          dataToSend['cognome'] = medico.cognome;
        }
        if (medico.fnomceo!.isNotEmpty) {
          dataToSend['fnomceo'] = medico.fnomceo;
        }

        if (medico.email!.isNotEmpty) {
          dataToSend['email'] = medico.email;
        }
        if (medico.password!.isNotEmpty) {
          dataToSend['password'] = medico.password;
        }
      }

      final response =
          await makePost('/dottore/registration/', data: dataToSend);

      if (response.statusCode == 200) {
        log("${TAG} REGISTRAZIONE medico: SUCCESS");
        log(json.decode(response.body));

        return json.decode(response.body);
      }
      return response.body;
    } catch (e) {
      log("${TAG} REGISTRAZIONE medico: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  //********************************************************************************
  //  LOGIN
  //********************************************************************************

/**
 * PAZIENTE
 */

  static Future<dynamic> loginPaziente(String email, String password) async {
    try {
      Paziente paziente = Paziente();
      if (email != null && password != null) {
        final response =
            await makeGet('/paziente/login/?email=$email&password=$password');

        if (response.statusCode == 200) {
          log("${TAG} LOGIN paziente: SUCCESS");
          log(response.body);

          paziente = Paziente.fromJson(json.decode(response.body));
        }
      }
      return paziente;
    } catch (e) {
      log("${TAG} LOGIN paziente: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  /**
 * MEDICO
 */
  static Future<dynamic> loginMedico(String fnomceo, String password) async {
    try {
      Medico medico = Medico();

      final response =
          await makeGet('/dottore/login/?fnomceo=$fnomceo&password=$password');

      if (response.statusCode == 200) {
        log("${TAG} LOGIN medico: SUCCESS");
        log(response.body);

        medico = Medico.fromJson(json.decode(response.body));
      }
      return medico;
    } catch (e) {
      log("${TAG} LOGIN medico: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  //********************************************************************************
  //  FARMACI
  //********************************************************************************
  static Future<List<dynamic>> listaFarmaci() async {
    try {
      final response = await makeGet('/farmaco/');

      List<Farmaco> list = [];

      if (response.statusCode == 200) {
        log("${TAG} LISTA FARMACI: SUCCESS");
        // log(response.body);
        List<dynamic> mapList = [{}];
        mapList = json.decode(response.body);

        for (int i = 0; i < mapList.length; i++) {
          list.add(Farmaco.fromJson(mapList[i]));
        }
      }

      return list;
    } catch (e) {
      log("${TAG} LISTA FARMACI: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> detailFarmaco(int? id) async {
    try {
      final response = await makeGet('/farmaco/$id');

      Farmaco farmaco = Farmaco();

      if (response.statusCode == 200) {
        log("${TAG} DETTAGLIO FARMACO: SUCCESS");
        log(response.body);
        farmaco = Farmaco.fromJson(json.decode(response.body));
        log(farmaco.toString());
      }
      return farmaco;
    } catch (e) {
      log("${TAG} DETTAGLIO FARMACO: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  //********************************************************************************
  //  RICERCA FARMACI
  //********************************************************************************

/**
 * PER NOME
 */

  static Future<dynamic> ricercaFarmacoNome(String nome) async {
    try {
      final response = await makeGet('/farmaco/cerca/nome/?nome=$nome');

      Farmaco farmaco = Farmaco();

      if (response.statusCode == 200) {
        log("${TAG} RICERCA PER NOME FARMACO: SUCCESS");
        log(response.body);
        farmaco = Farmaco.fromJson(json.decode(response.body));
        log(farmaco.toString());
      }
      return farmaco;
    } catch (e) {
      log("${TAG} RICERCA PER NOME FARMACO: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

/**
 * PER PRINCIPIO ATTIVO
 */

  static Future<dynamic> ricercaFarmacoPrincipio(String principio) async {
    try {
      final response =
          await makeGet('/farmaco/cerca/principio/principio=$principio');

      Farmaco farmaco = Farmaco();

      if (response.statusCode == 200) {
        log("${TAG} RICERCA PER PRINCIPIO FARMACO: SUCCESS");
        log(response.body);
        farmaco = Farmaco.fromJson(json.decode(response.body));
        log(farmaco.toString());
      }
      return farmaco;
    } catch (e) {
      log("${TAG} RICERCA PER PRINCIPIO FARMACO: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  //********************************************************************************
  //  ARMADIETTO
  //********************************************************************************

  static Future<List<dynamic>> armadietto(int idPaziente) async {
    try {
      final response = await makeGet('/armadietto/?paziente=1');

      List<FarmacoArmadietto> list = [];

      if (response.statusCode == 200) {
        log("${TAG} ARMADIETTO: SUCCESS");
        // log(response.body);
        List<dynamic> mapList = [{}];
        mapList = json.decode(response.body);

        for (int i = 0; i < mapList.length; i++) {
          list.add(FarmacoArmadietto.fromJson(mapList[i]));
        }
      }

      return list;
    } catch (e) {
      log("${TAG} ARMADIETTO: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> addFarmaco(int idPaziente, int idFarmaco,
      String scadenza, String quantity, String type) async {
    try {
      Map<String, dynamic> dataToSend = {};

      if (idPaziente != null) {
        dataToSend['paziente'] = idPaziente;
      }
      if (idFarmaco != null) {
        dataToSend['farmaco'] = idFarmaco;
      }
      if (scadenza.isNotEmpty) {
        dataToSend['scadenza'] = scadenza;
      }

      if (quantity != null) {
        dataToSend['quantity'] = quantity;
      }
      if (type.isNotEmpty) {
        dataToSend['type'] = type;
      }

      final response =
          await makePost('/armadietto/aggiungifarmaco/', data: dataToSend);

      if (response.statusCode == '201 Created') {
        log("${TAG} ARMADIETTO: SUCCESS");
        
      }
      return response.body;
    } catch (e) {
      log("${TAG} ARMADIETTO: Error ${e.toString()}");

      throw Exception('Failed to load data');
    }
  }

  //********************************************************************************
  //  PROMEMORIA
  //********************************************************************************

}
