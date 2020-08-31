import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:drawTask/models/Product.dart';
import 'package:drawTask/service/IFoodService.dart';
import 'package:http/http.dart' as http;

class ProductService extends IFoodService {
  FutureOr<dynamic> getData(String path) async {
    final response = await http.get(baseUrl + path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          return jsonBody.map((e) => Product.fromJson(e)).toList();
        else
          return Product.fromJson(jsonBody);
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
          return jsonBody.map((e) => Product.fromJson(e)).toList();
        break;
      default:
        return null;
    }
  }
}
