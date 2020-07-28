import 'dart:convert';

import 'package:cricbubble/models/global.dart';
import 'package:http/http.dart' as http;

class CricbuzzAPI {
  // ignore: non_constant_identifier_names
  static final API_URL =
      "https://www.cricbuzz.com/api/cricket-match/commentary/";

  static String getMatchIdfromURL(String url) {
    return url.split('/')[4];
  }

  static Future<GlobalDataModel> getUpdates(String matchID) async {
    var data = await http.get(CricbuzzAPI.API_URL + matchID);
    return GlobalDataModel.fromJson(json.decode(data.body));
  }
}
