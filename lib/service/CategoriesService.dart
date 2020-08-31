import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:drawTask/models/Categories.dart';
import 'package:drawTask/service/IFoodService.dart';
import 'package:http/http.dart' as http;

class CategoriesService extends IFoodService {
  FutureOr<dynamic> getData(String path) async {
    print(1);
    final response = await http.get(baseUrl + path);
    print(2);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          return jsonBody.map((e) => Categories.fromJson(e)).toList();
        else
          return Categories.fromJson(jsonBody);
        break;
      default:
    }
  }

  @override
  FutureOr<dynamic> postData(String path, dynamic values) async {
    final response = await http.post(baseUrl + path,
        headers: {"Accept": "application/json"}, body: values);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          return jsonBody.map((e) => Categories.fromJson(e)).toList();
        break;
      default:
        return null;
    }
  }
}
