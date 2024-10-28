import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kamusitest/translation/translationModel.dart';

class APIServices {
  static String baseUrl =
      "https://995f-197-186-26-121.ngrok-free.app/translator/api/translate/";

  static Future<TranslationModel?> fetchData(String name) async {
    Uri url = Uri.parse('$baseUrl$name');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TranslationModel.fromJson(data[0]);
      } else {
        throw Exception('Fail to load meaning');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
