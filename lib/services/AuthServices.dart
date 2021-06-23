import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthServices {
  static String baseUrl = "https://reqres.in";
  var client = http.Client();

  static Future<dynamic> login({String email, String password}) async {
    var pathname = baseUrl + "/api/login";
    var body = jsonEncode(
        {"email": email.toString(), "password": password.toString()});
    var response = await http.post(pathname,
        body: body, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
