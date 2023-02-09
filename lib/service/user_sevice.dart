import 'dart:convert';

import 'package:vericekme/models/user_models.dart';
import 'package:http/http.dart' as http;

class UserService {
  String url =
      "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=a2f6ce138e6c4e1880b92cc6357fb640";
  Future<Model?> get() async {
    var res = await http.get(Uri.parse(url));
    if (res.body.isNotEmpty) {
      var jsonBody = Model.fromJson(jsonDecode(res.body));
      return jsonBody;
    }
    return null;
  }
}
