import 'dart:convert';

import 'package:bloc_demo/model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final String _url = 'https://www.boredapi.com/api/activity';

  Future<ModelData?> fetchApi() async {
    try {
      http.Response response = await http.get(Uri.parse(_url));
      var data = json.decode(response.body);
      return ModelData.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
      // return ModelData.withError("Data not found / Connection issue");
    }
  }
}
