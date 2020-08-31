import 'dart:async';

abstract class IFoodService {
  final String baseUrl = "https://hasansahin.net/api/";
  FutureOr<dynamic> getData(String path);
  FutureOr<dynamic> postData(String path, dynamic values);
}
