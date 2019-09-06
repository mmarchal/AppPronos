import 'dart:io';
import 'package:http/http.dart' as http;

const url = "https://matchendirect-api.herokuapp.com/classement/pays";

class Api {

  static Future getRanking(String pays, String nom) {
    var urlRequest = "$url/$pays/championnat/$nom";
    print(urlRequest);
    return http.get(urlRequest);
  }

}