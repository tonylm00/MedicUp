import 'dart:convert';
import 'dart:html';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as clientHttp;

import 'ResponseMessage.dart';

class Environmments {
  static final ENV_ = "";
}

class RestClient {
  static final TAG = "";

  static final LOCALHOST_ENV = Environmments.ENV_;

// PATH
  static final String _atlasPath = '/atlas';

  // API ENDPOINT PATH
  static final String _apiUrl = '/api/v1.0/customer';

  // API SERVER URL
  static final String _localhostUrl = LOCALHOST_ENV + _atlasPath + _apiUrl;

  static final String _baseUrl =
      (window.location.origin.contains("localhost") ||
              window.location.origin.contains("svil.dizme.io"))
          ? _localhostUrl
          : window.location.origin + _atlasPath + _apiUrl;

  static Future<ResponseMessage> _makePost(String path,
      {dynamic data, Map<String, dynamic>? headers}) async {
    String mn = "_makePost";
    try {
      String url = _baseUrl + path;

      if (path.startsWith('http://') || path.startsWith('https://')) url = path;

      if (headers == null) headers = Map<String, String>();
      headers['content-type'] = 'application/json';
      headers['accept'] = 'application/json';
/* 
      dynamic sessionId = await SessionManager.getSessionToken();
      dynamic apiToken = await SessionManager.getApiToken();

      if (apiToken != null) {
        headers['X-Auth-Token'] = apiToken.toString();
      }
      if (sessionId != null) {
        headers['Sessionid'] = sessionId.toString();
      } */

      var httpResponse;
      var client = clientHttp.Client();
      if (data != null)
        data = json.encode(data);
      else

        // ignore: curly_braces_in_flow_control_structures
        httpResponse = await client.post(
          Uri.parse(url),
          body: data, /* headers: headers */
        );

      //  var httpResponse = await dio.post(url, data: data);

      if (httpResponse.statusCode == 401) {
        return ResponseMessage.buildWrongData();
      }
      if (!statusCodeOk(httpResponse.statusCode)) {
        return ResponseMessage.buildError();
      }

      if (httpResponse.body == null) {
        return ResponseMessage.buildError();
      }
      ResponseMessage resp = ResponseMessage.fromJson(
          json.decode(utf8.decode(httpResponse.bodyBytes)));
      if (resp.statusCode == null) {
        return ResponseMessage.buildError();
      }
      if (resp.statusCode != ResponseMessageCode.SUCCESS) {
        return resp;
      }
      return ResponseMessage.buildOk(data: resp.data);
    } on Exception catch (e) {
      return ResponseMessage.buildError();
    }
  }

  static bool statusCodeOk(int statusCode) {
    return statusCode < 299;
  }
  //********************************************************************************
  //********************************************************************************
  // PUBLIC
  //********************************************************************************
  //********************************************************************************

  static Future<Dio> getDioWithBaseHeaders() async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 30000;
    dio.options.headers['content-type'] = 'application/json';
    dio.options.headers['accept'] = 'application/json';
    return dio;
  }

  static Future<Dio> getDioWithSessionHeaders() async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 30000;
    dio.options.headers['content-type'] = 'application/json';
    dio.options.headers['accept'] = 'application/json';

    /* dynamic sessionId = await SessionManager.getSessionToken();
    dynamic apiToken = await SessionManager.getApiToken();

    if (apiToken != null) {
      dio.options.headers['X-Auth-Token'] = apiToken;
    }
    if (sessionId != null) {
      dio.options.headers['Sessionid'] = sessionId;
    } */
    return dio;
  }

  //********************************************************************************
  // PAYMENTS ACTIVITY
  //********************************************************************************

/**
 * Token by Customer
 */
  /* static Future<ResponseMessage> customersToken(
      String start_time, String end_time,
      {String org_bc}) async {
    try {
      final org = org_bc ?? await SessionManager.getBusinessCode();

      ResponseMessage responseMessage = await _makePost(
          "/token_gain_loss/$org?start_time=$start_time&end_time=$end_time");
      if (responseMessage.isOk()) {
        List<CustomersToken> list = [];
        if (responseMessage.data != null && responseMessage.data is List) {
          for (var j in responseMessage.data) {
            list.add(CustomersToken.fromJson(j));
          }
        }
        responseMessage.data = list;
      }
      return responseMessage;
    } catch (e) {
      MyLog.e(TAG, "getCustomersToken: Error $e");
      return ResponseMessage.buildError();
    }
  } */
}
