import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:team_ayf/models/ApiResponse.dart';
import 'package:team_ayf/models/mail.dart';

const url = "https://matchendirect-api.herokuapp.com/classement/pays";

const serveurR = "http://85.168.125.64:8585";

class Api {

  static Future getRanking(String pays, String nom) {
    var urlRequest = "$url/$pays/championnat/$nom";
    return http.get(urlRequest);
  }

  static Future getToken() async {
    var urlToken = serveurR + "/token";
    Map data = {
      "username" : "marchal.maxime@live.fr",
      "password": "marchal"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
    return apiResponse;
  }

  static Future getPronos() async {
    var urlToken = serveurR + "/token";
    Map data = {
      "username" : "marchal.maxime@live.fr",
      "password": "marchal"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(urlToken,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
    var url = "$serveurR/pronostic/all";
    return http.get(url, headers: {
      HttpHeaders.authorizationHeader : "Bearer ${apiResponse.result.token}"
    });
  }

  static Future sendMail(Mail send) async {
    var urlToken = serveurR + "/token";
    Map data = {
      "username" : "marchal.maxime@live.fr",
      "password": "marchal"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(urlToken,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    var apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
    var url = "$serveurR/contact";
    var bodyMessage = json.encode(send);
    return await http.post(url, headers: {
      HttpHeaders.authorizationHeader : "Bearer ${apiResponse.result.token}",
      HttpHeaders.contentTypeHeader : "application/json",
      HttpHeaders.acceptCharsetHeader : "UTF-8",
      HttpHeaders.acceptHeader : "application/json"
    }, body: bodyMessage);
  }

}